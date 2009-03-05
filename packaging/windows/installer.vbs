'
' $Id$
'
' Companion file to bin/install.pike for custom actions.
'
' 2004-12-01 Henrik Grubbstr�m
'

' At call time the CustomActionData property has been set to [TARGETDIR].
'
' First make a new master.
'
' Then finalize Pike.
Function FinalizePike()
  Dim targetdir, fso

  targetdir = Session.Property("CustomActionData")
  Set fso = CreateObject("Scripting.FileSystemObject")

''  Dim targetdir_unix, source, dest, re
''
''  Set source = fso.OpenTextFile(targetdir & "lib\master.pike.in", 1, False, 0)
''
''  Set dest = fso.CreateTextFile(targetdir & "lib\master.pike", True)
''
''  source = source.ReadAll
''
''  Set re = New RegExp
''  re.Global = True
''
''  re.Pattern = "\"
''  targetdir_unix = re.Replace(targetdir, "/")
''
''  re.Pattern = "#lib_prefix#"
''  source = re.Replace(source, targetdir_unix & "lib")
''
''  re.Pattern = "#include_prefix#"
''  source = re.Replace(source, targetdir_unix & "include/pike")
''
''  're.Pattern = "#share_prefix#"
''  'source = re.Replace(source, "#share_prefix#")
''
''  dest.Write(source)
''  dest.Close

  ' FIXME: Is there no support for binary files in vbs?

  Dim WshShell

  Set WshShell = CreateObject("WScript.Shell")
  WshShell.CurrentDirectory = targetdir

  WshShell.Run "bin\pike" &_
    " -mlib\master.pike" &_
    " bin\install.pike" &_
    " --install-master BASEDIR=.", 0, True

  WshShell.Run "bin\pike" &_
    " -mlib\master.pike" &_
    " bin\install.pike" &_
    " --finalize BASEDIR=." &_
    " TMP_BUILDDIR=bin", 0, True

  ' Extra cleanup.
  If fso.FileExists(targetdir & "bin\pike.exe.old") Then
    WshShell.Run "%windir%\system32\cmd /c del bin\pike.exe.old" &_
      " /f", 0, True
  End If

  FinalizePike = 1
End Function
