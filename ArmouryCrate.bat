@echo off
chcp 65001 >nul 2>&1
cls
>nul 2>&1 "%SystemRoot%\system32\cacls.exe" "%SystemRoot%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo.
    echo   Requesting administrator...
    powershell -Command "Start-Process '%~f0' -Verb runAs" >nul 2>&1
    exit /b
)

title Armoury Crate Services

:menu
cls
echo.
echo  ╔══════════════════════════════════════════════════╗
echo  ║       ARMOURY CRATE SERVICES                     ║
echo  ╚══════════════════════════════════════════════════╝
echo.
echo  [1] Disable all services  
echo  [2] Enable all services  
echo.
echo  [0] Exit
echo.
set /p choice=  Enter your choice (0-2): 

if "%choice%"=="1" goto disable
if "%choice%"=="2" goto enable
if "%choice%"=="0" goto end

echo.
echo  Invalid choice! Please type 0, 1 or 2.
timeout /t 3 >nul
goto menu


:disable
cls
echo.
echo  Disabling all Armoury Crate services...
echo.
sc config "ArmouryCrateService" start= disabled >nul 2>&1
sc config "LightingService" start= disabled >nul 2>&1
sc config "ROG Live Service" start= disabled >nul 2>&1
sc config "ASUS Update Service" start= disabled >nul 2>&1
sc config "ASUS System Control Service" start= disabled >nul 2>&1
sc config "ASUS Motherboard" start= disabled >nul 2>&1
sc config "AacVGA" start= disabled >nul 2>&1
sc config "AacAmbientHAL" start= disabled >nul 2>&1

echo  Stopping any running services...
net stop "ArmouryCrateService" >nul 2>&1
net stop "LightingService" >nul 2>&1
net stop "ROG Live Service" >nul 2>&1

echo.
echo  All Armoury Crate services are now disabled.
echo  Restart your PC...
echo.
pause
goto end


:enable
cls
echo.
echo  Enabling all Armoury Crate services...
echo.
sc config "ArmouryCrateService" start= auto >nul 2>&1
sc config "LightingService" start= auto >nul 2>&1
sc config "ROG Live Service" start= auto >nul 2>&1
sc config "ASUS Update Service" start= auto >nul 2>&1
sc config "ASUS System Control Service" start= auto >nul 2>&1
sc config "ASUS Motherboard" start= auto >nul 2>&1
sc config "AacVGA" start= demand >nul 2>&1
sc config "AacAmbientHAL" start= auto >nul 2>&1

echo  Starting main services...
net start "ROG Live Service" >nul 2>&1
net start "ArmouryCrateService" >nul 2>&1
net start "LightingService" >nul 2>&1

echo.
echo  All Armoury Crate services are now enabled.
echo  You don't need to Restart PC.
echo.
pause
goto end


:end
exit