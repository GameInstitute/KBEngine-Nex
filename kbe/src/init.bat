@echo off
setlocal enabledelayedexpansion

rem Step 1: 设置变量
set SOLUTION_DIR=%~dp0
set BUILD_SCRIPT=%SOLUTION_DIR%lib\python\PCbuild\build.bat
set CONFIG=Debug

rem Step 2: 执行构建
echo [1] 正在构建 Python，调用 build.bat -c %CONFIG% ...
call "%BUILD_SCRIPT%" -c %CONFIG%
if errorlevel 1 (
    echo [ERROR] 构建失败，终止脚本。
    pause
    exit /b 1
)

rem Step 3: 设置文件路径
set OUT_DIR=%SOLUTION_DIR%lib\python\PCbuild\amd64
set python313_d_LIB_FILE=python313_d.lib
set python313_d_EXP_FILE=python313_d.exp

set python313_d_DLL_FILE=python313_d.dll
set python313_d_ILK_FILE=python313_d.ilk
set python313_d_PDB_FILE=python313_d.pdb

set vcruntime140_FILE=vcruntime140.dll
set vcruntime140_1_FILE=vcruntime140_1.dll

set TARGET_LIB_DIR=%~dp0libs
set TARGET_DLL_DIR=%~dp0..\bin\server

rem Step 4: 创建目标目录（如不存在）
if not exist "%TARGET_LIB_DIR%" (
    mkdir "%TARGET_LIB_DIR%"
)
if not exist "%TARGET_DLL_DIR%" (
    mkdir "%TARGET_DLL_DIR%"
)

rem Step 5: 拷贝 lib 文件
echo [2] 正在复制 %python313_d_LIB_FILE% 到 %TARGET_LIB_DIR%
copy /Y "%OUT_DIR%\%python313_d_LIB_FILE%" "%TARGET_LIB_DIR%"
if errorlevel 1 (
    echo [ERROR] 拷贝 %python313_d_LIB_FILE% 文件失败。
    pause
    exit /b 1
)
echo [2] 正在复制 %python313_d_EXP_FILE% 到 %TARGET_LIB_DIR%
copy /Y "%OUT_DIR%\%python313_d_EXP_FILE%" "%TARGET_LIB_DIR%"
if errorlevel 1 (
    echo [ERROR] 拷贝 %python313_d_EXP_FILE% 文件失败。
    pause
    exit /b 1
)

rem Step 6: 拷贝 dll 文件
echo [3] 正在复制 %python313_d_DLL_FILE% 到 %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%python313_d_DLL_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] 拷贝 %python313_d_LIB_FILE% 文件失败。
    pause
    exit /b 1
)

echo [4] 正在复制 %python313_d_ILK_FILE% 到 %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%python313_d_ILK_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] 拷贝 %python313_d_ILK_FILE% 文件失败。
    pause
    exit /b 1
)

echo [5] 正在复制 %python313_d_PDB_FILE% 到 %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%python313_d_PDB_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] 拷贝 %python313_d_PDB_FILE% 文件失败。
    pause
    exit /b 1
)


echo [6] 正在复制 %vcruntime140_FILE% 到 %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%vcruntime140_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] 拷贝 %vcruntime140_FILE% 文件失败。
    pause
    exit /b 1
)


echo [7] 正在复制 %vcruntime140_1_FILE% 到 %TARGET_DLL_DIR%
copy /Y "%OUT_DIR%\%vcruntime140_1_FILE%" "%TARGET_DLL_DIR%"
if errorlevel 1 (
    echo [ERROR] 拷贝 %vcruntime140_1_FILE% 文件失败。
    pause
    exit /b 1
)


set LIBS_DIR=%SOLUTION_DIR%lib\python\Lib
set OUT_LIBS_DIR=%~dp0..\res\scripts\common\Lib
set OUT_DLLS_DIR=%~dp0..\res\scripts\common\DLLs

echo [7] 正在复制 %LIBS_DIR% 到 %OUT_LIBS_DIR%

xcopy %LIBS_DIR% %OUT_LIBS_DIR% /Y /i /e



echo [8] 正在复制 %OUT_DIR% 到 %OUT_DLLS_DIR%

xcopy %OUT_DIR% %OUT_DLLS_DIR% /Y /i /e

echo 操作完成 

pause
