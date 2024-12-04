<#
.SYNOPSIS
This function is used to connect to GPT with a specific token.

.DESCRIPTION
The Connect-GPT function sets the global token variable to the value passed in the $Token parameter. This token is typically used for authentication purposes when connecting to GPT.

.PARAMETER Token
This parameter is used to specify the token to be used for connecting to GPT. It should be passed as a string.

.EXAMPLE
```PowerShell
Connect-GPT -Token "your_token_here"
```
This example shows how to use the Connect-GPT function with a token.

.SYNTAX
```PowerShell
Connect-GPT [-Token] <string>
```
This is the syntax for using the Connect-GPT function. The Token parameter is required and should be passed as a string.
#>
function Connect-GPT {
    param (
        [string]
        $Token
    )

    $script:token = $Token
}
