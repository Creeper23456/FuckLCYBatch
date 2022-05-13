@echo off
::change your api url in here,apply for all batch script.
set url=https://api.klpnb.cn/
goto check

:check
curl
if "%url%" == "" ( goto no_url )
if %errorlevel% == 9009 ( goto no_curl )
if not exist url.txt ( echo %url%>url.txt)
set /p api_addr=<url.txt
if not exist version.txt ( goto install )
goto update

:no_curl
cls
title ERROR
echo Your computer don't have cURL binary file,please install it in your system PATH
pause
exit

:no_url
cls
title ERROR
echo Your main.bat file don't set the url address properly,please change it.
pause
exit

:update

set /p version=<version.txt

echo Getting info form server...
curl -o version.txt %api_addr%version.txt
cls

set /p lastest_version=<version.txt

if not %version% == %lastest_version% ( goto updater )
if %errorlevel% == 0 ( goto mainloop_start )

goto update

:install
echo Setting up...
curl -o version.txt %api_addr%version.txt
cls
goto updater

:updater
echo Downloading update... 0/4
curl -o invisible.vbs %api_addr%invisible.vbs

cls
echo Downloading update... 1/4
curl -o mainloop.bat %api_addr%mainloop.bat

cls
echo Downloading update... 2/4
curl -o wallpaper.bat %api_addr%wallpaper.bat

cls
echo Downloading update... 3/4
curl -o wallpaper_updater.bat %api_addr%wallpaper_updater.bat

cls
echo Downloading update... 4/4
curl -o main.bat %api_addr%main.bat

if not %errorlevel% == 0 ( cls & echo Having issues with network connection,retry. & goto updater )
goto mainloop_start

:mainloop_start
invisible.vbs mainloop.bat
invisible.vbs wallpaper.bat
invisible.vbs wallpaper_updater.bat