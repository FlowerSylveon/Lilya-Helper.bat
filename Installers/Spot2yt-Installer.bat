@echo off
	title Installing Spot2yt.py
	echo Downloading Spot2yt.py
	echo.
	curl -L https://github.com/masterofobzene/spot2yt/releases/download/1.0/spot2yt.zip > spot2yt.zip & tar -xf spot2yt.zip
	if not exist "%userprofile%\AppData\Local\Programs\Python\Python313\Scripts\pip.exe" do (curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" & py get-pip.py & del get-pip.py)
	echo.
	echo Installing requirements
	echo.
	py -m pip install -r requirements.txt
	del requirements.txt&del spot2yt.zip
	echo All done
pause
