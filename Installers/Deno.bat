@echo off
	title Installing Deno
	echo Downloading Deno
	call powershell "irm https://deno.land/install.ps1 | iex"
	move "%userprofile%\.deno\bin\deno.exe" %cd%
	echo.
	echo Installing requirements
	echo.
	python -m pip install -U yt-dlp-ejs
	echo All done
