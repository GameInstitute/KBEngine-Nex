@echo off
cd ..
set PROJECT_PATH=%cd%
for /r %%i in (site-packages) do @if exist "%%i" set KBE_VENV_PATH=%%i

cd ..

if not defined KBE_ROOT (
    set KBE_ROOT=%cd%
)

set KBE_RES_PATH=%KBE_ROOT%/kbe/res/;%PROJECT_PATH%/;%PROJECT_PATH%/res/
set KBE_BIN_PATH=%KBE_ROOT%/kbe/bin/server/


cd %~dp0

echo PROJECT_PATH = %PROJECT_PATH%
echo KBE_ROOT = %KBE_ROOT%
echo KBE_RES_PATH = %KBE_RES_PATH%
echo KBE_BIN_PATH = %KBE_BIN_PATH%
echo KBE_VENV_PATH = %KBE_VENV_PATH%


start "" "%KBE_BIN_PATH%/kbcmd.exe" --clientsdk=unity --outpath="%~dp0/kbengine_unity3d_plugins"
start "" "%KBE_BIN_PATH%/kbcmd.exe" --clientsdk=ue4 --outpath="%~dp0/kbengine_ue4_plugins"
start "" "%KBE_BIN_PATH%/kbcmd.exe" --clientsdk=ue5 --outpath="%~dp0/kbengine_ue5_plugins"