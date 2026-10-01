@echo off
setlocal

echo Stopping MeasureTrust local Node server...
taskkill /FI "WINDOWTITLE eq MeasureTrust Backend" /T /F >nul 2>nul
if errorlevel 1 (
  echo No MeasureTrust Backend window was found.
) else (
  echo MeasureTrust server stopped.
)
echo.
pause
