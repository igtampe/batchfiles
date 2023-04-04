@ECHO OFF
MODE CON: COLS=50 LINES=20
TITLE Loading...
Echo Loading Battery Checker 2.0...
Color 87
Timeout /t 2 >nul
IF "%1"=="DEV" goto :DEV
Goto :PRESTART


:DEV
Set /p G=:
Goto %G%
Echo If you are seeing this there was an error. Press any key to goto PRESTART.
Pause >nul

:PRESTART
Echo Checking wether there is actually a Battery...
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "NO" >nul
IF "%errorlevel%"=="0" goto :PC
Echo The User does, in fact, have a battery.
Timeout /t 2 >nul
Echo Proceeding to the Battery checker Module
Timeout /t 1 >nul
Color 2A
TITLE Alert Status GREEN

:START
MODE CON: COLS=30 LINES=6
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "100" >nul
IF "%errorlevel%"=="0" goto :FULLCHARGE
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "26" >nul
IF "%errorlevel%"=="0" Goto :ChargingGreen
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "25" >nul
IF "%errorlevel%"=="0" goto :WARNING
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "20" >nul
IF "%errorlevel%"=="0" goto :WARNING2
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "15" >nul
IF "%errorlevel%"=="0" goto :WARNING3
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "11" >nul
IF "%errorlevel%"=="0" goto :ChargingYellow
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "10" >nul
IF "%errorlevel%"=="0" goto :ERROR
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "05" >nul
IF "%errorlevel%"=="0" goto :ERROR2
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "02" >nul
IF "%errorlevel%"=="0" goto :BLACK
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "00" >nul
IF "%errorlevel%"=="0" goto :WAT
Goto :START

:WAT
MODE CON: COLS=50 LINES=20
Echo There is no Point in Warning You.
Echo.
Echo ERROR: NOBATTERY
Echo.
Echo The Battery is at 00. If you are seeing This,
Echo There is a  Probability that your Battery is 
Echo Broken. There is no use for this program for
Echo you.
MSG * If you are seeing this, Your Battery broken. Check the Console.
Goto :TOO

:BLACK
MODE CON: COLS=50 LINES=20
Title Alert Status BLACK
Color 0F
MSG * Your battery is Dead! Shut down your PC to Prevent Damage!
Exit

:ChargingYellow
Color 6E
Title Alert Status Yellow
Goto :START

:ChargingGreen
Color 2A
TITLE Alert Status GREEN
Goto :START

:WARNING
COLOR 6E
TITLE Alert Status YELLOW
MSG * Your battery is Less than 25%. Just a heads up

:CWARNING
CLS
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "25" >nul
IF "%errorlevel%"=="0" goto :CWARNING
Goto :START

:WARNING2
COLOR 6E
TITLE Alert Status YELLOW
MSG * Your battery is Less than 20%. Go find your charger

:CWARNING2
CLS
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "20" >nul
IF "%errorlevel%"=="0" goto :CWARNING2
Goto :START

:WARNING3
COLOR 6E
TITLE Alert Status YELLOW
CLS
MSG * Yeah, that plug could come in handy right about now. You're at 15%

:CWARNING3
CLS
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "15" >nul
IF "%errorlevel%"=="0" goto :CWARNING3
GOTO :START

:ERROR
Color 4C
TITLE Alert Status RED
CLS
MSG * Pluging in your PC now wouldn't be such a bad idea. You're at 10%

:CERROR
CLS
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "10" >nul
IF "%errorlevel%"=="0" goto :CERROR
GOTO START

:ERROR2
Color 4C
TITLE Alert Status RED
Msg * Plug in your PC. It's about to die. 5% and Lowering

:CERROR2
CLS
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "05" >nul
IF "%errorlevel%"=="0" goto :CERROR2
GOTO :START

:FULLCHARGE
cls
Echo.
Echo The Computer Is Fully Charged. Please Start the
Echo Console again when you need it.
Echo.
Echo ERROR CODE: FLLCHRGE
Echo.
Echo The PC is Fully Charged. Please Start the Program when it is not.
MSG * Hey, Your compute is Fully Charged! Check the Console for more Info.
Goto :TOO

:PC
cls
Echo.
Echo There is No PC attached in this PC. Please Insert one.
Echo.
Echo ERROR CODE: PC
Echo.
Echo The PC is not a Laptop, Meaning it doesn't have a battery. This program is called BATTERY CHECKER 
Echo you know?
MSG * You are runing on a Computer without a battery. Check the Console for more Info.
Goto :TOO

:TOO
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Color 87
Color 78
Timeout /t 10 > nul
Echo.
Pause
Exit
