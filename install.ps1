# Создаем каталог для установки
$binDir = "$HOME\.ttt\bin"
New-Item -ItemType Directory -Force -Path $binDir

# Скачиваем ZIP-архив
Invoke-WebRequest -Uri "https://github.com/hodzzzinsky/ttt_download/archive/refs/tags/v1.1.zip" -OutFile "$HOME\ttt.zip"

# Распаковываем архив
Expand-Archive -Path "$HOME\ttt.zip" -DestinationPath $HOME -Force
Remove-Item "$HOME\ttt.zip"
Move-Item "$HOME\ttt_download-1.1\ttt_windows.exe" $binDir

# Обновляем PATH
if (Test-Path "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1") {
    Add-Content -Path "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1" -Value "`n$env:PATH += `"$binDir`""
    Write-Host "PATH has been updated in PowerShell profile. Please restart your terminal or run `". $PROFILE`"."
} else {
    Write-Host "No PowerShell profile found."
    Write-Host "Please add the following line to your PowerShell profile:"
    Write-Host "`$env:PATH += `"$binDir`""
    Write-Host "After adding this line, restart your terminal or run `". $PROFILE`"."
}

Write-Host "Type 'ttt' to start the application."