Set WshShell = CreateObject("WScript.Shell") 
Set fso = CreateObject("Scripting.FileSystemObject")

vbsPath = WScript.ScriptFullName

startupPath = WshShell.ExpandEnvironmentStrings("%ProgramData%") & "\Microsoft\Windows\Start Menu\Programs\Startup\gamemode_creative.lnk"

If Not fso.FileExists(startupPath) Then
    Set shortcut = WshShell.CreateShortcut(startupPath)
    shortcut.TargetPath = "wscript.exe" ' Uruchomienie wscript.exe
    shortcut.Arguments = Chr(34) & vbsPath & Chr(34)
    shortcut.IconLocation = "shell32.dll, 1"
    shortcut.Save
    WScript.Echo "Skrot do .vbs utworzony pomyslnie."
Else
    WScript.Echo "Skrot już istnieje."
End If

batPath = fso.GetParentFolderName(vbsPath) & "\gamemode_creative.bat"
WshShell.Run Chr(34) & batPath & Chr(34) & " fromvbs", 0
