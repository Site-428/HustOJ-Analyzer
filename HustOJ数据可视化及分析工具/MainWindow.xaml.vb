Imports MahApps.Metro.Controls
Imports System.Windows.Controls
Imports Microsoft.VisualBasic.FileIO.FileSystem

Class MainWindow
    Dim UpdateProgress As Dialogs.ProgressDialogController
    Dim Updater As Process = New Process
    Dim IsUpdateFinished As Boolean = False
    Dim EmptyList As New List(Of String)
    Private Sub RefreshList()
        lstProblemList.ItemsSource = EmptyList
        lstStudentList.ItemsSource = EmptyList
        lstStudentList.ItemsSource = StudentList
        lstProblemList.ItemsSource = ProblemList
    End Sub
    Private Async Sub mnuUpdate_Click(sender As Object, e As RoutedEventArgs) Handles mnuUpdate.Click
        IsUpdateFinished = False
        GenerateCurrentDirectory()
        Dim CurrentPath As String = GetCurrentDirectory()
        UpdateProgress = Await Dialogs.DialogManager.ShowProgressAsync(Me, "正在更新元数据", "正在从云端更新元数据，这可能需要几分钟的时间。" & vbCrLf & vbCrLf & "请勿关闭应用程序。", False)
        UpdateProgress.SetIndeterminate()
        With Updater
            .StartInfo.FileName = CurrentPath & "Data\StatusScraper.exe"
            .StartInfo.WorkingDirectory = CurrentPath & "Data\"
            .StartInfo.CreateNoWindow = True
            .EnableRaisingEvents = True
            .Start()
        End With
        AddHandler Updater.Exited, AddressOf Updater_Exit
        Do
            DoEvents()
        Loop Until IsUpdateFinished
        While Not IsUpdateFinished
            DoEvents()
        End While
        If UpdateProgress.IsOpen Then
            Await UpdateProgress.CloseAsync()
        End If
        Dim AnalyzeProgress As Dialogs.ProgressDialogController
        AnalyzeProgress = Await Dialogs.DialogManager.ShowProgressAsync(Me, "正在分析数据", "正在对OnlineJudge数据进行分析，这可能需要几分钟的时间。" & vbCrLf & vbCrLf & "请勿关闭应用程序。", False)
        '初始化
        StudentList.Clear()
        StudentDictionary.Clear()
        ProblemList.Clear()
        ProblemDictionary.Clear()
        lstStudentList.ItemsSource = StudentList
        lstProblemList.ItemsSource = ProblemList
        txtStudentSearch.Text = "搜索学生学号"
        txtStudentSearch.Foreground = SystemColors.ScrollBarBrush
        txtStudentSearch.Text = "搜索学生学号"
        txtStudentSearch.Foreground = SystemColors.ScrollBarBrush
        icoStudentLink.Foreground = SystemColors.GrayTextBrush
        btnStudentLink.IsEnabled = False
        btnStudentLink.Cursor = Cursors.Arrow
        icoProblemLink.Foreground = SystemColors.GrayTextBrush
        btnProblemLink.IsEnabled = False
        btnProblemLink.Cursor = Cursors.Arrow
        txtStudentID.Text = ""
        txtStudentSubmitCount.Text = ""
        txtStudentACCount.Text = ""
        txtStudentACRate.Text = ""
        txtStudentSubmitCountOnWorkdayAM.Text = ""
        txtStudentSubmitCountOnWorkdayPM.Text = ""
        txtStudentSubmitCountOnRestdayAM.Text = ""
        txtStudentSubmitCountOnRestdayPM.Text = ""
        txtFittingAC.Text = ""
        txtFittingK_Kb.Text = ""
        txtFittingR_Stb.Text = ""
        txtProblemID.Text = ""
        txtProblemSubmitCount.Text = ""
        txtProblemACCount.Text = ""
        txtProblemACRate.Text = ""
        txtEffortValue_Jq.Text = ""
        txtParticipateValuse_Eq.Text = ""
        txtStartDate.Text = ""
        txtEndDate.Text = ""
        pieStudentACRate.ItemsSource = Nothing
        linStudentSubmitByDay.ItemsSource = Nothing
        linStudentTotalSubmitByDayLn.ItemsSource = Nothing
        linStudentTotalSubmitByDayLnFit.ItemsSource = Nothing
        colStudentTotalSubmitByTime.ItemsSource = Nothing
        pieProblemACRate.ItemsSource = Nothing
        linNewProblemCountByDay.ItemsSource = Nothing
        colSubmitCountByTime.ItemsSource = Nothing
		
		'重新执行数据分析
        Dim OJLogFileReader As System.IO.StreamReader = New IO.StreamReader(CurrentPath & "Data\OJLOG.txt")
        Dim OJLogCountFileReader As System.IO.StreamReader = New IO.StreamReader(CurrentPath & "Data\DATA.txt")
        Dim OJLogLine As String
        Dim OJLogTemp As New OJLog
        Dim OJLogCountReal As Integer = 0
        OJLogCount = Int(OJLogCountFileReader.ReadLine())
        OJLogCountFileReader.Close()
        Dim StudentTemp As OJStudentInfo
        Dim ProblemTemp As OJProblemInfo
        StudentList.Clear()
        StudentDictionary.Clear()
        ProblemList.Clear()
        ProblemDictionary.Clear()
        OJSysInfo.NewProblemCount.Clear()
        Dim i As Integer
        For i = 0 To 23
            OJSysInfo.SubmitCountByHour(i) = 0
        Next
        While Not OJLogFileReader.EndOfStream
            OJLogLine = OJLogFileReader.ReadLine()
            OJLogTemp = ParseLog(OJLogLine)
            '确定是否在用户指定的分析范围内
            If OJLogTemp.DateSubmit < UserSpecifiedAnalyzeStartDate Or OJLogTemp.DateSubmit > UserSpecifiedAnalyzeEndDate Then
                If OJLogTemp.LogIndex = 1 Then
                    OJSysInfo.StartDate = OJLogTemp.DateSubmit
                End If
                If OJLogTemp.LogIndex = OJLogCount Then
                    OJSysInfo.EndDate = OJLogTemp.DateSubmit
                End If
                Continue While
            End If
            '此处加入详细分析代码
            '学生数据
            If StudentDictionary.ContainsKey(OJLogTemp.StudentID) Then
                With StudentDictionary(OJLogTemp.StudentID)
                    .SubmitCount += 1
                    If OJLogTemp.IsPassed Then
                        .ACCount += 1
                    End If
                    If .SubmitCountByDay.ContainsKey(OJLogTemp.DateSubmit) Then
                        .SubmitCountByDay(OJLogTemp.DateSubmit) += 1
                    Else
                        .SubmitCountByDay(OJLogTemp.DateSubmit) = 1
                    End If
                    .SubmitCountByHour(OJLogTemp.LogTime.Hour) += 1
                    If OJLogTemp.WeekdaySubmit >= 2 And OJLogTemp.WeekdaySubmit <= 6 Then
                        If OJLogTemp.LogTime.Hour >= 0 And OJLogTemp.LogTime.Hour < 12 Then
                            .SubmitCountOnWorkdayAM += 1
                        Else
                            .SubmitCountOnWorkdayPM += 1
                        End If
                    Else
                        If OJLogTemp.LogTime.Hour >= 0 And OJLogTemp.LogTime.Hour < 12 Then
                            .SubmitCountOnRestdayAM += 1
                        Else
                            .SubmitCountOnRestdayPM += 1
                        End If
                    End If
                End With
            Else
                StudentTemp = New OJStudentInfo(OJLogTemp.StudentID)
                StudentDictionary(OJLogTemp.StudentID) = StudentTemp
                StudentList.Add(OJLogTemp.StudentID)
                With StudentDictionary(OJLogTemp.StudentID)
                    .SubmitCount += 1
                    If OJLogTemp.IsPassed Then
                        .ACCount += 1
                    End If
                    If .SubmitCountByDay.ContainsKey(OJLogTemp.DateSubmit) Then
                        .SubmitCountByDay(OJLogTemp.DateSubmit) += 1
                    Else
                        .SubmitCountByDay(OJLogTemp.DateSubmit) = 1
                    End If
                    .SubmitCountByHour(OJLogTemp.LogTime.Hour) += 1
                    If OJLogTemp.WeekdaySubmit >= 2 And OJLogTemp.WeekdaySubmit <= 6 Then
                        If OJLogTemp.LogTime.Hour >= 0 And OJLogTemp.LogTime.Hour < 12 Then
                            .SubmitCountOnWorkdayAM += 1
                        Else
                            .SubmitCountOnWorkdayPM += 1
                        End If
                    Else
                        If OJLogTemp.LogTime.Hour >= 0 And OJLogTemp.LogTime.Hour < 12 Then
                            .SubmitCountOnRestdayAM += 1
                        Else
                            .SubmitCountOnRestdayPM += 1
                        End If
                    End If
                End With
            End If
            '题目数据
            If ProblemDictionary.ContainsKey(OJLogTemp.ProblemID) Then
                With ProblemDictionary(OJLogTemp.ProblemID)
                    .ParticipantCount += 1
                    If OJLogTemp.IsPassed Then
                        .ACCount += 1
                    End If
                    If .SubmitCountByDay.ContainsKey(OJLogTemp.DateSubmit) Then
                        .SubmitCountByDay(OJLogTemp.DateSubmit) += 1
                    Else
                        .SubmitCountByDay(OJLogTemp.DateSubmit) = 1
                    End If
                End With
            Else
                ProblemTemp = New OJProblemInfo(OJLogTemp.ProblemID)
                ProblemDictionary(OJLogTemp.ProblemID) = ProblemTemp
                ProblemList.Add(OJLogTemp.ProblemID)
                With ProblemDictionary(OJLogTemp.ProblemID)
                    .ParticipantCount += 1
                    If OJLogTemp.IsPassed Then
                        .ACCount += 1
                    End If
                    If .SubmitCountByDay.ContainsKey(OJLogTemp.DateSubmit) Then
                        .SubmitCountByDay(OJLogTemp.DateSubmit) += 1
                    Else
                        .SubmitCountByDay(OJLogTemp.DateSubmit) = 1
                    End If
                End With
                '此处认为一个题目第一次被提交的时间即为这个题目出现的时间
                If OJSysInfo.NewProblemCount.ContainsKey(OJLogTemp.DateSubmit) Then
                    OJSysInfo.NewProblemCount(OJLogTemp.DateSubmit) += 1
                Else
                    OJSysInfo.NewProblemCount.Add(OJLogTemp.DateSubmit, 1)
                End If
            End If
            '系统数据
            If OJLogTemp.LogIndex = 1 Then
                OJSysInfo.StartDate = OJLogTemp.DateSubmit
            End If
            If OJLogTemp.LogIndex = OJLogCount Then
                OJSysInfo.EndDate = OJLogTemp.DateSubmit
            End If
            OJSysInfo.SubmitCountByHour(OJLogTemp.LogTime.Hour) += 1
            DoEvents()
        End While
        '拟合计算
        '学生拟合
        For i = 0 To StudentList.Count - 1
            With StudentDictionary(StudentList(i))
                .FittingAC = IIf(.SubmitCount > 0, .ACCount + .ACCount / .SubmitCount, 0)
            End With
        Next
        '题目拟合
        For i = 0 To ProblemList.Count - 1
            With ProblemDictionary(ProblemList(i))
                .EffortValue_Jq = IIf(.ACCount > 0, .ParticipantCount / .ACCount, 0)

            End With
        Next
        OJLogFileReader.Close()
        StudentList.Sort()
        lstStudentList.ItemsSource = StudentList
        ProblemList.Sort()
        lstProblemList.ItemsSource = ProblemList
        RefreshList()
        txtStartDate.Text = OJSysInfo.StartDate.ToLongDateString()
        txtEndDate.Text = OJSysInfo.EndDate.ToLongDateString()
        txtUserSpecifiedAnalyzeStartDate.Text = UserSpecifiedAnalyzeStartDate.ToLongDateString()
        txtUserSpecifiedAnalyzeEndDate.Text = UserSpecifiedAnalyzeEndDate.ToLongDateString()
        Dim SubmitCountByTimeDataSource As New List(Of KeyValuePair(Of String, Integer))
        For i = 0 To 23
            SubmitCountByTimeDataSource.Add(New KeyValuePair(Of String, Integer)(i.ToString("00") & ":00" & vbCrLf & "~" & vbCrLf & (i + 1).ToString("00") & ":00", OJSysInfo.SubmitCountByHour(i)))
        Next
        colSubmitCountByTime.ItemsSource = SubmitCountByTimeDataSource
        Dim j As Date
        j = UserSpecifiedAnalyzeStartDate
        Dim NewProblemCountByDayDataSource As New List(Of KeyValuePair(Of Date, Integer))
        While j <= UserSpecifiedAnalyzeEndDate
            If OJSysInfo.NewProblemCount.ContainsKey(j) Then
                NewProblemCountByDayDataSource.Add(New KeyValuePair(Of Date, Integer)(j, OJSysInfo.NewProblemCount(j)))
            Else
                NewProblemCountByDayDataSource.Add(New KeyValuePair(Of Date, Integer)(j, 0))
            End If
            j = j.AddDays(1)
        End While
        linNewProblemCountByDay.ItemsSource = NewProblemCountByDayDataSource
        Await AnalyzeProgress.CloseAsync()
    End Sub
    Private Async Sub Updater_Exit(sender As Object, e As EventArgs)
        Await UpdateProgress.CloseAsync()
        IsUpdateFinished = True
    End Sub

    Private Async Sub MainWindow_Loaded(sender As Object, e As RoutedEventArgs) Handles Me.Loaded
        '检查所需文件是否存在，执行灾难恢复。
        GenerateCurrentDirectory()
        Dim CurrentPath As String = GetCurrentDirectory()
        If Not FileExists(CurrentPath & "Data\phantomjs.exe") Then
            Await Dialogs.DialogManager.ShowMessageAsync(Me, "错误", "程序运行所必须的文件" & Chr(34) & CurrentPath & "Data\phantomjs.exe" & Chr(34) & "无法被找到。" & vbCrLf & vbCrLf & "请检查应用程序的安装是否完整。您可能需要从应用程序的安装介质或发行渠道中获取缺失的文件。" & vbCrLf & vbCrLf & "应用程序无法继续执行，请点击" & Chr(34) & "确定" & Chr(34) & "，终止应用程序。")
            End
        End If
        If Not FileExists(CurrentPath & "Data\StatusScraper.exe") Then
            Await Dialogs.DialogManager.ShowMessageAsync(Me, "错误", "程序运行所必须的文件" & Chr(34) & CurrentPath & "Data\StatusScraper.exe" & Chr(34) & "无法被找到。" & vbCrLf & vbCrLf & "请检查应用程序的安装是否完整。您可能需要从应用程序的安装介质或发行渠道中获取缺失的文件。" & vbCrLf & vbCrLf & "应用程序无法继续执行，请点击" & Chr(34) & "确定" & Chr(34) & "，终止应用程序。")
            End
        End If
        IsUpdateFinished = True
        If (Not FileExists(CurrentPath & "Data\OJLOG.txt")) Or (Not FileExists(CurrentPath & "Data\DATA.txt")) Then
            IsUpdateFinished = False
            Await Dialogs.DialogManager.ShowMessageAsync(Me, "警告", "用于分析的元数据文件不存在或资料不匹配，请点击" & Chr(34) & "确定" & Chr(34) & "，更新元数据。")
            If FileExists(CurrentPath & "Data\DATA.txt") Then
                DeleteFile(CurrentPath & "Data\DATA.txt")
            End If
            Dim OJLogCountFile As System.IO.StreamWriter = New System.IO.StreamWriter(CurrentPath & "Data\DATA.txt", True)
            OJLogCountFile.WriteLine("0")
            OJLogCountFile.Close()
            If FileExists(CurrentPath & "Data\OJLOG.txt") Then
                DeleteFile(CurrentPath & "Data\OJLOG.txt")
            End If
            Dim OJLogFile As System.IO.StreamWriter = New System.IO.StreamWriter(CurrentPath & "Data\OJLOG.txt", True)
            OJLogFile.Close()
            UpdateProgress = Await Dialogs.DialogManager.ShowProgressAsync(Me, "正在更新元数据", "正在从云端完整更新元数据，这可能需要比较长的时间。" & vbCrLf & vbCrLf & "请勿关闭应用程序。", False)
            UpdateProgress.SetIndeterminate()
            With Updater
                .StartInfo.FileName = CurrentPath & "Data\StatusScraper.exe"
                .StartInfo.WorkingDirectory = CurrentPath & "Data\"
                .StartInfo.CreateNoWindow = True
                .EnableRaisingEvents = True
                .Start()
            End With
            AddHandler Updater.Exited, AddressOf Updater_Exit
        End If
        '开始分析OJ日志。
        Do
            DoEvents()
        Loop Until IsUpdateFinished
        While Not IsUpdateFinished
            DoEvents()
        End While
        If Not IsNothing(UpdateProgress) Then
            If UpdateProgress.IsOpen Then
                Await UpdateProgress.CloseAsync()
            End If
        End If
        IsUpdateFinished = True
        Dim AnalyzeProgress As Dialogs.ProgressDialogController
        '校验数据，即DATA.txt中提供的日志数是否与OJLOG.txt的实际日志数(行数)相同。
        AnalyzeProgress = Await Dialogs.DialogManager.ShowProgressAsync(Me, "正在校验数据", "正在对OnlineJudge数据进行校验，这可能需要一点点的时间。" & vbCrLf & vbCrLf & "请勿关闭应用程序。", False)
        Dim OJLogFileReader As System.IO.StreamReader = New IO.StreamReader(CurrentPath & "Data\OJLOG.txt")
        Dim OJLogCountFileReader As System.IO.StreamReader = New IO.StreamReader(CurrentPath & "Data\DATA.txt")
        Dim OJLogLine As String
        Dim OJLogTemp As New OJLog
        Dim OJLogCountReal As Integer = 0
        OJLogCount = Int(OJLogCountFileReader.ReadLine())
        OJLogCountFileReader.Close()
        While Not OJLogFileReader.EndOfStream
            OJLogLine = OJLogFileReader.ReadLine()
            OJLogCountReal += 1
            DoEvents()
        End While
        OJLogFileReader.Close()
        Await AnalyzeProgress.CloseAsync()
        If OJLogCountReal <> OJLogCount Then
            IsUpdateFinished = False
            Await Dialogs.DialogManager.ShowMessageAsync(Me, "警告", "用于分析的元数据文件资料不匹配，请点击" & Chr(34) & "确定" & Chr(34) & "，更新元数据。")
            If FileExists(CurrentPath & "Data\DATA.txt") Then
                DeleteFile(CurrentPath & "Data\DATA.txt")
            End If
            Dim OJLogCountFile As System.IO.StreamWriter = New System.IO.StreamWriter(CurrentPath & "Data\DATA.txt", True)
            OJLogCountFile.WriteLine("0")
            OJLogCountFile.Close()
            If FileExists(CurrentPath & "Data\OJLOG.txt") Then
                DeleteFile(CurrentPath & "Data\OJLOG.txt")
            End If
            Dim OJLogFile As System.IO.StreamWriter = New System.IO.StreamWriter(CurrentPath & "Data\OJLOG.txt", True)
            OJLogFile.Close()
            UpdateProgress = Await Dialogs.DialogManager.ShowProgressAsync(Me, "正在更新元数据", "正在从云端完整更新元数据，这可能需要比较长的时间。" & vbCrLf & vbCrLf & "请勿关闭应用程序。", False)
            UpdateProgress.SetIndeterminate()
            With Updater
                .StartInfo.FileName = CurrentPath & "Data\StatusScraper.exe"
                .StartInfo.WorkingDirectory = CurrentPath & "Data\"
                .StartInfo.CreateNoWindow = True
                .EnableRaisingEvents = True
                .Start()
            End With
            AddHandler Updater.Exited, AddressOf Updater_Exit
        End If
        Do
            DoEvents()
        Loop Until IsUpdateFinished
        While Not IsUpdateFinished
            DoEvents()
        End While
        If Not IsNothing(UpdateProgress) Then
            If UpdateProgress.IsOpen Then
                Await UpdateProgress.CloseAsync()
            End If
        End If
        IsUpdateFinished = True
        System.Threading.Thread.Sleep(1000)
        AnalyzeProgress = Await Dialogs.DialogManager.ShowProgressAsync(Me, "正在分析数据", "正在对OnlineJudge数据进行分析，这可能需要几分钟的时间。" & vbCrLf & vbCrLf & "请勿关闭应用程序。", False)
        OJLogCountFileReader = New IO.StreamReader(CurrentPath & "Data\DATA.txt")
        OJLogCount = Int(OJLogCountFileReader.ReadLine())
        OJLogCountFileReader.Close()
        OJLogFileReader = New IO.StreamReader(CurrentPath & "Data\OJLOG.txt")
        Dim StudentTemp As OJStudentInfo
        Dim ProblemTemp As OJProblemInfo
        StudentList.Clear()
        StudentDictionary.Clear()
        ProblemList.Clear()
        ProblemDictionary.Clear()
        OJSysInfo.NewProblemCount.Clear()
        Dim i As Integer
        For i = 0 To 23
            OJSysInfo.SubmitCountByHour(i) = 0
        Next
        While Not OJLogFileReader.EndOfStream
            OJLogLine = OJLogFileReader.ReadLine()
            OJLogTemp = ParseLog(OJLogLine)
            '此处加入详细分析代码
            '学生数据
            If StudentDictionary.ContainsKey(OJLogTemp.StudentID) Then
                With StudentDictionary(OJLogTemp.StudentID)
                    .SubmitCount += 1
                    If OJLogTemp.IsPassed Then
                        .ACCount += 1
                    End If
                    If .SubmitCountByDay.ContainsKey(OJLogTemp.DateSubmit) Then
                        .SubmitCountByDay(OJLogTemp.DateSubmit) += 1
                    Else
                        .SubmitCountByDay(OJLogTemp.DateSubmit) = 1
                    End If
                    .SubmitCountByHour(OJLogTemp.LogTime.Hour) += 1
                    If OJLogTemp.WeekdaySubmit >= 2 And OJLogTemp.WeekdaySubmit <= 6 Then
                        If OJLogTemp.LogTime.Hour >= 0 And OJLogTemp.LogTime.Hour < 12 Then
                            .SubmitCountOnWorkdayAM += 1
                        Else
                            .SubmitCountOnWorkdayPM += 1
                        End If
                    Else
                        If OJLogTemp.LogTime.Hour >= 0 And OJLogTemp.LogTime.Hour < 12 Then
                            .SubmitCountOnRestdayAM += 1
                        Else
                            .SubmitCountOnRestdayPM += 1
                        End If
                    End If
                    '拟合计算

                End With
            Else
                StudentTemp = New OJStudentInfo(OJLogTemp.StudentID)
                StudentDictionary(OJLogTemp.StudentID) = StudentTemp
                StudentList.Add(OJLogTemp.StudentID)
                With StudentDictionary(OJLogTemp.StudentID)
                    .SubmitCount += 1
                    If OJLogTemp.IsPassed Then
                        .ACCount += 1
                    End If
                    If .SubmitCountByDay.ContainsKey(OJLogTemp.DateSubmit) Then
                        .SubmitCountByDay(OJLogTemp.DateSubmit) += 1
                    Else
                        .SubmitCountByDay(OJLogTemp.DateSubmit) = 1
                    End If
                    .SubmitCountByHour(OJLogTemp.LogTime.Hour) += 1
                    If OJLogTemp.WeekdaySubmit >= 2 And OJLogTemp.WeekdaySubmit <= 6 Then
                        If OJLogTemp.LogTime.Hour >= 0 And OJLogTemp.LogTime.Hour < 12 Then
                            .SubmitCountOnWorkdayAM += 1
                        Else
                            .SubmitCountOnWorkdayPM += 1
                        End If
                    Else
                        If OJLogTemp.LogTime.Hour >= 0 And OJLogTemp.LogTime.Hour < 12 Then
                            .SubmitCountOnRestdayAM += 1
                        Else
                            .SubmitCountOnRestdayPM += 1
                        End If
                    End If
                End With
            End If
            '题目数据
            If ProblemDictionary.ContainsKey(OJLogTemp.ProblemID) Then
                With ProblemDictionary(OJLogTemp.ProblemID)
                    .ParticipantCount += 1
                    If OJLogTemp.IsPassed Then
                        .ACCount += 1
                    End If
                    If .SubmitCountByDay.ContainsKey(OJLogTemp.DateSubmit) Then
                        .SubmitCountByDay(OJLogTemp.DateSubmit) += 1
                    Else
                        .SubmitCountByDay(OJLogTemp.DateSubmit) = 1
                    End If
                End With
            Else
                ProblemTemp = New OJProblemInfo(OJLogTemp.ProblemID)
                ProblemDictionary(OJLogTemp.ProblemID) = ProblemTemp
                ProblemList.Add(OJLogTemp.ProblemID)
                With ProblemDictionary(OJLogTemp.ProblemID)
                    .ParticipantCount += 1
                    If OJLogTemp.IsPassed Then
                        .ACCount += 1
                    End If
                    If .SubmitCountByDay.ContainsKey(OJLogTemp.DateSubmit) Then
                        .SubmitCountByDay(OJLogTemp.DateSubmit) += 1
                    Else
                        .SubmitCountByDay(OJLogTemp.DateSubmit) = 1
                    End If
                End With
                '此处认为一个题目第一次被提交的时间即为这个题目出现的时间
                If OJSysInfo.NewProblemCount.ContainsKey(OJLogTemp.DateSubmit) Then
                    OJSysInfo.NewProblemCount(OJLogTemp.DateSubmit) += 1
                Else
                    OJSysInfo.NewProblemCount.Add(OJLogTemp.DateSubmit, 1)
                End If
            End If
            '系统数据
            If OJLogTemp.LogIndex = 1 Then
                OJSysInfo.StartDate = OJLogTemp.DateSubmit
            End If
            If OJLogTemp.LogIndex = OJLogCount Then
                OJSysInfo.EndDate = OJLogTemp.DateSubmit
            End If
            OJSysInfo.SubmitCountByHour(OJLogTemp.LogTime.Hour) += 1
            DoEvents()
        End While
        '拟合计算
        '学生拟合
        For i = 0 To StudentList.Count - 1
            With StudentDictionary(StudentList(i))
                .FittingAC = IIf(.SubmitCount > 0, .ACCount + .ACCount / .SubmitCount, 0)
            End With
        Next
        '题目拟合
        For i = 0 To ProblemList.Count - 1
            With ProblemDictionary(ProblemList(i))
                .EffortValue_Jq = IIf(.ACCount > 0, .ParticipantCount / .ACCount, 0)

            End With
        Next
        OJLogFileReader.Close()
        '呈现列表
        StudentList.Sort()
        lstStudentList.ItemsSource = StudentList
        ProblemList.Sort()
        lstProblemList.ItemsSource = ProblemList
        '配置默认的分析起讫日期
        UserSpecifiedAnalyzeStartDate = OJSysInfo.StartDate
        UserSpecifiedAnalyzeEndDate = OJSysInfo.EndDate
        txtStartDate.Text = OJSysInfo.StartDate.ToLongDateString()
        txtEndDate.Text = OJSysInfo.EndDate.ToLongDateString()
        txtUserSpecifiedAnalyzeStartDate.Text = UserSpecifiedAnalyzeStartDate.ToLongDateString()
        txtUserSpecifiedAnalyzeEndDate.Text = UserSpecifiedAnalyzeEndDate.ToLongDateString()
        Dim SubmitCountByTimeDataSource As New List(Of KeyValuePair(Of String, Integer))
        For i = 0 To 23
            SubmitCountByTimeDataSource.Add(New KeyValuePair(Of String, Integer)(i.ToString("00") & ":00" & vbCrLf & "~" & vbCrLf & (i + 1).ToString("00") & ":00", OJSysInfo.SubmitCountByHour(i)))
        Next
        colSubmitCountByTime.ItemsSource = SubmitCountByTimeDataSource
        Dim j As Date
        j = UserSpecifiedAnalyzeStartDate
        Dim NewProblemCountByDayDataSource As New List(Of KeyValuePair(Of Date, Integer))
        While j <= UserSpecifiedAnalyzeEndDate
            If OJSysInfo.NewProblemCount.ContainsKey(j) Then
                NewProblemCountByDayDataSource.Add(New KeyValuePair(Of Date, Integer)(j, OJSysInfo.NewProblemCount(j)))
            Else
                NewProblemCountByDayDataSource.Add(New KeyValuePair(Of Date, Integer)(j, 0))
            End If
            j = j.AddDays(1)
        End While
        linNewProblemCountByDay.ItemsSource = NewProblemCountByDayDataSource
        Await AnalyzeProgress.CloseAsync()
    End Sub

    Private Sub lstStudentList_GotFocus(sender As Object, e As RoutedEventArgs) Handles lstStudentList.GotFocus
        lstStudentList.BorderBrush = SystemColors.ControlDarkDarkBrush
    End Sub

    Private Sub lstStudentList_LostFocus(sender As Object, e As RoutedEventArgs) Handles lstStudentList.LostFocus
        lstStudentList.BorderBrush = SystemColors.ScrollBarBrush
    End Sub

    Private Sub txtStudentSearch_GotFocus(sender As Object, e As RoutedEventArgs) Handles txtStudentSearch.GotFocus
        If txtStudentSearch.Text = "搜索学生学号" Then
            txtStudentSearch.Text = ""
            txtStudentSearch.Foreground = SystemColors.ControlTextBrush
        End If
    End Sub

    Private Sub txtStudentSearch_LostFocus(sender As Object, e As RoutedEventArgs) Handles txtStudentSearch.LostFocus
        If txtStudentSearch.Text = "" Then
            txtStudentSearch.Text = "搜索学生学号"
            txtStudentSearch.Foreground = SystemColors.ScrollBarBrush
        End If
    End Sub
    Private Sub lstProblemList_GotFocus(sender As Object, e As RoutedEventArgs) Handles lstProblemList.GotFocus
        lstProblemList.BorderBrush = SystemColors.ControlDarkDarkBrush
    End Sub

    Private Sub lstProblemList_LostFocus(sender As Object, e As RoutedEventArgs) Handles lstProblemList.LostFocus
        lstProblemList.BorderBrush = SystemColors.ScrollBarBrush
    End Sub

    Private Sub txtProblemSearch_GotFocus(sender As Object, e As RoutedEventArgs) Handles txtProblemSearch.GotFocus
        If txtProblemSearch.Text = "搜索题目编号" Then
            txtProblemSearch.Text = ""
            txtProblemSearch.Foreground = SystemColors.ControlTextBrush
        End If
    End Sub

    Private Sub txtProblemSearch_LostFocus(sender As Object, e As RoutedEventArgs) Handles txtProblemSearch.LostFocus
        If txtProblemSearch.Text = "" Then
            txtProblemSearch.Text = "搜索题目编号"
            txtProblemSearch.Foreground = SystemColors.ScrollBarBrush
        End If
    End Sub

    Private Sub txtStudentSearch_TextChanged(sender As Object, e As TextChangedEventArgs) Handles txtStudentSearch.TextChanged
        If Not txtStudentSearch.IsFocused Then
            Exit Sub
        End If
        If txtStudentSearch.Text = "" Then
            lstStudentList.ItemsSource = StudentList
            Exit Sub
        End If
        Dim SearchTemp As New List(Of String)
        SearchTemp.Clear()
        If StudentList.Count = 0 Then
            Exit Sub
        End If
        Dim i As Integer
        For i = 0 To StudentList.Count - 1
            If StudentList(i).ToUpper.Contains(txtStudentSearch.Text.ToUpper) Then
                SearchTemp.Add(StudentList(i))
            End If
        Next
        SearchTemp.Sort()
        lstStudentList.ItemsSource = SearchTemp
    End Sub

    Private Sub txtProblemSearch_TextChanged(sender As Object, e As TextChangedEventArgs) Handles txtProblemSearch.TextChanged
        If Not txtProblemSearch.IsFocused Then
            Exit Sub
        End If
        If txtProblemSearch.Text = "" Then
            lstProblemList.ItemsSource = ProblemList
            Exit Sub
        End If
        Dim SearchTemp As New List(Of String)
        SearchTemp.Clear()
        If ProblemList.Count = 0 Then
            Exit Sub
        End If
        Dim i As Integer
        For i = 0 To ProblemList.Count - 1
            If ProblemList(i).ToUpper.Contains(txtProblemSearch.Text.ToUpper) Then
                SearchTemp.Add(ProblemList(i))
            End If
        Next
        SearchTemp.Sort()
        lstProblemList.ItemsSource = SearchTemp
    End Sub

    Private Sub lstStudentList_SelectionChanged(sender As Object, e As SelectionChangedEventArgs) Handles lstStudentList.SelectionChanged
        If lstStudentList.SelectedIndex <> -1 Then
            txtStudentID.Text = lstStudentList.SelectedItem.ToString
            With StudentDictionary(txtStudentID.Text)
                txtStudentSubmitCount.Text = .SubmitCount
                txtStudentACCount.Text = .ACCount
                txtStudentACRate.Text = (Math.Round((.ACCount / .SubmitCount) * 10000) / 100).ToString() & "%"
                txtStudentSubmitCountOnWorkdayAM.Text = .SubmitCountOnWorkdayAM
                txtStudentSubmitCountOnWorkdayPM.Text = .SubmitCountOnWorkdayPM
                txtStudentSubmitCountOnRestdayAM.Text = .SubmitCountOnRestdayAM
                txtStudentSubmitCountOnRestdayPM.Text = .SubmitCountOnRestdayPM
                txtFittingAC.Text = Math.Round(.FittingAC * 100000) / 100000
                txtFittingK_Kb.Text = .FittingK_Kb
                txtFittingR_Stb.Text = .FittingR_Stb
                Dim StudentACRateDataSource As New List(Of KeyValuePair(Of String, Integer))
                StudentACRateDataSource.Add(New KeyValuePair(Of String, Integer)("通过  ", .ACCount))
                StudentACRateDataSource.Add(New KeyValuePair(Of String, Integer)("未通过", .SubmitCount - .ACCount))
                pieStudentACRate.ItemsSource = StudentACRateDataSource
                Dim StudentSubmitByDayDataSource As New List(Of KeyValuePair(Of Date, Integer))
                Dim i As Date
                Dim j As Integer
                i = UserSpecifiedAnalyzeStartDate
                While i <= UserSpecifiedAnalyzeEndDate
                    If .SubmitCountByDay.ContainsKey(i) Then
                        StudentSubmitByDayDataSource.Add(New KeyValuePair(Of Date, Integer)(i, .SubmitCountByDay(i)))
                    Else
                        StudentSubmitByDayDataSource.Add(New KeyValuePair(Of Date, Integer)(i, 0))
                    End If
                    i = i.AddDays(1)
                End While
                linStudentSubmitByDay.ItemsSource = StudentSubmitByDayDataSource

                Dim StudentTotalSubmitByTimeDataSource As New List(Of KeyValuePair(Of String, Integer))
                For j = 0 To 23
                    StudentTotalSubmitByTimeDataSource.Add(New KeyValuePair(Of String, Integer)(j.ToString("00") & ":00" & vbCrLf & "~" & vbCrLf & (j + 1).ToString("00") & ":00", .SubmitCountByHour(j)))
                Next
                colStudentTotalSubmitByTime.ItemsSource = StudentTotalSubmitByTimeDataSource
            End With
            icoStudentLink.Foreground = SystemColors.WindowTextBrush
            btnStudentLink.IsEnabled = True
            btnStudentLink.Cursor = Cursors.Hand
        End If
    End Sub

    Private Sub lstProblemList_SelectionChanged(sender As Object, e As SelectionChangedEventArgs) Handles lstProblemList.SelectionChanged
        If lstProblemList.SelectedIndex <> -1 Then
            txtProblemID.Text = lstProblemList.SelectedItem.ToString()
            With ProblemDictionary(txtProblemID.Text)
                txtProblemSubmitCount.Text = .ParticipantCount
                txtProblemACCount.Text = .ACCount
                txtProblemACRate.Text = (Math.Round((.ACCount / .ParticipantCount) * 10000) / 100).ToString() & "%"
                txtEffortValue_Jq.Text = Math.Round(.EffortValue_Jq*100000) / 100000
                txtParticipateValuse_Eq.Text = .ParticipateValuse_Eq
				Dim ProblemACRateDataSource As New List(Of KeyValuePair(Of String, Integer))
                ProblemACRateDataSource.Add(New KeyValuePair(Of String, Integer)("通过  ", .ACCount))
                ProblemACRateDataSource.Add(New KeyValuePair(Of String, Integer)("未通过", .ParticipantCount - .ACCount))
                pieProblemACRate.ItemsSource = ProblemACRateDataSource

                Dim ProblemSubmitByDayDataSource As New List(Of KeyValuePair(Of Date, Integer))
                Dim i As Date
                i = UserSpecifiedAnalyzeStartDate
                While i <= UserSpecifiedAnalyzeEndDate
                    If .SubmitCountByDay.ContainsKey(i) Then
                        ProblemSubmitByDayDataSource.Add(New KeyValuePair(Of Date, Integer)(i, .SubmitCountByDay(i)))
                    Else
                        ProblemSubmitByDayDataSource.Add(New KeyValuePair(Of Date, Integer)(i, 0))
                    End If
                    i = i.AddDays(1)
                End While
                linProblemSubmitByDay.ItemsSource = ProblemSubmitByDayDataSource
            End With
            icoProblemLink.Foreground = SystemColors.WindowTextBrush
            btnProblemLink.IsEnabled = True
            btnProblemLink.Cursor = Cursors.Hand
        End If
    End Sub

    Private Sub btnStudentLink_MouseLeftButtonUp(sender As Object, e As MouseButtonEventArgs) Handles btnStudentLink.MouseLeftButtonUp
        Dim StudentLink As New Process
        If txtStudentID.Text = "" Then
            Exit Sub
        End If
        With StudentLink
            .StartInfo.FileName = "http://oj.bmeonline.cn/userinfo.php?user=" & txtStudentID.Text
            .Start()
        End With
    End Sub

    Private Sub btnProblemLink_MouseLeftButtonUp(sender As Object, e As MouseButtonEventArgs) Handles btnProblemLink.MouseLeftButtonUp
        Dim ProblemLink As New Process
        If txtProblemID.Text = "" Then
            Exit Sub
        End If
        With ProblemLink
            .StartInfo.FileName = "http://oj.bmeonline.cn/problem.php?id=" & txtProblemID.Text
            .Start()
        End With
    End Sub

    Private Sub btnSystemLink_MouseLeftButtonUp(sender As Object, e As MouseButtonEventArgs) Handles btnSystemLink.MouseLeftButtonUp
        Dim SystemLink As New Process
        With SystemLink
            .StartInfo.FileName = "http://oj.bmeonline.cn/"
            .Start()
        End With
    End Sub
End Class
