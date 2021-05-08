@echo off
git.exe branch %*
IF %ErrorLevel% EQU 0 (
    CALL gprompt.cmd
)