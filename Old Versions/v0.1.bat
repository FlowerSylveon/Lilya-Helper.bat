@echo off
echo hi KayDee :3
echo i will check for updates first
yt-dlp -U
echo .
echo ..
echo ...
echo now that it's checked
echo insert the link with whatever options you may need
echo after that this window will close
SET /p op=
yt-dlp --cookies-from-browser firefox %op%
echo.
echo.
echo.
echo thanks  for using me :3
pause
