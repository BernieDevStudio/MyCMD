@echo off
chcp 65001 >nul
cls

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
echo.      help - Shows this help menu
echo.
goto :menu

:make
echo.
echo.      ===============================
echo.      available commands
echo.      ===============================
echo.      file = makes a file where you want
echo.      msg  = makes a vbs file on the desktop with a message
echo.      ===============================
echo.
set /p option="              > "
if "%option%"=="file" goto :file
if "%option%"=="msg" goto :msg
goto :menu

:file
echo.
echo.      ===========================================
echo.          Where do you wanna make the file?
echo.      ===========================================
echo.      1. Desktop
echo.      2. Documents
echo.      3. Downloads
echo.      4. 3D Objects
echo.      5. Pictures
echo.      6. Videos
echo.      7. Music
echo.      8. Enter a custom path
echo.      ===========================================
echo.
set /p location="              > "
if "%location%"=="1" set location=%USERPROFILE%\Desktop
if "%location%"=="2" set location=%USERPROFILE%\Documents
if "%location%"=="3" set location=%USERPROFILE%\Downloads
if "%location%"=="4" set location=%USERPROFILE%\3D Objects
if "%location%"=="5" set location=%USERPROFILE%\Pictures
if "%location%"=="6" set location=%USERPROFILE%\Videos
if "%location%"=="7" set location=%USERPROFILE%\Music
if "%location%"=="8" (
    set /p location="              Enter the custom path: "
)

echo.
echo.      ==========================
echo.         Name the file please (ex.: hello.txt)
echo.      ==========================
echo.
set /p filename="              > "

rem Fájl létrehozása a megadott helyen
echo. > "%location%\%filename%"
echo.
echo.      ==========================
echo.         Your file is created.
echo.      ==========================
echo.
goto :menu

:msg
echo.
echo.      ==========================
echo.         Name your VBS script (ex.: message.vbs)
echo.      ==========================
echo.
set /p vbsname="              > "
echo WScript.Echo "Your message here!" > "%USERPROFILE%\Desktop\%vbsname%"
echo.
echo.      ==========================
echo.         Your VBS script is created on the desktop.
echo.      ==========================
echo.
goto :menu

:about
rem About text
echo.      ====================================================
echo.
echo.       ██╗░░░███╗██╗░░░██╗░█████╗░███╗░░░███╗██████╗░
echo.      ████╗░████║╚██╗░██╔╝██╔══██╗████╗░████║██╔══██╗
echo.      ██╔████╔██║░╚████╔╝░██║░░╚═╝██╔████╔██║██║░░██║
echo.      ██║╚██╔╝██║░░╚██╔╝░░██║░░██╗██║╚██╔╝██║██║░░██║
echo.      ██║░╚═╝░██║░░░██║░░░╚█████╔╝██║░╚═╝░██║██████╔╝
echo.      ╚═╝░░░░░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░░░░╚═╝╚═════╝░
echo.      
echo.      MyCmd command shell system
echo.      Version 0.0.1 BETA
echo.      Published: 8/28/2024
echo.      Made with ❤️
echo.      By Bernie
echo.      
echo.      
echo.      This software is under the GNU3.0 license.
echo.     
echo.      
echo.      
echo.      ====================================================
goto :menu

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
