@echo off
:start
cls
echo ==========================================
echo Which capture commands do you want to run?
echo ==========================================
echo A) 1920x1080 90fps (Singleplayer)
echo B) 1280x1280 90fps (Multiplayer)
echo C) set custom res/fps
echo ==========================================

:start.2
set INPUT=
set /p INPUT=Answer: 
if "%INPUT%"=="A" goto single
if "%INPUT%"=="B" goto multi
if "%INPUT%"=="a" goto single
if "%INPUT%"=="b" goto multi
if "%INPUT%"=="C" goto custom
if "%INPUT%"=="c" goto custom
Echo Please enter a valid answer!
goto start.2

:single
cls
adb shell setprop debug.oculus.capture.width 1920
adb shell setprop debug.oculus.capture.height 1080
adb shell setprop debug.oculus.capture.bitrate 10000000
adb shell setprop debug.oculus.foveation.level 0
adb shell setprop debug.oculus.fullRateCapture 1
adb shell setprop debug.oculus.capture.fps 90
Echo done.
pause
goto :start

:multi
cls
adb shell setprop debug.oculus.capture.width 1280
adb shell setprop debug.oculus.capture.height 1280
adb shell setprop debug.oculus.capture.bitrate 10000000
adb shell setprop debug.oculus.foveation.level 0
adb shell setprop debug.oculus.fullRateCapture 1
adb shell setprop debug.oculus.capture.fps 90
Echo done.
pause
goto start

:custom
cls

set width=
set /p width=Custom Width: 

set height=
set /p height=Custom Height: 

set fps=
set /p fps=Custom FPS: 

adb shell setprop debug.oculus.capture.width %width%
adb shell setprop debug.oculus.capture.height %height%
adb shell setprop debug.oculus.capture.bitrate 10000000
adb shell setprop debug.oculus.foveation.level 0
adb shell setprop debug.oculus.fullRateCapture 1
adb shell setprop debug.oculus.capture.fps %fps%
Echo done.
pause
goto start

