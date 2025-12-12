@echo off
REM Gemini CLI - Windows Batch Installation Script
REM For users who prefer Command Prompt over PowerShell

echo ================================================================
echo         Gemini CLI - Windows Installation
echo ================================================================
echo.

REM Check Node.js
echo Checking Node.js installation...
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js is not installed
    echo Please download from: https://nodejs.org/
    pause
    exit /b 1
)

node --version
echo [OK] Node.js is installed
echo.

REM Check npm
echo Checking npm installation...
where npm >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] npm is not installed
    pause
    exit /b 1
)

npm --version
echo [OK] npm is installed
echo.

REM Install globally
echo Installing Gemini CLI globally...
npm install -g @google/gemini-cli

if %ERRORLEVEL% EQU 0 (
    echo.
    echo [SUCCESS] Gemini CLI installed successfully!
    echo.
    echo Next steps:
    echo   1. Run: gemini
    echo   2. Follow authentication prompts
    echo   3. Start using Gemini CLI!
    echo.
) else (
    echo.
    echo [ERROR] Installation failed
    echo.
)

pause
