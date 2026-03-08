@echo off
SETLOCAL EnableDelayedExpansion

:: Set temporary title
title Starting Portfolio Website...

:: Navigate to project root (directory where the script is located)
cd /d "%~dp0"

echo ==========================================
echo    Portfolio Website Runner
echo ==========================================

:: Check if node_modules exists
if not exist "node_modules\" (
    echo [INFO] node_modules not found. Installing dependencies...
    echo [INFO] This might take a few minutes...
    call npm install
    if !errorlevel! neq 0 (
        echo [ERROR] npm install failed. Please check your internet connection and Node.js installation.
        pause
        exit /b !errorlevel!
    )
    echo [SUCCESS] Dependencies installed successfully.
) else (
    echo [INFO] node_modules folder found. Skipping installation.
)

echo [INFO] Starting development server...
echo ==========================================

:: Run the dev server
call npm run dev

:: If the server crashes or is stopped, keep the window open
if !errorlevel! neq 0 (
    echo [ERROR] The development server stopped unexpectedly.
)

echo ==========================================
echo    Press any key to exit.
pause > nul
