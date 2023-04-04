@echo off
Title COPY-R
Echo COPY-R [Version 1.2]
Echo (C)2014 Igtampe. No Rights Reserved
Echo.
Echo.
Echo Going to Copy %1
Timeout /t 1 >nul
Echo Preparing to Copy...
Echo Checking Variable
If /i %1==%1 Echo.
Set FILE=%1
Set DEST=%FILE:.=_2.%
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
Echo Copying...
TYPE %FILE% > "%DEST%"
Echo Copied.
Echo This program will close in 2 Seconds
Timeout /t 2 >nul

:EOF