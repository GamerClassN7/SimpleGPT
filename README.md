# SimpleGPT
Module created as simple helper for generating large amount of documentation for corporate based powersehll module it is not perfect bud better than most stuff I can write :) after some tweaking it is pretty decent :).

### Exmaple Usage
```powershell
Import-Module ./SimpleGPT.psm1 -force
Connect-GPT -Token "token"
Set-GPTContext -Context "context"
Invoke-GPTPrompt -message "question"
```

#### More Examples
[./examples](./examples)
