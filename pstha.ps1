Add-Type -Assembly System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[void][reflection.assembly]::LoadFile((Join-Path $PSScriptRoot "Microsoft.Web.WebView2.WinForms.dll"))
[void][reflection.assembly]::LoadFile((Join-Path $PSScriptRoot "Microsoft.Web.WebView2.Core.dll"))

[System.Windows.Forms.Application]::EnableVisualStyles()


$form1 = New-Object System.Windows.Forms.Form

$webview = New-Object Microsoft.Web.WebView2.WinForms.WebView2
$webview.CreationProperties = New-Object 'Microsoft.Web.WebView2.WinForms.CoreWebView2CreationProperties'
$webview.CreationProperties.UserDataFolder = $Env:LOCALAPPDATA

$webview.dock = "fill"

$webview.Source = ([uri]"https://www.microsoft.com/")
$webview.Visible = $true

$form1.controls.add($webview)
$form1.showdialog()
