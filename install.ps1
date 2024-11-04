# Создаем каталог для установки
$binDir = "$HOME\.ttt\bin"
New-Item -ItemType Directory -Force -Path $binDir

# Скачиваем архив
Invoke-WebRequest -Uri "https://github.com/hodzzzinsky/ttt_download/archive/refs/tags/v1.0.tar.gz" -OutFile "$HOME\ttt.tar.gz"

# Распаковываем архив
tar -xzf "$HOME\ttt.tar.gz" -C $HOME
Remove-Item "$HOME\ttt.tar.gz"
Move-Item "$HOME\ttt_download-1.0\ttt" $binDir

# Делаем файл исполняемым (не требуется в Windows, но для совместимости)
# В Windows не нужно менять права доступа, так как они работают по-другому

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
