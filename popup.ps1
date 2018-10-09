# Simple popup alert with a question and response in the tty
Add-Type -AssemblyName PresentationCore,PresentationFramework
$ButtonType = [System.Windows.MessageBoxButton]::YesNoCancel
$MessageIcon = [System.Windows.MessageBoxImage]::Exclamation
$MessageBody = "Esto nos mejora"
$MessageTitle = "#ROJIRRINS"
$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)
Write-Host "Nos mejora?: $Result"
