function Crea-Credenciales {param ($user,$password)
if ($user -eq $null -or $pass -eq $null) {return "Insuficientes prametros`n`nEjemplo:`n`$credenciales = Crea-Credenciales -user cabesha -password de_nabo" ; break}
$securestring = ConvertTo-SecureString -String $password –asplaintext –force 
$credenciales = New-Object System.Management.Automation.PSCredential $user,$securestring
return $credenciales

}


function Execute-Function-AS {param($credenciales,$comando,$funcion)
$help = @"
Insuficientes prametros`n`nEjemplo:`nExecute-Function-As -credenciales `$creds -comando whoami`nExecute-Function-As -credenciales `$creds -comando Invoke-funcion -function `${Function:Check-Apps}
"@
if ($credenciales -eq $null -or $comando -eq $null) {return $help; break}

if ($funcion -eq $null) {Start-Job -ArgumentList $comando -ScriptBlock {param($comando) ; Invoke-Expression $comando} -Credential $credenciales | Wait-Job | Receive-Job}

if ($funcion -ne $null) {Start-Job -ArgumentList $comando,$funcion -ScriptBlock {param($comando,$funcion) ; IEX $funcion; $comando } -Credential $credenciales | Wait-Job | Receive-Job}

}
