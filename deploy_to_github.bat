@echo off
title GitHub Uploader
cd /d "%~dp0"

echo ===========================================
echo       GitHub Deployment Automator
echo ===========================================
echo.

:: Check for Git
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git is not found in your PATH. 
    echo Please make sure you installed Git and RESTARTED your terminal/IDE.
    pause
    exit /b
)

echo [1/5] Total Reset...
if exist .git rmdir /s /q .git

:: Delete the unused LFS pointer file that causes errors
if exist "public\models\character.glb" del /f /q "public\models\character.glb"

:: Recursively find and delete ALL .gitattributes files
del /s /q .gitattributes >nul 2>&1

git init

:: Set temporary identity
git config user.email "dipu@example.com"
git config user.name "Dipu Dev Labs"

:: Ensure LFS is uninstalled for this repo
git lfs uninstall >nul 2>&1

echo [2/5] Adding files...
git add .
git commit -m "initial deployment: finalized without LFS"

echo [3/5] Connecting to your repository...
git remote add origin https://github.com/dipu-dev-labs/my-portfolio.git
git branch -M main

echo [4/5] Pushing to GitHub...
echo.
echo NOTE: A login window will appear. Please sign in to your GitHub account.
echo.
git push -u origin main --force

echo.
echo ===========================================
echo   DONE! Check your GitHub Actions tab.
echo ===========================================
pause
