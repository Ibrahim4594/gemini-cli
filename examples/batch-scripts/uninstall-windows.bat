@echo off
REM Gemini CLI - Windows Uninstall Script

echo ================================================================
echo         Gemini CLI - Uninstall
echo ================================================================
echo.

echo This will:
echo   1. Uninstall Gemini CLI globally
echo   2. Remove configuration files (optional)
echo.

set /p confirm="Continue? (y/n): "
if /i not "%confirm%"=="y" (
    echo Uninstall cancelled.
    pause
    exit /b 0
)

echo.
echo Uninstalling Gemini CLI...
npm uninstall -g @google/gemini-cli

if %ERRORLEVEL% EQU 0 (
    echo [OK] Gemini CLI uninstalled
) else (
    echo [WARNING] Uninstall may have failed
)

echo.
set /p removeConfig="Remove configuration files? (y/n): "
if /i "%removeConfig%"=="y" (
    echo Removing configuration directory...
    if exist "%USERPROFILE%\.gemini" (
        rmdir /s /q "%USERPROFILE%\.gemini"
        echo [OK] Configuration removed
    ) else (
        echo [INFO] No configuration directory found
    )
)

echo.
echo Uninstall complete!
pause
