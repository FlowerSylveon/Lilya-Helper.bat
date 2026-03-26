set installerpath="https://raw.githubusercontent.com/FlowerSylveon/Lilya-Helper.bat/refs/heads/Dev/Installers"

echo What do you wish to install
echo [Deno]    Decomplicates JS for YT-DLP downloading process
echo [Spot2yt] Uses spotify links to download albums^|music^|artist
echo [FFMPEG]  FFMPEG program

set /p inst=">> "
goto install-%inst%

:install-deno
	title Installing Deno & echo Installing Deno
	curl -L %installerpath%/Deno.bat > Deno.bat
	call Deno.bat
	set message="Deno Installed"
	del Deno.bat
