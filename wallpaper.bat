@echo off
title fuck LCY wallpaper changer

goto mainloop

:mainloop
reg add "hkcu\control panel\desktop" /v Wallpaper /d "%cd%\wallpaper.jpg" /f
reg add "hkcu\control panel\desktop" /v WallpaperStyle /t REG_DWORD /d 1 /f
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters
timeout /t 30
goto mainloop