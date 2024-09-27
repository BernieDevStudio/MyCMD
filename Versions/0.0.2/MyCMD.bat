@echo off
chcp 65001 >nul
cls

rem Ellenőrzi, hogy létezik-e a winget-check.txt fájl
set "winget_check_path=%USERPROFILE%\AppData\BernieStoryStudio\requirements"
set "winget_check_file=%winget_check_path%\winget-check.txt"

if not exist "%winget_check_path%" (
    mkdir "%winget_check_path%"
)

if not exist "%winget_check_file%" (
    rem Ha nincs meg a fájl, felugró ablak jelenik meg
    powershell -command "Add-Type -AssemblyName PresentationFramework;[System.Windows.MessageBox]::Show('If you don''t have, you have to download winget.run to use this section','Warning',4)" | findstr "OK" >nul
    if %ERRORLEVEL% equ 0 (
        start https://aka.ms/getwinget
    )
    echo. > "%winget_check_file%"
)

echo.
echo.

call :animate "      ███╗░░░███╗██╗░░░██╗░█████╗░███╗░░░███╗██████╗░"
call :animate "      ████╗░████║╚██╗░██╔╝██╔══██╗████╗░████║██╔══██╗"
call :animate "      ██╔████╔██║░╚████╔╝░██║░░╚═╝██╔████╔██║██║░░██║"
call :animate "      ██║╚██╔╝██║░░╚██╔╝░░██║░░██╗██║╚██╔╝██║██║░░██║"
call :animate "      ██║░╚═╝░██║░░░██║░░░╚█████╔╝██║░╚═╝░██║██████╔╝"
call :animate "      ╚═╝░░░░░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░░░░╚═╝╚═════╝░"

rem Egy sor kihagyása
echo.
echo.      ===============================
echo.      Welcome to the custom command shell!
echo.      Type 'help' for available commands.
echo.      ===============================

echo.
echo.
echo.

:menu
echo.
set /p cmd="              > " 

if "%cmd%"=="help" goto :help
if "%cmd%"=="make" goto :make
if "%cmd%"=="about" goto :about
if "%cmd%"=="apps" goto :apps
if "%cmd:~0,4%"=="open" goto :open
if "%cmd:~0,2%"=="cd" goto :cd
goto :menu

:help
echo.
echo.      Available commands:
echo.      open [filename] - Opens a file or application
echo.      cd [path] - Changes the current directory
echo.      make - Create a new file or script
echo.      about - Display information about the command shell
echo.      apps - Open the apps menu (winget required)
echo.      help - Shows this help menu
echo.
goto :menu

:apps
echo.
echo.      ===============================
echo.      Apps Menu
echo.      ===============================
echo.      1. Starter Pack
echo.      2. Games (Coming Soon)
echo.      3. Tools (Coming Soon)
echo.      ===============================
echo.
set /p app_choice="              > "
if "%app_choice%"=="1" goto :starter_pack
if "%app_choice%"=="2" echo Coming soon... & goto :menu
if "%app_choice%"=="3" echo Coming soon... & goto :menu
goto :menu

:starter_pack
echo.
echo.      ===============================
echo.      Starter Pack Apps:
echo.      ===============================
echo.      1. Chrome
echo.      2. Notepad++
echo.      3. Steam
echo.      4. PeaZip (Winrar alternative)
echo.      5. Bulk Crap Uninstaller
echo.      6. Pc Manager (Microsoft)
echo.      ===============================
echo.
set /p sp_choice="              > "
if "%sp_choice%"=="1" powershell -command "Start-Process 'winget' 'install -e --id Google.Chrome'" & goto :install_done
if "%sp_choice%"=="2" powershell -command "Start-Process 'winget' 'install -e --id Notepad++.Notepad++'" & goto :install_done
if "%sp_choice%"=="3" powershell -command "Start-Process 'winget' 'install -e --id Valve.Steam'" & goto :install_done
if "%sp_choice%"=="4" powershell -command "Start-Process 'winget' 'install -e --id Giorgiotani.Peazip'" & goto :install_done
if "%sp_choice%"=="5" powershell -command "Start-Process 'winget' 'install -e --id Klocman.BulkCrapUninstaller'" & goto :install_done
if "%sp_choice%"=="6" powershell -command "Start-Process 'winget' 'install -e --id Microsoft.PCManager.CN'" & goto :install_done
goto :menu

:install_done
echo.
echo. +---------------------+
echo. |        Done!        |
echo. |---------------------|
echo. |  Your software has  |
echo. |  gotten installed!  |
echo. +---------------------+
echo.
goto :menu

:make
rem A make parancs kódja...

:about
rem Az about parancs kódja...

:open
set "filename=%cmd:~5%"
if "%filename%"=="" (
    echo No file specified.
) else (
    start "" "%filename%"
)
goto :menu

:cd
set "path=%cmd:~3%"
if "%path%"=="" (
    echo No path specified.
) else (
    cd /d "%path%"
)
goto :menu

:animate
echo %~1
color 5F
timeout /t 1 >nul
exit /b
