@echo off
git.exe branch --delete %*
IF %ErrorLevel% EQU 0 (
    CALL gprompt.cmd
)