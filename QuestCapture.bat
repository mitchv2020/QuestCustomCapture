@echo off
:start
cls
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
if "%INPUT%"=="A" goto single
if "%INPUT%"=="B" goto multi
if "%INPUT%"=="a" goto single
if "%INPUT%"=="b" goto multi
if "%INPUT%"=="C" goto custom
if "%INPUT%"=="c" goto custom
if "%INPUT%"=="D" goto shorts
if "%INPUT%"=="d" goto shorts
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


:shorts
cls
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

set width=
set /p width=Custom Width: 

set height=
set /p height=Custom Height: 

Echo FPS has limits due to oculus capping it. min is 30. max is 90
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

