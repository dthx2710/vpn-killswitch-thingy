@echo off
pushd "%~dp0"

setlocal enabledelayedexpansion

:: Prompt for UAC elevation if necessary
>nul 2>&1 "%SYSTEMROOT%\System32\cacls.exe" "%SYSTEMROOT%\System32\config\system"
if %errorlevel% neq 0 (
    powershell -Command "Start-Process -Verb RunAs cmd.exe '/c \"%~dpnx0\" %*'"
    exit /B
)

REM Read the IP addresses from the text file
for /F "tokens=1,2 delims=:" %%G in (config.txt) do (
  if "%%G"=="gateway-ip" (
    set gateway_ip=%%H
  )
  if "%%G"=="vpn-ip" (
    set vpn_ip=%%H
  )
)

echo Gateway IP: !gateway_ip!
echo VPN IP: !vpn_ip!
echo Enabling...

REM Disable
route delete !vpn_ip!
route add 0.0.0.0 mask 0.0.0.0 !gateway_ip!

endlocal

echo Click any key to continue...
pause > nul