@echo off
Mode con: Lines=25
Title Battery Checker 2.3
Echo Battery Checker 2.3
Echo (C)2014 Igtampe, No Rights Reserved.
Echo.
Echo.
Echo Please wait while the Battery is Checked...
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "100" >nul
IF "%errorlevel%"=="0" SET B=100 & Goto :PREFULLWAIT
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "NO" >nul
IF "%errorlevel%"=="0" Goto :NOBAT
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "00" >nul
IF "%errorlevel%"=="0" Goto :WAT
Echo Checked.
Echo.
Echo Finding the Battery...
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "1" >nul
IF "%ERRORLEVEL%"=="0" SET N=1& Goto :WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "2" >nul
IF "%ERRORLEVEL%"=="0" SET N=2& Goto :WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "3" >nul
IF "%ERRORLEVEL%"=="0" SET N=3& Goto :WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "4" >nul
IF "%ERRORLEVEL%"=="0" SET N=4& Goto :WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "5" >nul
IF "%ERRORLEVEL%"=="0" SET N=5& Goto :WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "6" >nul
IF "%ERRORLEVEL%"=="0" SET N=6& Goto :WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "7" >nul
IF "%ERRORLEVEL%"=="0" SET N=7& Goto :WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "8" >nul
IF "%ERRORLEVEL%"=="0" SET N=8& Goto :WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "9" >nul
IF "%ERRORLEVEL%"=="0" SET N=9& Goto :WRITE

:WRITE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%N%" > BC23.Tmp
Set /p B=<BC23.TMP
Set /a B=%B%
Echo.
Echo Your Battery is %B%%% Charged...
Echo.
Echo.
DEL BC23.TMP
Echo Going to Main Battery Module
Goto  :MAIN

:WAT
Echo.
Echo.
Echo The Battery Cannot be checked for the Following Reason:
Echo.
Echo The Battery is completely Drained and has 0 percent left.
Echo.
Echo.
Echo PRE-START ERROR:DEAD
Echo.
echo.
Echo.
Echo Press any key to Close this program.
Pause >nul
Goto :END


:NOBAT
Echo.
Echo.
Echo The Battery Cannot be checked for the Following Reason:
Echo.
Echo There is No Battery attached to this PC.
Echo. 
Echo.
Echo PRE-START ERROR: NOBAT
Echo.
Echo.
Echo.
Echo Press any key to Close this program.
Pause >nul
Goto :End

:DEAD
MSG * There has been an Fatal Error measuring the Percentage of the Battery. Check the Console for more Info.
Set ERROR=DED
set N=BATTERYLEVEL=0. BL CANNOT EQUAL 0.
Goto :ERROR

:ERROR
TITLE [X] FATAL ERROR
Color 1F
Mode con: Cols=55 Lines=18
IF "%error%"=="" SET ERROR=UNKNOWN-ERROR
IF "%N%"=="" SET N=An Unknown Error Occured.
Echo  ____
Echo /    \
Echo [ \/ ]
Echo [ /\ ]  Fatal Error
Echo \____/
Echo.
Echo A Fatal Error Occured with the Battery Checker.
Echo.
Echo ERROR: %ERROR%.
Echo.
Echo %N%
Echo.
Echo Information left from the Program: 
Echo B=%B%, BT=%BT%
Echo.
Echo.
Echo Press any Key to close this Program
Pause >nul
Echo FATAL ERROR: MEMORY OVERFLOW CANNOT CONTINUE TO RUN.
Goto :EOF

:CHECK
set NEWTIME=%TIME:~0,-6%
set NEWDATE=%DATE:~4%
Title %T%, It is %NEWTIME% of %NEWDATE%
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%B%" >nul
IF "%errorlevel%"=="0" Goto :CHECK

:MAIN
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "1" >nul
IF "%ERRORLEVEL%"=="0" SET N=1
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "2" >nul
IF "%ERRORLEVEL%"=="0" SET N=2
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "3" >nul
IF "%ERRORLEVEL%"=="0" SET N=3
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "4" >nul
IF "%ERRORLEVEL%"=="0" SET N=4
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "5" >nul
IF "%ERRORLEVEL%"=="0" SET N=5
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "6" >nul
IF "%ERRORLEVEL%"=="0" SET N=6
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "7" >nul
IF "%ERRORLEVEL%"=="0" SET N=7
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "8" >nul
IF "%ERRORLEVEL%"=="0" SET N=8
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "9" >nul
IF "%ERRORLEVEL%"=="0" SET N=9
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%N%" > BC23.Tmp
Set /p B=<BC23.TMP
Set /a B=%B%
DEL BC23.TMP
Set T=%B%%% Left
Mode Con: Cols=55 Lines=2
Echo %B%%% Battery Charge left.
IF "%B%"=="100" goto :PREFULLWAIT
IF "%B%"=="0" Goto :DEAD
Set /a BY=%B%/11
IF NOT "%BY%"=="0" Color 6E
Set /a BY=%B%/26
IF NOT "%BY%"=="0" Color 2A
IF "%B%"=="25" Goto :WARN1
IF "%B%"=="20" Goto :WARN2
IF "%B%"=="15" Goto :WARN3
IF "%B%"=="10" Goto :WARN4
IF "%B%"=="5" Goto :WARN5
Goto :CHECK

:WARN1
MSG * Your battery is less than 25%%. Just a heads up.
Goto :CHECK

:WARN2
MSG * Your battery is Less than 20%%. Go find your charger.
Goto :CHECK

:WARN3
MSG * Yeah that plug might come in handy right about now. You're at 15%%
Goto :CHECK

:WARN4
MSG * Pluging in your PC now wouldn't be such a bad idea. You're at 10%%
Goto :CHECK

:WARN5
MSG * Plug in your PC. It's about to die. 5%% and Lowering
Goto :CHECK

:PREFULLWAIT
Echo The Battery is Fully Charged! Unplug to Continue.
Set T=Fully Charged
Goto :CHECK