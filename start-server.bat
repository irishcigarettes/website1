@echo off
echo Starting local server...
echo.
echo Opening http://localhost:8000 in your browser...
echo.
start http://localhost:8000
powershell -ExecutionPolicy Bypass -File start-server.ps1
pause

