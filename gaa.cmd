@echo off
CALL git.cmd add --all
IF %ErrorLevel% EQU 0 (
    CALL git.cmd status
)