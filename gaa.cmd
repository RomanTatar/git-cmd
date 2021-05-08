@echo off
git.exe add --all
IF %ErrorLevel% EQU 0 (
    git.exe status
)