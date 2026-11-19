' Opens the AVENSIS disk in 32-bit mshta (Internet Explorer engine).
' 32-bit is required so the old Adobe Reader plugin can show PDFs in the frame.
Option Explicit

Dim sh, fso, root, hta, wow, cmd
Set sh = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

root = fso.GetParentFolderName(WScript.ScriptFullName)
hta = root & "\AVENSIS.hta"

If Not fso.FileExists(hta) Then
  MsgBox "AVENSIS.hta was not found next to this launcher.", vbCritical, "AVENSIS"
  WScript.Quit 1
End If

wow = sh.ExpandEnvironmentStrings("%SystemRoot%") & "\SysWOW64\mshta.exe"
If fso.FileExists(wow) Then
  cmd = """" & wow & """ """ & hta & """"
Else
  cmd = "mshta.exe """ & hta & """"
End If

sh.Run cmd, 1, False
