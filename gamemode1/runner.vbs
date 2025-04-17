Set fso = CreateObject("Scripting.FileSystemObject")
Set WshShell = CreateObject("WScript.Shell")
scriptPath = fso.GetParentFolderName(WScript.ScriptFullName)
WshShell.Run Chr(34) & scriptPath & "\gamemode_creative.bat" & Chr(34) & " fromvbs", 0
