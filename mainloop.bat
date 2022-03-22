@echo off
set status=0
set curl_cmd="%%{http_code}"
goto mainloop

:mainloop
curl -w "%curl_cmd%" https://api.klpnb.cn/index.php?status >remote_status.txt
set /p remote_status=<remote_status.txt

title %remote_status%

if %remote_status% == 200 ( goto ban_disable )
if %remote_status% == 404 ( goto ban_enable )

goto mainloop

:ban_disable

rem if %status% == 1 ( start explorer.exe )
set status=0
goto mainloop

:ban_enable

set status=1
rem taskkill /F /IM explorer.exe
taskkill /F /IM QQMusic.exe
taskkill /F /IM msedge.exe
rem msg.vbs FUCK YOU
goto mainloop