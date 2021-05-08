@echo off
IF NOT "%*" == "" (
    set GitPushBranch=%*
) ELSE (
    IF NOT "%GitBranch%" == "" (
        set GitPushBranch=%GitBranch%
    ) ELSE (
        set GitPushBranch=
    )
)
git.exe push origin %GitPushBranch%