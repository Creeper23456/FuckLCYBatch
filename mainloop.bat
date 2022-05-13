@echo off
set status=0
set curl_cmd="%%{http_code}"
set /p api_addr=<url.txt
goto mainloop

:mainloop
curl -w "%curl_cmd%" %api_addr%index.php?status >remote_status.txt
set /p remote_status=<remote_status.txt

title %remote_status%

if %remote_status% == 200 ( goto ban_disable )
if %remote_status% == 404 ( goto ban_enable )

goto mainloop

:ban_disable

set status=0
goto mainloop

:ban_enable

set status=1
taskkill /F /IM QQMusic.exe
taskkill /F /IM msedge.exe
goto mainloop
