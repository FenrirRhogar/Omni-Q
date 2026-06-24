@echo off
echo Requesting administrative privileges...
:: Check for admin rights
net session >nul 2>&1
if %errorLevel% == 0 (
    echo Administrator rights confirmed.
) else (
    echo Requesting privileges...
    powershell -Command "Start-Process '%~0' -Verb RunAs"
    exit /b
)

echo.
echo Copying AxisEQ.vst3 to your VST3 folder...
xcopy "%~dp0build\AxisEQ_artefacts\Debug\VST3\AxisEQ.vst3" "C:\Program Files\Common Files\VST3\AxisEQ.vst3\" /E /I /H /Y

echo.
echo Done! You can now load the plugin in your DAW.
pause
