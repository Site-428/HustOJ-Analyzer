Module KeyBlcoker
    Public KeyBlockerExternalApp As Process = New Process
    Public Sub StartKeyBlocker()
        GenerateCurrentDirectory()
        Dim CurrentPath As String = GetCurrentDirectory()
        Try
            With KeyBlockerExternalApp
                .StartInfo.FileName = CurrentPath & "LockKey.exe"
                .StartInfo.CreateNoWindow = True
                .Start()
            End With
        Catch ex As Exception
            Exit Sub
        End Try
    End Sub
    Public Sub TerminateKeyBlocker()
        Try
            KeyBlockerExternalApp.CloseMainWindow()
            KeyBlockerExternalApp.Kill()
            KeyBlockerExternalApp.Close()
        Catch ex As Exception
            Exit Sub
        End Try
    End Sub
End Module
