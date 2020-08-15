$root = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$isWin = [System.Environment]::OSVersion.Platform -eq 'Win32NT'
if ($isWin -and $null -eq $env:HOME -and $null -ne $env:USERPROFILE) {
    $env:HOME = $env:USERPROFILE
}

. "$root/InstallModules.ps1"

if ($isWin -and (Test-Path "$env:ProgramFiles\Git\usr\bin") -and ($env:path.IndexOf("$($env:ProgramFiles)\Git\usr\bin", [StringComparison]::CurrentCultureIgnoreCase) -lt 0)) {
    # enable ssh-agent from posh-git
    $env:PATH = "$env:PATH;$env:ProgramFiles\Git\usr\bin"
}

Import-Module "$root/Modules/posh-git/src/posh-git.psd1"
Import-Module "$root/Modules/oh-my-posh/oh-my-posh.psm1" #don't import the psd1, it has an incorrect string in the version field
Import-Module "$root/Modules/DockerCompletion/DockerCompletion/DockerCompletion.psd1"
Import-Module "$root/Modules/Get-ChildItemColor/src/Get-ChildItemColor.psd1"

#to use this theme, download and install 'DroidSansMono Nerd Font' from https://github.com/ryanoasis/nerd-fonts/releases
#otherwise, to use Paradox, download and install 'Cascadia Code PL' from https://github.com/microsoft/cascadia-code/releases
Set-Theme "$($ThemeSettings.MyThemesLocation)\osmar-theme.psm1"

$kubeConfigHome = Join-Path $env:HOME '.kube'
if (Test-Path $kubeConfigHome) {
    $env:KUBECONFIG = Get-ChildItem $kubeConfigHome -File | ForEach-Object { $kubeConfig = '' } { $kubeConfig += "$($_.FullName)$([System.IO.Path]::PathSeparator)" } { $kubeConfig }
    Remove-Variable kubeConfig
}
Remove-Variable kubeConfigHome

. "$root/CreateAliases.ps1"
. "$root/Functions.ps1"

if ($isWin) { . "$root/profile.windows.ps1" }

$root = $null