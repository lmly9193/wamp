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
set "MYSQL_HOME=%~dp0\mysql"

echo ===================================
echo 1. Start MySQL Service
echo 2. Stop MySQL Service
echo 3. Install MySQL Service
echo 4. Uninstall MySQL Service
echo 5. Create Initial Database
echo ===================================
set /p "choice=Please Select (1/2/3/4)"
cls
if %choice% equ 1 (
    sc start MySQL
) else if %choice% equ 2 (
    sc stop MySQL
)  else if %choice% equ 3 (
    "%MYSQL_HOME%\bin\mysqld" --install
) else if %choice% equ 4 (
    sc stop MySQL
	sc delete MySQL
) else if %choice% equ 5 (
    "%MYSQL_HOME%\bin\mysql_install_db"
) else (
    goto main
)
goto main