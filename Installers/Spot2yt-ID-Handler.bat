@echo off
setlocal enabledelayedexpansion

	ren spot2yt.py sample.py
	set "OID=YOUR_ID_HERE"
	set "IDR=6233cdd0509745b4a4e3ddcca3129e01"
	set "SpotSam=sample.py"
	set "SpotF=spot2yt-1.py"

	(for /f "tokens=*" %%a in ('type "%SpotSam%" ^| findstr /n "^"') do (
		set "line=%%a"
		set "line=!line:*:=!"

		if defined line (
			set "line=!line:%OID%=%IDR%!"
			echo(!line!
		) else echo.
	)) > "%SpotF%"
	
	set "SID=YOUR_SECRET_HERE"
	set "SIDR=2e2511e2a6bf42e386591c559bb90912"
	set "SpotFinal=spot2yt-2.py"
	
	(for /f "tokens=*" %%a in ('type "%SpotF%" ^| findstr /n "^"') do (
		set "line=%%a"
		set "line=!line:*:=!"

		if defined line (
			set "line=!line:%SID%=%SIDR%!"
			echo(!line!
		) else echo.
	)) > "%SpotFinal%"
	copy spot2yt-2.py spot2yt.py
	del spot2yt-1.py & del spot2yt-2.py & del sample.py
endlocal
