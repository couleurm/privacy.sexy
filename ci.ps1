$ErrorActionPreference = 'Stop'
$DebugPreference = 'Continue'

Set-Location $PSScriptRoot

if (!(Get-Module powershell-yaml)){
    Write-Host "Getting PowerShell-YAML.. " -NoNewLine
    Install-Module powershell-yaml -Force
    Write-Host "Done"
}

$collection = Get-Content .\src\application\collections\windows.yaml | ConvertFrom-Yaml

. ./Convert-PrivacySexyToPSModule.ps1
Copy-Item ./classPrivacySexy.ps1 ./privacy.sexy.ps1
Convert-PrivacySexyToPSModule $collection | Add-Content ./privacy.sexy.ps1 -Verbose



