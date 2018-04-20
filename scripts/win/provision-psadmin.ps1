Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
choco install git -params '"/GitAndUnixToolsOnPath"' -y
choco install procexp -y
choco install beyondcompare -y
choco install handle -y
choco install agentransack -y
choco install aria2 -y
choco install rsync -y
choco install wget -y
choco install jq -y 
If (Test-Path Alias:wget) {Remove-Item Alias:wget}
If (Test-Path Alias:wget) {Remove-Item Alias:wget}
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 
# git clone https://github.com/MarisElsins/getMOSPatch.git c:/psft/tools/getMOSPatch
netsh advfirewall firewall add rule name="PIA" dir=in localport=8000 protocol=TCP action=allow
netsh advfirewall firewall add rule name="Oracle" dir=in localport=1522 protocol=TCP action=allow
Set-ExecutionPolicy Unrestricted