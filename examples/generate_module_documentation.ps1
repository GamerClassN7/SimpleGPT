Import-Module ./SimpleGPT.psm1 -force
Connect-GPT -Token "YOUR TOKEN"
Set-GPTContext -Context "You are programmer writing the documentation, in powersehll language"

$functionFiles = Get-ChildItem -Path ./functions -Recurse -File -Filter '*.ps1' |
Where-object -Filter { -not $_.Name.StartsWith("dev_") }

foreach ($functionFile in $functionFiles) {
    <# $currentItemName is the current item #>
    $functionCOntent = Get-Content -Raw -Path $functionFile.FullName
    $anotation = Invoke-GPTPrompt -message ('Can you generate poveshell anotation gor this function ? ```{0}``` include onlty this items SYNOPSIS, DESCRIPTION, PARAMETER, EXAMPLE, SYNTAX. All 5 items of anotation are mandatory, return only anotation raw nothing else no formating or other descriptive text or  ``` just the plain text' -f $functionCOntent )
    $anotation = $anotation.TrimStart('```powersehll')
    $anotation = $anotation.TrimEnd('```')

    $pattern = '<#([\s\S]*?)#>'
    if ($functionCOntent -match $pattern) {
        ($functionCOntent -replace $pattern, $anotation).Trim("`n") | Set-Content -Path $functionFile.FullName
    } else {
        ($anotation + "`n" + $functionCOntent).Trim("`n") | Set-Content -Path $functionFile.FullName
    }
}
Import-Module ./SimpleGPT.psm1 -force


