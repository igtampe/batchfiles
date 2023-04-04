@echo Off
Mode con: Lines=25
Title Battery Calculator
Echo Battery Calculator [Verson {BETA}]
Echo (C)2014 Igtampe, No Rights Reserved.
Echo.
Echo Is the Battery Charging(1) or Not Charging(2).
Set /p Q=
If "%Q%"=="1" set Sign=+
If "%Q%"=="2" set Sign=-


cls
Echo Battery Calculator [Verson {BETA}]
Echo (C)2014 Igtampe, No Rights Reserved.
Echo.
Echo Going to Calculate the Amount of Time it Takes to Drop/add 1 Percent 3 Times.
Set A=0
Set FIRST=0

:CHECK 
Echo So Far, There have Been %A% Checks.
If "%A%"=="3" goto :FINAL
Echo.
Set /a A=%A%+1
Echo Commencing Check %A%.
IF "%FIRST%"=="0" goto :First
Set /a BAT=%BAT%%SIGN%1
Set B=0
goto :CHECK2


:First
Echo The Current Battery Is:
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING
Set /p BAT=Type That Number now:
Echo For the Sake of Acurracy, This First Test will be Ignored.
Set First=1
Set A=0
SET B=0

:CHECK2
WMIC PATH WIN32_BATTERY GET ESTIMATEDCHARGEREMAINING | FIND "%BAT%" >nul
IF "%ERRORLEVEL%"=="0" GOTO :NO
Echo.
Echo.
Echo It Took %B% Seccond(s) for the Battery to drop 1 Percent.
CLS
Echo Battery Calculator [Verson {BETA}]
Echo (C)2014 Igtampe, No Rights Reserved.
Echo.
SET CHECK%A%=%B% 
Goto :CHECK

:NO
Set /a B=%B%+1
Title %B% Secconds have passed.
Timeout /t 1 >nul
GOTO :CHECK2

:FINAL
cls
Echo Battery Calculator [Verson {BETA}]
Echo (C)2014 Igtampe, No Rights Reserved.
Echo.
Echo Calculating Average...
Set /a presult=%CHECK1%+%CHECK2%+%CHECK3%
Set /a result=%PRESULT%/3
Set /a AMOUNT=%RESULT%*100
Set /a AMOUNTMIN=%Amount%/60
Set /a AMOUNTHOUR=%AMOUNTMIN%/60
Echo.
Echo.
Echo On Average, Rounded to the nearest Oneth, Your Battery Drops/Charges
Echo One Percent every %RESULT% Secconds
Echo.
Echo.
IF %Q%==1 Goto :CHARGECALC

Echo This means that your battery can last, on Full Charge, 
Echo about the Following:
Goto :SECS

:CHARGECALC

Echo This means your battery will take about the following to
Echo Charge:

:SECS
Echo.
Echo %AMOUNT% Secconds
Echo %AMOUNTMIN% Minutes
Echo %AMOUNTHOUR% Hours
Pause