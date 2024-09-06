@title Arduino Command Line Interface Loop.
@echo off

set homeDIR="%OneDrive%\Documents\Arduino"
pushd %homeDIR%

:help 
echo.
echo This is a batch script that enables skipping the "arduino-cli.exe" command,
echo while asking only for the command arguments. For a complete list of available arguments type help.
echo.
echo Standard MS-DOS commands may be executed if started with a white space, ex. arduino-cli^> cls
echo To display this text, type at the prompt _help,  ex. arduino-cli^>_help
echo Press Ctrl+C or type exit, to exit the script.
echo.
dir /B /AD
echo.

:loop
set /P arguments=arduino-cli^>
if "%arguments%" == "exit" goto theEND
if "%arguments%" == "_help" goto help

set firstChar=%arguments:~0,1%

if "%firstChar%" == " " (
  %arguments%
  goto loop
)
arduino-cli.exe %arguments%
goto loop

:theEND
echo.
popd
