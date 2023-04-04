@echo off
IF %1=="?" goto :HELP
IF %1=="/?" goto :HELP
Title Easy Text Reader [Version 1.1]
Color 87
mode con:cols=90 lines=999999
Echo OK here is the File %1:
Echo.
Type %1
Echo.
Pause >nul
Goto :EOF

:Help
Echo ETR (Easy Text Reader) [Version 1.1]
Echo (C) Igtampe 2014, No Rights Reserved
Echo.
Echo USAGE: [FILE TO OPEN] [?]
Echo.
Echo [FILE TO OPEN] Self Explanatory.
Echo [?]            Launches This Help Menu.
Echo.
Echo Dragging into Program Also Works.

:EOF