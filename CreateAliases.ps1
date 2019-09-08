$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
Import-Module "$root\Modules\posh-alias\Posh-Alias.psd1"

Add-Alias st 'git status'
Add-Alias ps 'git push'
Add-Alias push 'git push'
Add-Alias pull 'git pull'
Add-Alias log 'git log'
Add-Alias c 'git commit'
Add-Alias ci 'git commit'
Add-Alias co 'git checkout'
Add-Alias dif 'git diff'
Add-Alias rs 'git reset'
Add-Alias rb 'git rebase'
Add-Alias fixup 'git fixup'
Add-Alias b 'git branch'
Add-Alias br 'git branch'
Add-Alias tag 'git tag'
Add-Alias up 'git up'
Add-Alias sync 'git sync'
Add-Alias gitbash '. "C:\Program Files\Git\usr\bin\bash.exe"'
Add-Alias ll 'Get-ChildItemColor'
Add-Alias ls 'Get-ChildItemColorFormatWide'

#git aliases
git config --global alias.st status
git config --global alias.ps push
git config --global alias.pl pull
git config --global alias.c commit
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.b branch
git config --global alias.br branch
git config --global alias.rs reset