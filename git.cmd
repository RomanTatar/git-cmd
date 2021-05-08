@echo off
git.exe %*
set GitError=%ErrorLevel%
set GitBranch=
IF %GitError% EQU 0 (
    FOR /F %%I IN ('git.exe branch --show-current') DO set GitBranch=%%I
)

IF "%GitBranch%" == "" (
    prompt
) ELSE (
    prompt $E[1;37m$P $E[32m[%GitBranch%]$E[37m $G$E[0;37m
)
EXIT /B %GitError%