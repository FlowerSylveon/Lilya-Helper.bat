@echo off
	title Installing SpotDL.exe
	echo Downloading SpotDL-4.5.2.exe
	echo.
	curl -L https://github.com/spotDL/spotify-downloader/releases/download/v4.5.2/spotdl-4.5.2-win32.exe > spotdl-4.5.2-win32.exe
	ren "spotdl-4.5.2-win32.exe" "SpotDL.exe"
	echo All done
pause
