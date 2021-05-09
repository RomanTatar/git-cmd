# Git CMD

This tool adds support for Git in CMD similarly like [Git in Bash](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash) or [Git in PowerShell](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-PowerShell) — TL;DR See [Example](#example)
- This is native solution using only `git.exe` from installer available on [Git-SCM.COM](https://git-scm.com/download/win) and `cmd.exe` magic \
(basically this is set of `.cmd` files updating the `PROMPT` environment variable)
- It is different to `git-cmd.exe`, because it does not have any enhancements
- It is different to `git-bash.exe`, because it is "MINGW64" and paths looks like `/c/temp`

## It brings
1. [Shortcuts](#shortcuts-stopwatch)
2. [Branch name](#branch-name-herb)
3. [Colors](#colors-rainbow)

#### Shortcuts :stopwatch:
Typing `git status <┘` hundred times a day is pretty boring. [Git Aliases](https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases) helps, but it is still `git st <┘` \
Every keystroke counts, so based on how often I use particular command (or command chain) I have defined shortcuts
- Type `gs <┘` instead of `git status <┘` (and save 8 keystrokes)
- Type `gl1 <┘` instead of `git log --oneline <┘`
- Type `g ... <┘` instead of `git ... <┘`
- Type `git ... <┘` to call `git.exe` for the classic
  - To avoid conflict there is no `git.cmd`
  - Calling `git.exe` does not update the prompt, but you can call `gprompt` to update it manually :information_source:
- Remember that "with great power, comes great responsibility", so typo can be devastating :warning:

#### Branch name :herb:
Branch name is in square brackets and the prompt may look like `C:\Temp\example [master] >` \
Detached head is supported, so it may contain also commit hash `C:\Temp\example [ded4b36] >` \
There are 3 environment variables:
- `%GitBranch%` branch name from repository retrieved by `gprompt`
- `%GitError%` keeps exit code to reset prompt to default if git command fails
- `%GitPushBranch%` same as `%GitBranch%` if not specified as parameter for `gpho` or `gpho!`

#### Colors :rainbow:
Green is normal branch \
Red is detached head \
Command output is normal and prompt color is highlighted ([bold](https://ss64.com/nt/syntax-ansi.html)) – better readable \
Uses ANSI escape codes, so it requires Windows 10 1909 and above :information_source: \
(for Windows 7 or Windows 10 before 1909 it will show directly the ANSI codes) :warning:

## Setup
1. Install Git for Windows from [Git-SCM.COM](https://git-scm.com/download/win) and verify that it is in `PATH` environment variable `where git.exe`
2. Clone repository into desired location `git.exe clone https://github.com/RomanTatar/git-cmd.git C:\_git-cmd` \
(cloning into C:\ may require Administrator rights, but feel free to put it anywhere)
3. Add location into `PATH` environment variable \
(This PC – Properties – Advanced System Settings – Environment Variables – See section System variables \
Select `Path` and click Edit – Click New – Type `C:\_git-cmd` and move it to top – Confirm OK OK OK)
4. Restart CMD and verify that `g.cmd` is in `PATH` environment variable `where g.cmd`

## Example
![Git CMD usage example](example.png)