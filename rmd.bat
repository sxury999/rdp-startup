@echo off
:: Check if the script is running with administrator privileges
openfiles >nul 2>nul
if %errorlevel% NEQ 0 (
    echo This script needs to be run as Administrator. Exiting...
    pause
    exit /b
)

:: Enable Remote Desktop by modifying the registry
echo Enabling Remote Desktop...
reg add "HKLM\System\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

:: Enable the Remote Desktop firewall rule
echo Enabling Remote Desktop Firewall rule...
netsh advfirewall firewall set rule group="remote desktop" new enable=yes

:: Start Remote Desktop service
echo Starting Remote Desktop service...
net start termservice

:: Display a message to the user
echo Remote Desktop is now enabled.
pause
