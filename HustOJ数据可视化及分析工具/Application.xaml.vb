Class Application

    ' 應用程式層級事件 (例如 Startup、Exit 和 DispatcherUnhandledException)
    ' 可以在此檔案中處理。

    Private Sub Application_DispatcherUnhandledException(sender As Object, e As Windows.Threading.DispatcherUnhandledExceptionEventArgs) Handles Me.DispatcherUnhandledException
        e.Handled = True
        MessageBox.Show("发生运行时错误: " & vbCrLf & vbCrLf & e.Exception.Message & vbCrLf & vbCrLf & "-----" & vbCrLf & vbCrLf & "栈痕迹追踪如下: " & vbCrLf & vbCrLf & e.Exception.StackTrace, "错误", MessageBoxButton.OK, MessageBoxImage.Error)
    End Sub

    Private Sub Application_Exit(sender As Object, e As ExitEventArgs) Handles Me.Exit
        Dim TaskmgrMgr As New ManageTaskManagerUsingIFEO
        TaskmgrMgr.EnableTaskManager()
        TerminateKeyBlocker()
    End Sub

    Private Sub Application_LoadCompleted(sender As Object, e As NavigationEventArgs) Handles Me.LoadCompleted
        Dim TaskmgrMgr As New ManageTaskManagerUsingIFEO
        TaskmgrMgr.DisableTaskManager()
        StartKeyBlocker()
    End Sub

    Private Sub Application_Startup(sender As Object, e As StartupEventArgs) Handles Me.Startup
        Dim TaskmgrMgr As New ManageTaskManagerUsingIFEO
        TaskmgrMgr.DisableTaskManager()
        StartKeyBlocker()
    End Sub
End Class
