$app_path = "C:\Users\zhangchao\Downloads\sysinternals-suite-20240620221100"
$app_path_arm64 = "C:\Users\zhangchao\Downloads\sysinternals-suite-20240620221100-ARM64"
$app_path_nano = "C:\Users\zhangchao\Downloads\sysinternals-suite-20240620221100-Nano"

mkdir temp

function IfGui {
    param (
        $path
    )

    & "$PSScriptRoot\pebox.exe" if-windows-gui $path | Out-Null
    return $LASTEXITCODE -eq 0
}

# 64 bit shortcut
[System.Collections.ArrayList]$result = New-Object -TypeName System.Collections.ArrayList
Get-ChildItem $app_path
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?=.exe)' }
| Where-Object { IfGui -path $_.FullName }
| ForEach-Object { $result.Add(@($_.Name, [System.IO.Path]::GetFileNameWithoutExtension($_.Name))) | Out-Null }
$result | ConvertTo-Json > temp/ss_64_sc.json

# 64 bit bin
[System.Collections.ArrayList]$result = New-Object -TypeName System.Collections.ArrayList
Get-ChildItem $app_path
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?=.exe)' }
| ForEach-Object { $result.Add(@($_.Name, [System.IO.Path]::GetFileNameWithoutExtension($_.Name))) | Out-Null }
$result | ConvertTo-Json > temp/ss_64_bin.json

# 32 bit shortcut
[System.Collections.ArrayList]$result = New-Object -TypeName System.Collections.ArrayList
Get-ChildItem $app_path
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?=.exe)' }
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?<!64.exe)$' }
| Where-Object { IfGui -path $_.FullName }
| ForEach-Object { $result.Add(@($_.Name, [System.IO.Path]::GetFileNameWithoutExtension($_.Name))) | Out-Null }
$result | ConvertTo-Json > temp/ss_86_sc.json

# 32 bit bin
[System.Collections.ArrayList]$result = New-Object -TypeName System.Collections.ArrayList
Get-ChildItem $app_path
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?=.exe)' }
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?<!64.exe)$' }
| ForEach-Object { $result.Add(@($_.Name, [System.IO.Path]::GetFileNameWithoutExtension($_.Name))) | Out-Null }
$result | ConvertTo-Json > temp/ss_86_bin.json

# arm64 shortcut
[System.Collections.ArrayList]$result = New-Object -TypeName System.Collections.ArrayList
Get-ChildItem $app_path_arm64
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?=.exe)' }
| Where-Object { IfGui -path $_.FullName }
| ForEach-Object { $result.Add(@($_.Name, [System.IO.Path]::GetFileNameWithoutExtension($_.Name))) | Out-Null }
$result | ConvertTo-Json > temp/ss_arm64_sc.json

# arm64 bin
[System.Collections.ArrayList]$result = New-Object -TypeName System.Collections.ArrayList
Get-ChildItem $app_path_arm64
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?=.exe)' }
| ForEach-Object { $result.Add(@($_.Name, [System.IO.Path]::GetFileNameWithoutExtension($_.Name))) | Out-Null }
$result | ConvertTo-Json > temp/ss_arm64_bin.json

# nano shortcut
[System.Collections.ArrayList]$result = New-Object -TypeName System.Collections.ArrayList
Get-ChildItem $app_path_nano
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?=.exe)' }
| Where-Object { IfGui -path $_.FullName }
| ForEach-Object { $result.Add(@($_.Name, [System.IO.Path]::GetFileNameWithoutExtension($_.Name))) | Out-Null }
$result | ConvertTo-Json > temp/ss_nano_sc.json

# nano bin
[System.Collections.ArrayList]$result = New-Object -TypeName System.Collections.ArrayList
Get-ChildItem $app_path_nano
| Where-Object { $_.Name -match '[A-Za-z0-9]+(?=.exe)' }
| ForEach-Object { $result.Add(@($_.Name, [System.IO.Path]::GetFileNameWithoutExtension($_.Name))) | Out-Null }
$result | ConvertTo-Json > temp/ss_nano_bin.json
