@echo off
IF NOT "%2" == "" (
    git.exe branch --move %1 %2
) ELSE (
    git.exe branch --move %1
)
IF %ErrorLevel% EQU 0 (
    CALL gprompt.cmd
)