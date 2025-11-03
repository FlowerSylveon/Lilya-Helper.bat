@echo off
setlocal enabledelayedexpansion
set count=0
for /f "tokens=*" %%x in (C:\Lilya-Helper\ffm.txt) do (
    set /a count+=1
    set ffm[!count!]=%%x
)
TITLE Hai KayDee I'm here to help
echo hi KayDee :3
echo i will check for updates first
yt-dlp -U
cls
if "%ffm[1]%" == "yes" goto begin
goto ffm

:begin
cls
ECHO Now that seems to be all good
ECHO.
ECHO Do you want to extract audio(Will require FFMPEG)?
ECHO [y/n]
set /p q1=
if "%q1%" == "y" set audio="-x --audio-format mp3"
if "%q1%" == "n" set audio=
ECHO. 
ECHO Do you want THE best quality(Will require FFMPEG)[1] or good enough[2]?
ECHO [1,2]
set /p q2=
if "%q2%" == "2" set quality="-f best"
if "%q2%" == "1" set quality="-f bestvideo+bestaudio/best"
goto final

:final
echo insert the link with whatever options you may need
echo after that this window will close
SET /p op=
yt-dlp --cookies-from-browser firefox %audio% %quality% %op% 
goto end

:ffm
if "%ffm[1]%" == "yes" goto begin
ECHO you may need to have FFMPEG to be able to do this as it needs to be re-encoded to mp3
ECHO Open this link to download latest version: https://github.com/GyanD/codexffmpeg/releases
ECHO after installing ffmpeg put all the programs in the "bin" inside the same folder that resides the yt-dlp
ECHO.
ECHO if you have ffmpeg installed say "yes" or "no"
if not exist "C:\Lilya-Helper" mkdir "C:\Lilya-Helper"
set /p answer=
for /d %%i in (%answer%) do @echo %answer%> C:\Lilya-Helper\ffm.txt
@echo %ffm[1]%
if "%answer%" == "yes" goto begin
goto ffm

:end
echo.
echo.
echo.
echo thanks  for using me :3
pause
exit
