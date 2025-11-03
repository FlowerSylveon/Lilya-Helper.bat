@echo off
setlocal enabledelayedexpansion
set count=0
for /f "tokens=*" %%x in (C:\Lilya-Helper\ffm.txt) do (
    set /a count+=1
    set ffm[!count!]=%%x
)
if "%ffm[1]%" == "no" goto begin
TITLE Hai KayDee I'm here to help
if not exist yt-dlp.exe goto reminder
echo hi KayDee :3
echo i will check for updates first
yt-dlp -U

if exist ffmpeg.exe goto begin
goto ffm

:begin
cls
ECHO Updates checked!
ECHO Now that seems to be all good
ECHO.
:tryagain1
ECHO Do you want to extract audio(Will require FFMPEG)?
ECHO [y/n]
ECHO.
set /p q1=
if "%q1%" == "y" goto audio
if "%q1%" == "" cls & echo there seems to be an error try again & echo. & goto tryagain1
:tryagain2
ECHO Do you want THE best quality(Will require FFMPEG)[1](for best webm)[1w] or good enough[2]?
ECHO [1,1w,2]
set /p q2=
if "%q2%" == "back" cls & echo. & goto tryagain1
if "%q2%" == "old1" set quality="-f bestvideo+bestaudio/best"
if "%q2%" == "1" set quality="-f bv*[ext=mp4]+ba[ext=m4a]/b"
if "%q2%" == "1w" set quality="-f bv*[ext=webm]+ba[ext=webm]/best" 
if "%q2%" == "2" set quality="-f best"
if "%q2%" == "" cls & echo there seems to be an error try again & echo. & goto tryagain2
goto final

:audio
ECHO.
echo insert the link to download, alternatively you can just paste the ID of the youtube video
echo after that this window will close
SET /p op=
if "%op%" == "back" cls & echo. & goto tryagain1
if "%op%" == "" cls & echo there seems to be an error try again & goto audio
yt-dlp --cookies-from-browser firefox -x --audio-format mp3 %op%
goto end

:final
echo.
echo insert the link to download, alternatively you can just paste the ID of the youtube video
echo after that this window will close
SET /p op=
if "%op%" == "back" cls & echo. & goto tryagain2
if "%op%" == "" cls & echo there seems to be an error try again & goto final
yt-dlp --cookies-from-browser firefox --embed-thumbnail %quality% %op% 
goto end

:ffm
ECHO you may need to have FFMPEG to be able to do certain actions, for best quality and extracting audio
ECHO Open this link to download latest version: https://github.com/GyanD/codexffmpeg/releases
ECHO Remember to install the "full_build" release
ECHO after installing ffmpeg put all the programs in the "bin" inside the same folder that resides the yt-dlp
ECHO.
ECHO if you have ffmpeg installed say "yes" or "no"
ECHO if you are having problems installing ffmpeg or making it work say "help"(this works in the first prompt as well)
if not exist "C:\Lilya-Helper" mkdir "C:\Lilya-Helper"
set /p answer=
if "%answer%" == "help" goto help
for /d %%i in (%answer%) do @echo %answer%> C:\Lilya-Helper\ffm.txt
if "%answer%" == "yes" goto begin
goto ffm

:end
echo.
echo.
echo.
echo thanks  for using me :3
pause
exit

:help
ECHO.
ECHO You are having problems with making ffmpeg work or installing it
ECHO "ffmpeg ffplay ffprobe" are the programs you need iniside the folder where yt-dlp resides
ECHO check the ffmpeg folder and open the folder "bin"
EChO if you are still having problems contact Minty Flur(The one who probably gave you the program :3 ehehe)
ECHO.
pause
exit

:reminder
CLS
ECHO.
ECHO Hey this bat is not inside the folder where YT-DLP resides, please fix this
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
pause
exit
