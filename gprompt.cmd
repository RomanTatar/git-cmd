@echo off
set GitError=%ErrorLevel%
SETLOCAL EnableDelayedExpansion
set GitBranch=
set GitCommit=
IF %GitError% EQU 0 (
    rem Execute Git and Set prompt only when there is no external Git error
    FOR /F %%I IN ('git.exe branch --show-current ^|^| echo Error-NotGitRepository') DO set GitBranch=%%I
    IF DEFINED GitBranch (
        rem GitBranch is defined - This is Error or Git repository with branch
        IF "!GitBranch!" == "Error-NotGitRepository" (
            rem Reset prompt for NOT Git repository
            prompt
        ) ELSE (
            rem Set prompt for Git repository with branch
            prompt $E[1;37m$P $E[32m[!GitBranch!]$E[37m $G$E[0;37m
        )
    ) ELSE (
        rem GitBranch is NOT defined - This is Git repository without branch
        rem Get last commit hash and set prompt for Git repository with commit
        FOR /F %%I IN ('git.exe rev-parse --short HEAD') DO set GitCommit=%%I
        prompt $E[1;37m$P $E[31m[!GitCommit!]$E[37m $G$E[0;37m
    )
) ELSE (
    rem Reset prompt when there is external Git error
    prompt
)
rem Return prompt outside local environment (EnableDelayedExpansion is required for variables enumeration)
ENDLOCAL & prompt %PROMPT%
EXIT /B %GitError%