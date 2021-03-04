@echo off
:start
cls
Title Custom Capture Quest
echo ==========================================
echo Which capture commands do you want to run?
echo ==========================================
echo A) 1920x1080 90fps (Widescreen)
echo B) 1280x1280 90fps (Square)
echo C) 1080x1920 90fps (Youtube Shorts)
echo D) set custom res/fps
echo ==========================================

:start.2
set INPUT=
set /p INPUT=Answer: 
if "%INPUT%"=="A" goto wide
if "%INPUT%"=="a" goto wide
if "%INPUT%"=="B" goto square
if "%INPUT%"=="b" goto square
if "%INPUT%"=="C" goto shorts
if "%INPUT%"=="c" goto shorts
if "%INPUT%"=="D" goto custom
if "%INPUT%"=="d" goto custom
Echo Please enter a valid answer!
goto start.2

:wide
cls
title Widescreen
adb shell setprop debug.oculus.capture.width 1920
adb shell setprop debug.oculus.capture.height 1080
adb shell setprop debug.oculus.capture.bitrate 10000000
adb shell setprop debug.oculus.foveation.level 0
adb shell setprop debug.oculus.fullRateCapture 1
adb shell setprop debug.oculus.capture.fps 90
Echo done.
pause
goto :start

:square
cls
title Square
adb shell setprop debug.oculus.capture.width 1280
adb shell setprop debug.oculus.capture.height 1280
adb shell setprop debug.oculus.capture.bitrate 10000000
adb shell setprop debug.oculus.foveation.level 0
adb shell setprop debug.oculus.fullRateCapture 1
adb shell setprop debug.oculus.capture.fps 90
Echo done.
pause
goto start

:shorts
cls
title Youtube Shorts
adb shell setprop debug.oculus.capture.width 1080
adb shell setprop debug.oculus.capture.height 1920
adb shell setprop debug.oculus.capture.bitrate 10000000
adb shell setprop debug.oculus.foveation.level 0
adb shell setprop debug.oculus.fullRateCapture 1
adb shell setprop debug.oculus.capture.fps 90
Echo done.
pause
goto start

:custom
cls
title Custom Option

set width=
set /p width=Custom Width: 

set height=
set /p height=Custom Height: 

echo !!Due to oculus capping FPS, min is 30 and max is 90.!!
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

