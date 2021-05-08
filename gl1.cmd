@echo off
git.exe --no-pager log --oneline --color %* | less -FRSXM