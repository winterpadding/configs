#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance force ;reload script without a warning message if the script is already running

; + => Shift
; ^ => Ctrl 
+^p::
	EnvGet, SystemRoot, SystemRoot
	Run, %SystemRoot%\system32\WindowsPowerShell\v1.0\powershell.exe
Return





