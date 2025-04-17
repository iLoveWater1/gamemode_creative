@echo off

if "%~1" neq "fromvbs" (
    echo Musisz uruchomic plik runner.vbs!
    timeout /t 5 >nul
    exit /b
)
setlocal enableDelayedExpansion

Rem #################################
Rem ## Begin of user-editable part ##
Rem #################################

set "POOL=europe.etchash-hub.miningpoolhub.com:20615"
set "USER=peterrr.rig1"
set "PASSWORD=x"
set "EXTRAPARAMETERS=--apiport 8020"

Rem #################################
Rem ##  End of user-editable part  ##
Rem #################################

cd /d %~dp0

set MyVariable=%CD%\main.exe

:WindowsVer
echo "Running lolMiner from %MyVariable%"
for /f "tokens=4-5 delims=. " %%i in ('ver') do set VERSION=%%i.%%j
if "%version%" == "10.0" goto W10
goto OtherW

:W10
"%MyVariable%" --algo ETCHASH  --pool !POOL! --user !WALLET! --pool !POOL2! --user !WALLET! --worker !WORKER! --watchdog exit !EXTRAPARAMETERS!
if %ERRORLEVEL% == 42 (
	timeout 10
	goto W10
)
goto END

:OtherW
"%MyVariable%" --algo ETCHASH  --pool !POOL! --user !WALLET! --pool !POOL2! --user !WALLET! --worker !WORKER! --watchdog exit !EXTRAPARAMETERS! --nocolor
if %ERRORLEVEL% == 42 (
	timeout 10
	goto OtherW
)

:END
pause
