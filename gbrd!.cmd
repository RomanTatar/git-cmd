@echo off
git.exe branch --delete --force %*
IF %ErrorLevel% EQU 0 (
    CALL gprompt.cmd
)