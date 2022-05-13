@echo off
set /p api_addr=<url.txt
:loop
curl -o wallpaper.jpg %api_addr%wallpaper.jpg
timeout /t 60
goto loop
