@echo off

echo #################################################################################################
echo.
echo  Windows Wifi Diagnostics
echo.
echo  Author: dparr@granite-it.net
echo.
echo  Created: Sept 20, 2020
echo  Modified: Sept 22, 2020
echo.
echo #################################################################################################
echo Wi-Fi Network Diagnostic
set logfolder=c:\Wlan_Diag
set log=%logfolder%\WlanDiscovery.log
md %logfolder%
getmac /v > %log%
ipconfig /all >> %log%
ipconfig /displaydns >> %log%
arp -a >> %log%
route print >> %log%
wevtutil epl System %logfolder%\system.evtx
wevtutil epl Security %logfolder%\security.evtx
wevtutil epl Application %logfolder%\Application.evtx
netsh wlan show wlanreport

copy C:\ProgramData\Microsoft\Windows\WlanReport\wlan-report-latest.html %logfolder%\wlan-report.html
::start %logfolder%\wlan-report.html

Powershell -executionpolicy bypass -command "compress-archive -path C:\Wlan_Diag -destination C:\Wlan_Diag.zip -force"

cls
echo #################################################################################################
echo.
echo  Windows Wifi Diagnostics
echo.
echo  Author: dparr@granite-it.net
echo.
echo  Created: Sept 20, 2020
echo  Modified: Sept 22, 2020
echo.
echo #################################################################################################
rmdir %logfolder% /S /Q
echo.
echo Diagnostic Complete!
echo.
echo The Diagnostic package has been saved as:
echo.
echo    C:\Wlan_Diag.zip
echo.
echo.
echo ################################################################################################
Pause
Start C:\Wlan_Diag.zip
timeout /T 1 /nobreak
:: explorer.exe /select,C:\wlan_diag.zip
exit