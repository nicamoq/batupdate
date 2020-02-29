@echo off

:: INPUT THE LOCAL VERSION HERE (replace local's "1.0") also replace link with your own.
set local=1.0
set localtwo=%local%
set link=https://pastebin.com/raw/EAS8MJgp
:: Text like these are batch file comments, and will not affect the code.
:: If you're new to batch please follow these carefully.

:: the CHECK parameter checks for existing version.bat files and deletes it.
:check
IF EXIST "version.bat" DEL /Q "version.bat"
goto :download
pause
:: this is the main download process.
:: be sure download.exe is present in the directory where update.bat runs.
:: be sure to add " set local=2.0 " in your remote link.
:download
download %link% version.bat
CALL "version.bat"
goto check-2


:: check-2 is where it checks if your remote matches with your local.
:check-2
IF "%local%"=="%localtwo%" goto :yes
IF NOT "%local%"=="%localtwo%" goto :no

:yes
cls
echo No updates found. Version: %local%
pause >nul

:no
cls
echo Update found! Version: %local%
pause >nul