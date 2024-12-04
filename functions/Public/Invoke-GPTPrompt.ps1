<#
.SYNOPSIS
A function to interact with the GPT-4 model of the OpenAI API.

.DESCRIPTION
The Invoke-GPTPrompt function sends a user message to the GPT-4 model and retrieves the generated response. It creates a JSON formatted request body with the user message and some predefined parameters, and sends it to the OpenAI API. The function then returns the content of the response message.

.PARAMETER message
The user message that will be sent to the GPT-4 model. This message should be a string.

.EXAMPLE
```powershell
Invoke-GPTPrompt -message "Hello, world!"
```
This example sends the message "Hello, world!" to the GPT-4 model and prints the model's response.

.SYNTAX
```powershell
Invoke-GPTPrompt [-message] <string>
```
#>
function Invoke-GPTPrompt {
    param (
        [string]
        $message
    )

    [System.Collections.Generic.List[Hashtable]]$messages = @()
    $messages.Add(@{"role" = "system"; "content" = $script:context }) | Out-Null
    $messages.Add(@{"role" = "user"; "content" = $message })

    $headers = @{
        "Content-Type"  = "application/json"
        "Authorization" = ("Bearer {0}" -f $script:token)
    }

    $requestBody = @{
        "model"       = "gpt-4"
        "messages"    = $messages
        "max_tokens"  = 2000 # Max amount of tokens the AI will respond with
        "temperature" = 0.5 # lower is more coherent and conservative, higher is more creative and diverse.
    }

    $ApiEndpoint = "https://api.openai.com/v1/chat/completions"
    $response = Invoke-RestMethod -Method POST -Uri $ApiEndpoint -Headers $headers -Body (ConvertTo-Json $requestBody)
    return $response.choices[0].message.content
}
