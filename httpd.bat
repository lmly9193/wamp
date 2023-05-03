@echo off

cd /d "%~dp0"

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' neq '0' ( goto UACPrompt ) else ( goto main )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params = %*:"=""
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:main
set "HTTPD_HOME=%~dp0\httpd"

echo ===================================
echo 1. Start Apache Service
echo 2. Stop Apache Service
echo 3. Install Apache Service
echo 4. Uninstall Apache Service
echo ===================================
set /p "choice=Please Select (1/2/3/4)"
cls
if %choice% equ 1 (
    sc start Apache2.4
) else if %choice% equ 2 (
    sc stop "Apache2.4"
)  else if %choice% equ 3 (
    "%HTTPD_HOME%\bin\httpd" -k install
) else if %choice% equ 4 (
    sc stop "Apache2.4"
	sc delete "Apache2.4"
) else (
    goto main
)
goto main