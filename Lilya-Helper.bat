@echo off
chcp 65001 >nul
setlocal enabledelayedexpansion
if not exist yt-dlp.exe goto reminder
if not exist "C:\Lilya-Helper" mkdir "C:\Lilya-Helper"
:zero-start
if not exist "C:\Lilya-Helper\ffm.txt" == goto ffmpreg
set ffmp="C:\Lilya-Helper\ffm.txt"
if exist ffmpeg.exe set thumb="--embed-thumbnail" & goto one-start
if "%ffmp%" == "no" goto begin
:one-start
if not exist "C:\Lilya-Helper\cookies.txt" goto cookies
TITLE Lilya Helper Version 1.0
echo i will check for updates first
yt-dlp --ignore-config -U

:begin
cls
mode 80,40
:menu
call :penis
for /f "delims=" %%x in (C:\Lilya-Helper\cookies.txt) do set cookies=%%x
ECHO Updates checked!
ECHO Now that seems to be all good
echo For now there is only functionality for YT-DLP
echo.
echo You can always come back here by typing "menu"
echo [Alternatively you can go "back" on an option]
echo.
:: ╚═╝╦║
:tryagain1
ECHO Do you want to extract audio(Will require FFMPEG)?
ECHO [y/n]
ECHO.
set /p q1=">> "
if "%q1%" == "y" goto audio
if "%q1%" == "menu" goto menu
if "%q1%" == "setting" goto setting
if "%q1%" == "" cls & call :penis & echo there seems to be an error try again & echo. & goto tryagain1
goto tryagain2

:tryagain2
ECHO Do you want THE best quality(Will require FFMPEG)
ECHO [1] (for best webm)[1w] or Good enough[2]?
ECHO.
ECHO [1,1w,2]
ECHO.
set /p q2=">> "
if "%q2%" == "menu" cls & echo. & goto menu
if "%q2%" == "back" cls & echo. & goto tryagain1
if "%q2%" == "old1" set quality="-f bestvideo+bestaudio/best"
if "%q2%" == "1" set quality="-f bv*[ext=mp4]+ba[ext=m4a]/b"
if "%q2%" == "1w" set quality="-f bv*[ext=webm]+ba[ext=webm]/best" 
if "%q2%" == "2" set quality="-f best"
if "%q2%" == "" cls & call :penis & echo there seems to be an error try again & echo. & goto tryagain2
goto final

:audio
ECHO.
echo Insert the link to download
echo [Alternatively you can just paste the ID of the youtube video]
SET /p op=">> "
if "%op%" == "menu" cls & echo. & goto menu
if "%op%" == "back" cls & echo. & goto tryagain1
if "%op%" == "" cls & echo there seems to be an error try again & goto audio
yt-dlp --cookies-from-browser %cookies% -x --audio-format mp3 %op%
goto end

:final
ECHO.
echo Insert the link to download
echo [Alternatively you can just paste the ID of the youtube video]
SET /p op=">> "
if "%op%" == "menu" cls & echo. & goto menu
if "%op%" == "back" cls & echo. & goto tryagain2
if "%op%" == "" cls & echo there seems to be an error try again & goto final
yt-dlp --cookies-from-browser %cookies% %thumb% %quality% %op% 
goto end

:end
echo.
echo.
echo.
echo thanks for using me :3
echo.
echo if there is more you wish to do you can go back by saying "menu" otherwise just press enter
set /p exit=">> "
if not "%exit%" == "menu" exit 
cls
echo. 
goto menu


:ffmpreg
title This is your first time, please read below
echo.
ECHO You may need to have FFMPEG to be able to do certain actions
echo For best quality and extracting audio
ECHO Open this link to download latest version: https://github.com/GyanD/codexffmpeg/release
ECHO Remember to install the "full_build" release
echo You can copy the link or typing "Link" to open in your default browser
echo If you do not wish to install, it's ok as it's not a hard requirement
set /p link=">> "
if not "%link%" == "link" goto ffm-final
call start https://github.com/GyanD/codexffmpeg/releases/latest & goto ffm-link
:ffm-link
ECHO After installing ffmpeg you can either put this file in the "bin" where the ffmpeg.exe resides
:ffm-final
ECHO.
ECHO If you have ffmpeg installed say "yes" or "no" if not
ECHO If you are having problems installing ffmpeg or making it work say "help"[this works in the first prompt as well]
if not exist "C:\Lilya-Helper" mkdir "C:\Lilya-Helper"
set /p answer=">> "
for /d %%i in (%answer%) do @echo %answer%> C:\Lilya-Helper\ffm.txt
if "%answer%" == "no" goto zero-start
if "%answer%" == "yes" goto zero-start
goto ffmpreg

:setting
echo. not implemented yet
goto zero-start

:cookies
cls
title Hallo, feed me your cookies
echo.
echo yt-dlp requires cookies access to download things and make you not look like a bot
echo Currently supported browsers are:
echo brave, chrome, chromium, edge, firefox, opera, safari, vivaldi, whale.
echo choose which one you prefer to get cookies from
set /p cookies1=">> "
if "%cookies1%" == "" cls & echo there seems to be an error try again & goto cookies
for /d %%i in (%cookies1%) do @echo %cookies1%> C:\Lilya-Helper\cookies.txt
goto zero-start	

:help
ECHO.
ECHO You are having problems with making ffmpeg/yt-dlp work or installing it
ECHO "ffmpeg" are the programs you need inside the "bin" folder where yt-dlp should resides
ECHO Check the ffmpeg folder and open the folder "bin"
EChO if you are still having problems contact Minty_Flur(The one who probably gave you the program :3 ehehe)
ECHO.
pause
exit

:reminder
CLS
:reminder1
ECHO.
ECHO Hey this file is not inside the folder where YT-DLP resides, please fix this
Echo It's recommended you make an standalone folder to put everything together
ECHO This is kapi, she is judging you
ECHO.
echo           ^/^/__^/^/ 
echo          ^/   -   ^\______________ 
echo         ^/                        ^\ 
echo        ^| Y                        ^\ 
echo        ^ \____^/ ^|                  ^| 
echo            __^/  ^\   ^/___    _     ^\ 
echo           ^/^/___^/ ^| ^|    ^\   ^| ^\   ^/  
echo                 ^/^/^/     ^/^/ ^/  ^/^/ ^/ 
ECHO.
ECHO You can type "link" to open the page to download YT-DLP
echo remembber to get exactly "yt-dlp.exe"
echo [It will open in your default browser]
set /p reminder=">> "
if not "%reminder%" == "link" cls & echo there seems to be an error try again & goto reminder1
call start https://github.com/yt-dlp/yt-dlp/releases/latest/ & goto reminder-final
:reminder-final
echo you can close this program and restart it
pause

:deprecated
exit

set count=0
for /f "tokens=*" %%x in (C:\Lilya-Helper\ffm.txt) do (
    set /a count+=1
    set ffm[!count!]=%%x
)

powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Hello world', 'This is called from a batch script.', [System.Windows.Forms.ToolTipIcon]::None)}"

:penis
for /F "delims=" %%A in ('echo prompt $E^| cmd') do set "ESC=%%A"
echo.
echo.
echo %ESC%[36m	      _     _ _               _   _      _                 %ESC%[0m
echo %ESC%[36m	     ^| ^|   (_) ^|             ^| ^| ^| ^|    ^| ^|                %ESC%[0m
echo %ESC%[36m	     ^| ^|    _^| ^|_   _  __ _  ^| ^|_^| ^| ___^| ^|_ __   ___ _ __ %ESC%[0m
echo %ESC%[36m	     ^| ^|   ^| ^| ^| ^| ^| ^|^/ _` ^| ^|  _  ^|^/ _ ^\ ^| '_ ^\ ^/ _ ^\ '__^|%ESC%[0m
echo %ESC%[36m	     ^| ^|___^| ^| ^| ^|_^| ^| (_^| ^| ^| ^| ^| ^|  __^/ ^| ^|_) ^|  __^/ ^|   %ESC%[0m
echo %ESC%[36m	     ^\_____^/_^|_^|^\__, ^|^\__,_^| ^\_^| ^|_^/^\___^|_^| .__^/ ^\___^|_^|   %ESC%[0m
echo %ESC%[36m	                 __^/ ^|                    ^| ^|              %ESC%[0m
echo %ESC%[36m	                ^|___^/                     ^|_^|       %ESC%[0m
echo.
echo.
