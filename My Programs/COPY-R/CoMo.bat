@echo off
Title CoMo Core
Echo CoMo Core [Version 1.2]
Echo (C)2014 Igtampe. No Rights Reserved
Echo.
Echo.
Echo Going To Move %1 to %2
Timeout /t 1 >nul
Echo Preparing to Move...
Echo Checking Variable
If /i %1==%1 Echo.
Set FILE=%1
SET DEST=%2

:CHECK
IF EXIST %DEST% goto :WARNING
GOTO :COPY

:WARNING
Echo The File %DEST% Already Exists! Overwrite (Y/N)?
Set /p Q=
If "%Q%"=="Y" GOTO :COPY
Echo What will be the New File name?
Set /p DEST=
GOTO :CHECK


:COPY
Echo Variable Checked.
Echo Moving...
TYPE %FILE% > %DEST%
Echo Copied.
Set /p Q=Erase Old File (Y/N)?
If /i "%Q%"=="Y" goto :ERASE
Goto :N

:ERASE
DEL %FILE%
:N
Echo This program will close in 2 Seconds
Timeout /t 2 >nul