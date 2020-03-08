#CRLF TO LF
$FilePath = "ubuntu_install.sh"
((Get-Content $FilePath) -join "`n") + "`n" | Set-Content -NoNewline $FilePath
$FilePath = "zshrc.settings"
((Get-Content $FilePath) -join "`n") + "`n" | Set-Content -NoNewline $FilePath

if(.\windows_install.ps1){
wsl -d Ubuntu-18.04 sh "ubuntu_install.sh"
}

