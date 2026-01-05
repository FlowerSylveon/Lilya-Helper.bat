@echo off
setlocal enabledelayedexpansion
	set count=0
	for /f "tokens=*" %%x in (C:\Lilya-Helper\ffm.txt) do (set /a count+=1 & set ffmp[!count!]=%%x)
TITLE Lilya Helper Version 1.2v-beta
if not exist "C:\Lilya-Helper" mkdir "C:\Lilya-Helper"
if not exist yt-dlp.exe goto help-ytdlp

		:zero-start :inital start
			if not exist "C:\Lilya-Helper\ffm.txt" == goto ffmpreg
			set ffmp="C:\Lilya-Helper\ffm.txt"
			if exist ffmpeg.exe set thumb="--embed-thumbnail" & goto one-start
			if "%ffmp[1]%" == "no" goto begin
		:one-start :real start of the program
			if not exist "C:\Lilya-Helper\cookies.txt" goto cookies
	TITLE Lilya Helper Version 1.2v-beta
	echo i will check for updates first
	set message="Updates checked"
	::yt-dlp --ignore-config -U

	:begin
cls
mode 80,40
	:menu :initial menu
call :penis
for /f "delims=" %%x in (C:\Lilya-Helper\cookies.txt) do set cookies=%%x
ECHO 		             %message%
ECHO 		      Now that seems to be all good
echo               ^(For now there is only functionality for YT-DLP^)
echo.
	:tryagain1 :back option | error callback
echo 			     Extra Options:
echo        Menu: Come back here         ^| 	Back: goes back an option
echo        Setting: Unavailable         ^| 	Help: Display Help menu
echo        Changelog: Display Changes   ^| 	Bug: Goes to bug and issues page
if exist "spot2yt.py" echo 		      Spot2yt: Spotify Downloader
echo.
ECHO 			Here some options for you
echo 		    Some require ffmpeg [FPG prefix]
ECHO 			      Good enough [1]
echo.
echo 		      [FPG] Best Quality(MP4) [2]
echo 		     [FPG] Best Quality(WEBM) [2w]
echo 		  [FPG] Audio Extraction(MP3) [audio]
ECHO.
ECHO 		             [1^|2^|2w^|Audio]
ECHO.
set op=
set /p op=">> "
	if "%op%" == "menu" cls & echo. & goto menu
	if "%op%" == "res" cls & echo. & goto begin
	if "%op%" == "back" cls & echo. & echo there is nothing to go back to & goto tryagain1
	if "%op%" == "setting" goto setting
	if "%op%" == "help" goto help
	if "%op%" == "spot2yt" goto spot2yt
	if "%op%" == "audio" goto audio
	if "%op%" == "old1" set quality="-f bestvideo+bestaudio/best"
	if "%op%" == "2" set quality="-f bv*[ext=mp4]+ba[ext=m4a]/b"
	if "%op%" == "2w" set quality="-f bv*[ext=webm]+ba[ext=webm]/best" 
	if "%op%" == "1" set quality="-f best"
	if "%op%" == "" cls & call :penis & echo there seems to be an error try again & echo. & goto tryagain1
goto final

	:audio
ECHO.
echo Paste the media link to download
echo [Alternatively you can just paste the ID of the youtube video]
set op=
SET /p op=">> "
if "%op%" == "menu" cls & echo. & goto menu
if "%op%" == "back" cls & echo. & goto tryagain1
if "%op%" == "" cls & echo there seems to be an error try again & goto audio
yt-dlp --cookies-from-browser %cookies% -x --audio-format mp3 %op%
goto end

	:final
ECHO.
echo Paste the media link to download
echo [Alternatively you can just paste the ID of the youtube video]
set op=
SET /p op=">> "
if "%op%" == "menu" cls & echo. & goto menu
if "%op%" == "back" cls & echo. & goto tryagain1
if "%op%" == "" cls & echo there seems to be an error try again & goto final
yt-dlp --cookies-from-browser %cookies% %thumb% %quality% %op% 
goto end

	:spot2yt
echo. 
echo Paste the spotify link to download
echo It can be Album or Singles
set /p link=">> "
spot2yt.py %link%
goto end

	:end
echo.
echo.
echo.
echo Thanks for using me :3
echo.
echo If there is more you wish to do you can go back by saying "menu" otherwise just press enter
set /p exit=">> "
if not "%exit%" == "menu" exit 
cls
echo. 
goto menu

		:setting
	CLS
	:setting1
call :penis
echo.
echo                            not implemented yet
echo      [Cookies] Set browser cookies ^| [Install] Install certain dependencies
echo.
set setting=
set /p settings=">> "
	if "%settings%" == "travel" goto travel 
	if "%settings%" == "cookies" goto cookies 
	if "%settings%" == "install" goto install 
	if "%settings%" == "" cls &echo there seems to be an error try again&echo.& goto setting1
goto zero-start

:cookies
cls
:cookies1
call :penis
title I am the Cookie Master, feed me your cookies
echo.
echo YT-DLP requires cookies access to download media
echo Cookies needs to be refreshed each use and it takes from your browser
echo Currently supported browsers are:
echo brave, chrome, chromium, edge, firefox, opera, safari, vivaldi, whale.
echo choose which one you prefer to get cookies from
set cookies=
set /p cookies1=">> "
	if "%cookies%" == "back" goto setting
	if "%cookies%" == "menu" cls & goto menu
	if "%cookies%" == ""  cls &echo there seems to be an error try again &echo.&goto cookies1
	for /d %%i in (%cookies%) do @echo %cookies%> C:\Lilya-Helper\cookies.txt
goto zero-start	

:install
set installerpath="https://raw.githubusercontent.com/FlowerSylveon/Lilya-Helper.bat/refs/heads/Dev/Installers"
	echo What do you wish to install
	echo [Spot2yt] Uses spotify links to download albums^|music^|artist
	echo [FFMPEG] ffmpeg program
	echo.
	set /p inst=">> "
		if "%inst%" == "deno" goto install-deno
		if "%inst%" == "spot2yt" goto install-spot2yt

	:install-spot2yt
	title Installing Spot2yt.py
	echo Downloading Spot2yt.py
	echo.
	curl -L https://github.com/masterofobzene/spot2yt/releases/download/1.0/spot2yt.zip > spot2yt.zip & tar -xf spot2yt.zip
	if not exist "%userprofile%\AppData\Local\Programs\Python\Python313\Scripts\pip.exe" do (curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" & python get-pip.py & del get-pip.py)
	echo.
	echo Installing requirements
	echo.
	python -m pip install -r requirements.txt
	del requirements.txt&del spot2yt.zip
	:install-spot2yt-ID
	curl -L %installerpath%/Spot2yt-ID-Handler.bat
	call Spot2yt-ID-Handler.bat
	echo All done
	set message="Spot2yt.py Installed"
	del Spot2yt-ID-Handler.bat
	goto begin

	:install-ffmpeg
	title Installing FFMPEG
	echo.
	echo Downloading FFMPEG
	curl -L https://github.com/GyanD/codexffmpeg/releases/download/8.0/ffmpeg-8.0-full_build.zip > ffmpeg-8.0-full_build.zip & ren "ffmpeg*.zip" "ffmpeg.zip" & tar -xf ffmpeg.zip
	del ffmpeg.zip & rename ffmpeg-8.0-full_build ffmpeg & move ffmpeg\bin\ffmpeg.exe & move ffmpeg "C:\Lilya-Helper" & set message="ffmpeg installed" & goto install-ffmpeg2
		:install-ffmpeg2
		echo %message% ^| You can restart the program now
	pause
	
	:install-deno
	echo Installing Deno
	curl -L %installerpath%/Deno.bat > Deno.bat
	call Deno.bat
	set message="Deno Installed"
	del Deno.bat
	goto begin
	

:Changelog
echo 1.2v&echo.&echo [&echo Implementation of changelog&echo.&echo Fixed some typos&echo.&echo Cleaner coding&echo.&echo Improved Menus: Start, Help, Cookies, Settings, YT-DLP&echo.&echo Added Pages: Added "Help-FFMPEG" "Help-Setting" "Help-yt-dlp" "Install" "Install-Spot2yt"&echo.&echo Improved Pages: ffmpeg, help, cookies, yt-dlp&echo.&echo Implementation of: Installation process, Spot2yt Script, Installation of YT-DLP at first execution &echo.&echo 

:help
cls
mode 40,20
echo What do you need help with?
ECHO.
echo Type these to get to their help menu:
echo [ffmpeg] [setting] [yt-dlp]
echo type menu to go back at the start
set /p help=">> "
	if "%help%" == "ffmpeg" goto help-ffmpeg
	if "%help%" == "setting" goto setting
	if "%help%" == "yt-dlp" goto help-ytdlp

:ffmpreg
title This is your probably first time, please read below
echo.
ECHO You may need to have FFMPEG to be able to do certain actions
echo For best quality video and extracting audio
ECHO Open this link to download latest version: https://github.com/GyanD/codexffmpeg/releases/latest
ECHO Remember to install the "full_build" release
echo You can copy the link or typing "Link" to open in your default browser
echo If you do not wish to install, it's ok as it's not a hard requirement
set /p link=">> "
if not "%link%" == "link" goto ffm-final
call start https://github.com/GyanD/codexffmpeg/releases/latest & goto ffm-link
:ffm-link
ECHO Extract the full_build and ffmpeg should be on the folder "bin" after that
echo After that you can put ffmpeg where yt-dlp is or use the Setting option for remote access(Current Unavailable)
:ffm-final
ECHO.
ECHO If you have ffmpeg installed say "yes" or "no" if not
ECHO If you are having problems installing ffmpeg or making it work say "help"[this works in the first prompt as well]
set /p answer=">> "
if "%answer%" == "help" goto help-ffmpeg
for /d %%i in (%answer%) do @echo %answer%> C:\Lilya-Helper\ffm.txt
if "%answer%" == "no" goto zero-start
if "%answer%" == "yes" goto zero-start
goto ffmpreg

	:help-ffmpeg
cls
mode 80,30
echo.
echo                 FFMPEG provides encoding and merging media files
ECHO                          This program is used for
echo                      [encoding] [remux] [merging files]
echo                        used on YT-DLP for better quality
ECHO                You can type "download" to directly download ffmpeg
echo.
echo                              or copy this link 
echo               https://github.com/GyanD/codexffmpeg/releases/latest
ECHO            remember to get "full_build" and getting ffmpeg in the bin
echo.
set op=
set /p op=">> "
	if "%op%" == "download" goto install-ffmpeg
	if "%op%" == "link" call start https://github.com/GyanD/codexffmpeg/releases/latest & set message="waiting for ffmpeg to be installed" & goto install-ffmpeg2

		:help-ytdlp
	CLS
	mode 90,30
	:help-ytdlp-1
	ECHO.
	ECHO                             This batch has functionality with YT-DLP and cannot find yt-dlp
	ECHO                          This tool is used make yt-dlp easier to use and better functionality
	Echo                       It's recommended you make an standalone folder to put everything together
	ECHO                                 You can type "download" to directly download YT-DLP
	echo                                              Or just copy this link
	echo                                 https://github.com/yt-dlp/yt-dlp/releases/latest/
	echo                                        Remember to get exactly "yt-dlp.exe" 
	set /p help=">> "
		if "%help%" == "download" curl -L https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe > yt-dlp.exe
		if "%help%" == "link" call start https://github.com/yt-dlp/yt-dlp/releases/latest
	cls & echo there seems to be an error try again & goto help-ytdlp-1
	goto zero-start

:penis
setlocal
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
endlocal
