@echo off
setlocal
cd /d "%~dp0"

echo.
echo ================================================
echo   MeasureTrust - Quick Start
echo ================================================
echo.

where node >nul 2>nul
if errorlevel 1 (
  echo [ERROR] Node.js was not found.
  echo Install Node.js 18+ and run this file again.
  echo.
  pause
  exit /b 1
)

if not exist "backend\server.js" (
  echo [ERROR] backend\server.js was not found.
  echo Make sure you are running this BAT from the extracted MeasureTrust folder.
  echo.
  pause
  exit /b 1
)

if not exist "backend\data" mkdir "backend\data"

echo Starting MeasureTrust backend on http://127.0.0.1:4170 ...
start "MeasureTrust Backend" cmd /k "cd /d "%~dp0backend" && node server.js"

timeout /t 2 /nobreak >nul

echo Opening MeasureTrust in your browser...
start "" "http://127.0.0.1:4170/"

echo.
echo MeasureTrust is running.
echo Keep the 'MeasureTrust Backend' window open while using the app.
echo Close that window to stop the local server.
echo.
exit /b 0
