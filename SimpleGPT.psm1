[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$script:moduleRoot = $PSScriptRoot
$Script:version = (Test-ModuleManifest -Path (Join-Path -Path $script:moduleRoot -ChildPath "SimpleGPT.psd1") -Verbose).Version
$moduleFunctionsFolder = (Join-Path -Path $script:moduleRoot -ChildPath "functions")

# MODULE FUNCTIONS INIT
Get-ChildItem -Path $moduleFunctionsFolder -Recurse -File -Filter '*.ps1' |
Where-object -Filter { -not $_.Name.StartsWith("dev_") } |
ForEach-Object {
    . $_.FullName
}

# MODULE INFO
Get-ChildItem -Path (Join-Path -Path $moduleFunctionsFolder -ChildPath "Public")  -Recurse -File -Filter '*.ps1' |
Where-object -Filter { -not $_.Name.StartsWith("dev_") } |
ForEach-Object {
    Write-Verbose -Message ("Importing " + ($_.BaseName))
    Export-ModuleMember -Function $_.BaseName -Verbose
}