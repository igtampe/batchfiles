
@echo Off

CLS
Set FD=%CD%
CD %USERPROFILE%

@echo Enhanced Command Line for Microsoft Windows [Version 1.7]
@echo (C) 2013 Igtampe. No Rights Reserved
@echo.
@Echo Type IGT to Launch IGTAMPE DOS (C:\IGT)

:C
Title Enhanced Command Line for Microsoft Windows [Version 1.7]
Color 37
@echo.
Set /p C= %cd%\\
If /i "%C%"== "Restart" goto :Restart
If /i "%C%"== "?" Goto :?
If /i "%C%"== "EXIT" goto :EOF
If /i "%C%"== "Edit" goto :Edit
if /i "%C%"== "E" goto :E
If /i "%C%"== "FINDER" goto :FINDER
IF /i "%C%"== "APPLIST" goto :1
If /i "%C%"== "TEXTERIA" goto :NI
IF /i "%C%"== "TIME" goto :TIME
IF /I "%C%"== "VER" goto :VER
IF /I "%C%"== "IGT" goto :IGT
%C%
goto :C

:IGT
C:
Cd C:\IGT
IGT.bat

:E
Title CMDLINE Explorer [Version 1.0]
Color 81

Echo CMDLINE Explorer [Version 1.0]
Echo (C) 2013 Igtampe. No Rights Reserved
Echo.
Echo For Help, Type "Help"
Echo.

:D
Echo the current directory is %CD%
Echo.
Echo Available directories:
DIR
Echo.
Echo Type the directory to change to
set /P D= 
If /I "%D%"== "C" goto :CFORE
If /I "%D%"== "HELP" goto :H
IF /I "%D%"== "EXIT" Goto :C
cd %D%
goto :D

:H
Echo Type "c" To do a command in the directory
Echo Type "Exit" to Exit
Echo Type "\" to kick back to the root directory
Echo Type ".." to go up one directory
Pause
Goto :D

:CFORE
@echo command?
Set /P CFORE=
%CFORE%
GOTO :D

:VER
@echo Enhanced command line for Microsoft Windows [Version 1.5]
Goto :C

:Admin
Color 09
CD C:\USERS\IGNACIO\DESKTOP\MISC.
CMDLINEADMIN


:?
Help
@echo --------------------------------------------------------------------
@echo (C) Igtampe 2013
@echo No Rights reserved.
@echo --------------------------------------------------------------------
@echo All parts of this program or any of its contents may be reproduced,
@echo copied, modififed, or adapted, even without the pior written consent
@echo of the author, unless otherwise indicated (Which will never happen)
@echo for stand-alone materials (Bundled Micro-Programs)
@echo.
@echo This program is Not protected by US Law or any Law by that Matter.
@echo This program might as well be nonexistant to Any government as it
@echo Fuffills Nothing in due process from the government. Now Keep
@echo Doing what you were doing!
@echo --------------------------------------------------------------------
@echo 1.7 was Barely Touched. For Retro and release Purposses.
goto C

:edit
Start /wait Notepad "%FD%\CMDLINE.bat"
goto :Restart
Goto :C

:FINDER
title Finder for Enhanced command line for Microsoft Windows [Version 1.0]
Color 73
cd\
@echo.
@echo File finder for Microsoft Windows [V 1.0]
@echo (C) 2013 Igtampe. No Rights reserved

:F
@echo.
set /p FIND= Find? 
If /i "%FIND%"=="EXIT" goto :C
Dir "%FIND%" /A /S
@echo.
Goto :F

:1
@echo Apps currently in the Enhanced Command Line are:
@echo.
@echo FILE FINDER             LAUNCHED WITH: FINDER
@echo HELP                    LAUNCHED WITH: ?
@Echo ADMIN COMMAND PROMPT    LAUNCHED WITH: ADMIN
@echo COMMAND LINE RESTARTER  LAUNCHED WITH: RESTART
@echo COMMAND LINE EDITOR     LAUNCHED WITH: EDIT
@ECHO TEXTERIA                LAUNCHED WITH: TEXTERIA
@ECHO TIME                    LAUNCHED WITH: TIME
@ECHO EXPLORER (Bundled)      LAUNCHED WITH: E
@GOTO C


:NI
Title TEXTERIA for Enhanced Command Line [Version 1.0 adapted from 2.0]
Color 27

@echo TEXTERIA Text writer [Version 2.0]
@pause

:TE
@Echo Writing Space. Once you press enter you cannot return to edit. Enter "END" to "END". 20 line maximum
set /p P1=
If /i "%P1%"== "END" goto :Choice 
set /p P2=
If /i "%P2%"== "END" goto :Choice
set /p P3=
If /i "%P3%"== "END" goto :Choice
set /p P4=
If /i "%P4%"== "END" goto :Choice
set /p P5=
If /i "%P5%"== "END" goto :Choice
set /p p6=
If /i "%P6%"== "END" goto :Choice
set /p p7=
If /i "%P7%"== "END" goto :Choice
set /p p8=
If /i "%P8%"== "END" goto :Choice
set /p p9=
If /i "%P9%"== "END" goto :Choice
set /p p10=
If /i "%P10%"== "END" goto :Choice
set /p p11=
If /i "%P11%"== "END" goto :Choice
set /p p12=
If /i "%P12%"== "END" goto :Choice
set /p p13=
If /i "%P13%"== "END" goto :Choice
set /p p14=
If /i "%P14%"== "END" goto :Choice
set /p p15=
If /i "%P15%"== "END" goto :Choice
set /p p16=
If /i "%P16%"== "END" goto :Choice
set /p p17=
If /i "%P17%"== "END" goto :Choice
set /p p18=
If /i "%P18%"== "END" goto :Choice
set /p p19=
If /i "%P19%"== "END" goto :Choice
set /p p20=

:Choice
@echo Select an Option
@echo 1: Save
@echo 2: Discard/Exit
set /p Q1=
If /i {%Q1%}== {2} (Goto C)

:T1
@Echo Name?
Set /p NAME=
@Echo Directory?
Set /p Directory=
Cd "%Directory%"
@echo File extension?
set /p ext=
@echo %P1% >> "%NAME%".%ext%
@echo %P2% >> "%NAME%".%ext%
@echo %P3% >> "%NAME%".%ext%
@echo %P4% >> "%NAME%".%ext%
@echo %P5% >> "%NAME%".%ext%
@echo %P6% >> "%NAME%".%ext%
@echo %P7% >> "%NAME%".%ext%
@echo %P8% >> "%NAME%".%ext%
@echo %P9% >> "%NAME%".%ext%
@echo %P10% >> "%NAME%".%ext%
@echo %P11% >> "%NAME%".%ext%
@echo %P12% >> "%NAME%".%ext%
@echo %P13% >> "%NAME%".%ext%
@echo %P14% >> "%NAME%".%ext%
@echo %P15% >> "%NAME%".%ext%
@echo %P16% >> "%NAME%".%ext%
@echo %P17% >> "%NAME%".%ext%
@echo %P18% >> "%NAME%".%ext%
@echo %P19% >> "%NAME%".%ext%
@echo %P20% >> "%NAME%".%ext%
@echo File Saved
@pause
@echo to create a new file, unless you plan to write all 20 lines, restart the Enhanced command line physically, not with the command.
goto :C

:TIME
@echo It is %TIME% of %DATE%
GOTO :C

:RESTART
A:
CD %FD%
START CMDLINE.bat
Exit