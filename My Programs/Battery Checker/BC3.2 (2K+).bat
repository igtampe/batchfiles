@echo off
IF /i "%1"=="dev" goto :DEV
:MAINSTART
Mode Con: Lines=25
Title Battery Checker 3.2
Echo Battery Checker 3.2
Echo (C)2014 Igtampe, No Rights Reserved
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
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%N%" > BF.Tmp
Set /p B=<BF.TMP
Set /a B=%B%
Echo.
Echo Your Battery is %B%%% Charged...
Echo.
Echo.
DEL BF.TMP

Echo WScript.Sleep 2000> T.vbs
T
DEL T.vbs
Color 2A
Mode Con: Cols=55 Lines=2
Echo Calibrating. Please Wait...

:IGNOREDTEST
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%B%" >nul
IF "%errorlevel%"=="0" Goto :IGNOREDTEST
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
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%N%" > BF.Tmp
Set /p C=<BF.TMP
Set /a C=%C%
Set /a BOTEST=%B%-1
IF /i "%C%"=="%BOTEST%" SET B=%C%& SET S=-& GOTO :PRECALIBCHECK
SET S=+
Set B=%C%
DEL BF.tmp
CLS
Echo Battery is Charging at %B%%%. Continuing Calibration...

:PRECALIBCHECK
Mode Con: Cols=55 Lines=2
Echo Battery is Not Charging at %B%%%. Continuing Calibration...
Goto :CALIBCHECK



:CALIBCHECK
Echo WScript.Sleep 850> T.vbs
T
DEL T.vbs
Set /a BT=%BT%+1
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%B%" >nul
IF "%errorlevel%"=="0" Goto :CALIBCHECK

:Calibrated
Echo.
Echo Calibrated, Going to Main Battery Checker Module...
Color 2A
IF "%S%"=="+" Goto :Crecalc
IF "%S%"=="-" Goto :Recalc
Echo RESULT = MSGBOX("There was an Error in Calibration",0+16,"Battery Checker 3.1")> M.vbs
START M.vbs
SET ERROR=BADSIGN
SET N=%S% NOT VALID CHAR FOR CALIB. %S% MUST BE + OR -
Goto :ERROR

:DEV
Echo.
If "%2"=="" goto :DEVSET
Goto %2
Goto :GOTOERROR

:DEVSET
Echo.
Set /p G=:
Goto :%G%
Echo.

:GOTOERROR
Echo If you are seing this then there has been an Error.
Echo Press any key to close the Battery Checker.
Pause >nul       
Goto :End

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

:MEASUREERROR
Echo RESULT = MSGBOX("There was a Fatal Error Measuring the Time it take to lower 1%%",0+16,"Battery Checker 3.1")> M.vbs
START M.VBS
SET ERROR=MEASURE
SET N=BATTERYTIME=1. BT CANNOT EQUAL 1.
Goto :ERROR

:DEAD
Echo RESULT = MSGBOX("There has been a Fatal Error measuring the percentage of the Battery.",0+16,"Battery Checker 3.1")> M.vbs
START M.VBS
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
Echo.
Echo A Log has Been left in:
Echo %CD%\BC3CRASH.LOG
Echo.
Echo Press CTRL-C to Cose the Program.
Echo BEGIN LOG >> BC3CRASH.LOG
Echo. >> BC3CRASH.LOG
Echo PROGRAM CRASH TYPE "%ERROR%" WITH EXPLINATION "%N%">> BC3CRASH.LOG
Echo. >> BC3CRASH.LOG
Echo BEGIN DUMP OF VARS >> BC3CRASH.LOG
Echo.  >> BC3CRASH.LOG
SET >> BC3CRASH.LOG
Echo. >> BC3CRASH.LOG
Echo END DUMP OF VARS >> BC3CRASH.LOG
Echo. >> BC3CRASH.LOG
ECHO END LOG >> BC3CRASH.LOG
Echo WScript.Sleep 99999> T.vbs
T
DEL T.vbs
Echo FATAL ERROR: MEMORY OVERFLOW CANNOT CONTINUE TO RUN.
Goto :EOF

:PM
Set HOUR=%NEWTIME:~0,-3%
Set MIN=%NEWTIME:~3%
SET /a HOUR=%HOUR%-12
IF %HOUR%==0 SET HOUR=12
SET NEWTIME=%HOUR%:%MIN%
SET O=PM
Goto :TIMECONT

:CHECK
set NEWTIME=%TIME:~0,-6%
set NEWDATE=%DATE:~4%
SET CONVERT=%NEWTIME::=%
SET /a CONVERT=%CONVERT%/1200
IF NOT "%CONVERT%"=="0" goto :PM
Set O=AM
:TIMECONT 
Title %T%, It is %NEWTIME% %O% of %NEWDATE%
Echo WScript.Sleep 850> T.vbs
T
DEL T.vbs
Set /a BT=%BT%+1
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%B%" >nul
IF "%errorlevel%"=="0" Goto :CHECK

:RECALC
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
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%N%" > BF.Tmp
Set /p C=<BF.TMP
Set /a C=%C%
Set /a BOTEST=%B%+1
IF /i "%C%"=="%BOTEST%" SET B=%BOTEST%& Goto :CROSSTOCHARGE
Set B=%C%
:CROSSTONOTCHARGE
DEL BF.tmp
IF "%BT%"=="1" goto :MEASUREERROR
IF "%B%"=="0" Goto :DEADERROR
SET /a T=%BT%*%B%
Set ST=%T%
Set /a MT=%T%/60
Set /a HT=%T%/60/60
Set /a MM=%HT%*60
Set /a MT=%MT%-%MM%
Set /a SM=%MT%*60
Set /a SM2=%HT%*60*60
Set /a ST=%ST%-%SM%-%SM2%
Set BT=0
Mode Con: Cols=52 Lines=2
IF MT==1 SET MT=01
IF MT==2 SET MT=02
IF MT==3 SET MT=03
IF MT==4 SET MT=04
IF MT==5 SET MT=05
IF MT==6 SET MT=06
IF MT==7 SET MT=07
IF MT==8 SET MT=08
IF MT==9 SET MT=09
Echo %B%%% Left, or %HT% Hour(s), and %MT% Minute(s).
SET T=%B%%%, %HT%:%MT% Left
Set /a HC=%HT%/1
IF "%HC%"=="0" Goto :WARN1
IF "%HC%"=="1" Goto :RESETWARN
Goto :CHECK

:FPM
Set HOUR=%NEWTIME:~0,-3%
Set MIN=%NEWTIME:~3%
SET /a HOUR=%HOUR%-12
IF %HOUR%==0 SET HOUR=12
SET NEWTIME=%HOUR%:%MIN%
SET O=PM
Goto :FULLTC

:PREFULLWAIT
Echo RESULT = MSGBOX("The Battery is Fully Charged. Unplug to start Measuring time again.",0+64,"Battery Checker 3.1s")> M.vbs
START M.VBS
Echo Battery is Fully Charged. Unplug to start measuring time Again.
:FULLWAIT
set NEWTIME=%TIME:~0,-6%
set NEWDATE=%DATE:~4%
SET CONVERT=%NEWTIME::=%
SET /a CONVERT=%CONVERT%/1200
IF NOT "%CONVERT%"=="0" goto :FPM
Set O=AM
:FULLTC
Title Fully Charged! it is %NEWTIME% %O% of %NEWDATE%
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%B%" >NUL
IF "%ERRORLEVEL%"=="0" goto :FULLWAIT
Set /a B=%B%-1
Color 2a
Goto :CROSSTONOTCHARGE

:CPM
Set HOUR=%NEWTIME:~0,-3%
Set MIN=%NEWTIME:~3%
SET /a HOUR=%HOUR%-12
IF %HOUR%==0 SET HOUR=12
SET NEWTIME=%HOUR%:%MIN%
SET O=PM
Goto :CTC

:CHARGECHECK
set NEWTIME=%TIME:~0,-6%
set NEWDATE=%DATE:~4%
SET CONVERT=%NEWTIME::=%
SET /a CONVERT=%CONVERT%/1200
IF NOT "%CONVERT%"=="0" goto :CPM
Set O=AM
:CTC
Title %T%, It is %NEWTIME% %O% of %NEWDATE%
Echo WScript.Sleep 850> T.vbs
T
DEL T.vbs
Set /a BT=%BT%+1
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%B%" >nul
IF "%errorlevel%"=="0" Goto :CHARGECHECK
:CRECALC
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
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%N%" > BF.Tmp
Set /p C=<BF.TMP
Set /a C=%C%
Set /a BOTEST=%B%-1
IF /i "%C%"=="%BOTEST%" SET B=%BOTEST%& SET BT=90& Goto :CROSSTONOTCHARGE
Set B=%C%
:CROSSTOCHARGE
DeL BF.tmp
SET WARN1=
SET WARN2=
SET WARN3=
SET WARN4=
SET WARN5=
Color 2a
IF "%BT%"=="1" goto :MEASUREERROR
IF "%B%"=="100" Goto :PREFULLWAIT
SET /a BM=100-%B%
SET /a T=%BT%*%BM%
Set ST=%T%
Set /a MT=%T%/60
Set /a HT=%T%/60/60
Set /a MM=%HT%*60
Set /a MT=%MT%-%MM%
Set /a SM=%MT%*60
Set /a SM2=%HT%*60*60
Set /a ST=%ST%-%SM%-%SM2%
Set BT=0
Mode Con: Cols=65 Lines=2
IF MT==1 SET MT=01
IF MT==2 SET MT=02
IF MT==3 SET MT=03
IF MT==4 SET MT=04
IF MT==5 SET MT=05
IF MT==6 SET MT=06
IF MT==7 SET MT=07
IF MT==8 SET MT=08
IF MT==9 SET MT=09
Echo %B%%% Now, or %HT% Hour(s), and %MT% Minute(s) left until Full Charge.
SET T=%B%%%, %HT%:%MT% Left until Full Charge
Goto :CHARGECHECK


:RESETWARN
Set WARN1=
Set WARN2=
Set WARN3=
Set WARN4=
Set WARN5=
Color 2A
Goto :CHECK

:WARN1
Set /a HT=%MT%/45
IF "%HT%"=="0" goto :WARN2
Goto :CHECK

:WARN2
Color 6E
Set /a HT=%MT%/30
IF "%HT%"=="0" goto :WARN3
IF "%WARN2%"=="1" goto :CHECK
SET WARN2=1
Echo RESULT = MSGBOX("Your Battery has %MT% Minutes left of charge, Just a Heads Up.",0+64,"Battery Checker 3.1")> M.vbs
START M.VBS
Goto :CHECK

:WARN3
Set /a HT=%MT%/15
IF "%HT%"=="0" goto :WARN4
IF "%WARN3%"=="1" goto :CHECK
SET WARN3=1
Echo RESULT = MSGBOX("Your Battery has %MT% Minutes Left of Charge. You should get your charger on Standby.",0+64,"Battery Checker 3.1")> M.vbs
START M.VBS
Goto :CHECK

:WARN4
Set /a HT=%MT%/5
IF "%HT%"=="0" goto :WARN5
IF "%WARN4%"=="1" goto :CHECK
Color 4C
SET WARN4=1
Echo RESULT = MSGBOX("Your Battery has %MT% Minutes left of charge. You might want to plug in your PC.",0+48,"Battery Checker 3.1")> M.vbs
START M.VBS
Goto :CHECK

:WARN5
Color 4C
IF "%WARN5%"=="1" goto :CHECK
SET WARN5=1
Echo RESULT = MSGBOX("Your Battery has %MT% Minutes left of Charge. Get your charger.",0+48,"Battery Checker 3.1")> M.vbs
START M.VBS
Goto :CHECK

:SECRET
Echo.
Echo You found a Secret using the DEV Arguement!
Echo WScript.Sleep 3850> T.vbs
T
DEL T.vbs
Echo.
Echo.
Echo Your reward is...
Echo WScript.Sleep 850> T.vbs
T
DEL T.vbs
Echo Nothing!
Echo WScript.Sleep 3850> T.vbs
T
DEL T.vbs
Echo.
Echo.
Echo.
Echo Press any key to close this program.
Pause >nul


:EOF
:END