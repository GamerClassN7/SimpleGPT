<#
.SYNOPSIS
A function to set the global context variable.

.DESCRIPTION
The Set-GPTContext function is used to set the value of a global context variable in the PowerShell script. This function takes a string parameter and assigns it to the global context variable.

.PARAMETER Context
This is a string parameter which represents the value to be assigned to the global context variable.

.EXAMPLE
Set-GPTContext -Context "This is a new context"

This command sets the global context variable to the string "This is a new context".

.SYNTAX
Set-GPTContext [-Context] <string>
#>
function Set-GPTContext {
    param (
        [string]
        $Context
    )

    $script:context = $Context
}
