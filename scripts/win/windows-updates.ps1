$ProgressPreference='SilentlyContinue'
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

Install-PackageProvider -Name NuGet -RequiredVersion 2.8.5.201 -Force
Install-Module PSWindowsUpdate -force
Get-WUInstall -WindowsUpdate -AcceptAll -Install -UpdateType Software -IgnoreReboot
