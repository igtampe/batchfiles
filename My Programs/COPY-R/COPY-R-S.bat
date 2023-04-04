@echo off
Set FILE=%1
TYPE %FILE% > "%FILE:.=_2.%"
