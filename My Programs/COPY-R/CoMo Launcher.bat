@echo off
If /i %1==%1 Echo.
SET FILE=%1
Echo CoMo Launcher [Version 1.2]
Echo (C)2014 Igtampe. No Rights Reserved
Echo.
Echo.
Echo Where to Copy %FILE%?
Set /p DEST=

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
Type %FILE% > %DEST%
Echo This Program Will Close in 2 Secconds
Timeout /t 2 >nul