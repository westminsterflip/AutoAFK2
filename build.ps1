mkdir build
cd build
Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"
"./install-pyenv-win.ps1"
$env:PATH = "$env:USERPROFILE\.pyenv\pyenv-win\bin;$env:USERPROFILE\.pyenv\pyenv-win\shims;$env:PATH"
pyenv install $(Get-Content ..\.python-version)
pyenv local $(Get-Content ..\.python-version)
pyenv exec python -m venv venv
.\venv\Scripts\activate.ps1
pip install -r ..\requirements.txt
pip install -r ..\requirements-dev.txt
pyinstaller --clean --onedir --icon="../img/auto.ico" --add-data "../adbutils;adbutils" --add-data "../img;img" --add-data "venv/Lib/site-packages/scrcpy/scrcpy-server.jar;scrcpy" ..\AutoAFK2.py
cp ..\settings.ini .\dist\AutoAFK2\