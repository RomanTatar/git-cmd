@echo off
IF NOT "%2" == "" (
    git.exe branch --move --force %1 %2
) ELSE (
    git.exe branch --move --force %1
)
IF %ErrorLevel% EQU 0 (
    CALL gprompt.cmd
)