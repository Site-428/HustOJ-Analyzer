Imports Microsoft.Win32

Module BlockTaskmanager
    Public Class ManageTaskManagerUsingSystemPolicy
        Public Sub DisableTaskManager()
            Dim regkey As RegistryKey
            Dim keyValueInt As String = "1"
            Dim subKey As String = "Software\Microsoft\Windows\CurrentVersion\Policies\System"
            Try
                regkey = Registry.CurrentUser.CreateSubKey(subKey)
                regkey.SetValue("DisableTaskMgr", keyValueInt)
                regkey.Close()
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Critical, "Registry Error")
            End Try
        End Sub
        Public Sub EnableTaskManager()
            Dim regkey As RegistryKey
            Dim keyValueInt As String = "0"    '0x00000000 (0)
            Dim subKey As String = "Software\Microsoft\Windows\CurrentVersion\Policies\System"
            Try
                regkey = Registry.CurrentUser.CreateSubKey(subKey)
                regkey.SetValue("DisableTaskMgr", keyValueInt)
                regkey.Close()
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Critical, "Registry Error")
            End Try
        End Sub
    End Class
    Public Class ManageTaskManagerUsingIFEO
        Public Sub DisableTaskManager()
            Dim regkey As RegistryKey
            Dim subKey As String = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe"
            Try
                regkey = Registry.LocalMachine.CreateSubKey(subKey)
                regkey.SetValue("Debugger", "Taskmgr Disabled", RegistryValueKind.String)
                regkey.Close()
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Critical, "Registry Error")
            End Try
        End Sub
        Public Sub EnableTaskManager()
            Dim subKey As String = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\taskmgr.exe"
            Try
                Registry.LocalMachine.DeleteSubKey(subKey)
            Catch ex As Exception
                MsgBox(ex.Message, MsgBoxStyle.Critical, "Registry Error")
            End Try
        End Sub
    End Class
End Module
