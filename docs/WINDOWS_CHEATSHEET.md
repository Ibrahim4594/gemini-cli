# Windows Command Cheat Sheet for Gemini CLI

Quick reference for Windows users working with Gemini CLI.

## Installation Commands

### PowerShell
```powershell
# Install globally
npm install -g @google/gemini-cli

# Run without installing
npx @google/gemini-cli

# Update
npm update -g @google/gemini-cli

# Uninstall
npm uninstall -g @google/gemini-cli
```

### Command Prompt
```batch
REM Install globally
npm install -g @google/gemini-cli

REM Run
gemini

REM Uninstall
npm uninstall -g @google/gemini-cli
```

## Environment Variables

### PowerShell

**Set for current session:**
```powershell
$env:GEMINI_API_KEY="your-api-key"
$env:GOOGLE_CLOUD_PROJECT="your-project-id"
$env:GOOGLE_GENAI_USE_VERTEXAI="true"
```

**Set permanently (User level):**
```powershell
[System.Environment]::SetEnvironmentVariable('GEMINI_API_KEY', 'your-api-key', 'User')
```

**Set permanently (System level - requires Admin):**
```powershell
[System.Environment]::SetEnvironmentVariable('GEMINI_API_KEY', 'your-api-key', 'Machine')
```

**View environment variable:**
```powershell
echo $env:GEMINI_API_KEY
```

### Command Prompt

**Set for current session:**
```batch
set GEMINI_API_KEY=your-api-key
set GOOGLE_CLOUD_PROJECT=your-project-id
```

**Set permanently:**
```batch
setx GEMINI_API_KEY "your-api-key"
setx GOOGLE_CLOUD_PROJECT "your-project-id"
```

## Navigation

### PowerShell
```powershell
# Change directory
cd "C:\path\to\project"

# Change drive
cd D:\

# Go to home directory
cd ~

# Go up one level
cd ..

# List files
ls
Get-ChildItem

# Create directory
mkdir new-folder
New-Item -ItemType Directory -Path "new-folder"

# Remove directory
rmdir folder-name
Remove-Item -Recurse -Force "folder-name"
```

### Command Prompt
```batch
REM Change directory
cd C:\path\to\project

REM Change drive
D:

REM Go to home directory
cd %USERPROFILE%

REM List files
dir

REM Create directory
mkdir new-folder

REM Remove directory
rmdir /s /q folder-name
```

## Common npm Commands

```powershell
# Install dependencies
npm install
npm ci  # Clean install from package-lock.json

# Run scripts
npm start
npm test
npm run build
npm run setup

# List installed packages
npm list
npm list -g  # Global packages

# Check for outdated packages
npm outdated

# View package info
npm info @google/gemini-cli
```

## Gemini CLI Usage

### Starting Gemini
```powershell
# Basic start
gemini

# Start in specific directory
cd "C:\my\project" ; gemini

# Start with specific model
gemini -m gemini-2.5-flash

# Non-interactive mode
gemini -p "your question here"

# With JSON output
gemini -p "your question" --output-format json
```

### Inside Gemini CLI
```
/help          - Show all commands
/clear         - Clear conversation
/quit          - Exit
/auth          - Authentication settings
/model         - Switch model
/settings      - Open settings
/directory     - Change working directory
/memory        - View memory usage
/stats         - Show statistics
```

## File Operations

### PowerShell
```powershell
# Copy file
Copy-Item "source.txt" "destination.txt"

# Move file
Move-Item "source.txt" "destination.txt"

# Delete file
Remove-Item "file.txt"

# Read file
Get-Content "file.txt"

# Create file
New-Item -ItemType File "file.txt"

# Edit file
notepad "file.txt"
```

### Command Prompt
```batch
REM Copy file
copy source.txt destination.txt

REM Move file
move source.txt destination.txt

REM Delete file
del file.txt

REM Read file
type file.txt

REM Create file
echo. > file.txt

REM Edit file
notepad file.txt
```

## Git Commands

```powershell
# Clone repository
git clone https://github.com/username/repo.git

# Check status
git status

# Stage changes
git add .

# Commit
git commit -m "message"

# Push
git push

# Pull
git pull

# Create branch
git checkout -b feature-name

# Switch branch
git checkout main
```

## Troubleshooting Commands

### Check Versions
```powershell
node --version
npm --version
git --version
gemini --version
```

### Check npm Configuration
```powershell
npm config list
npm config get prefix
npm config get registry
```

### Clear npm Cache
```powershell
npm cache clean --force
```

### Check PATH
```powershell
# PowerShell
$env:PATH -split ';'

# Command Prompt
echo %PATH%
```

### Find Process by Port
```powershell
# PowerShell
Get-Process -Id (Get-NetTCPConnection -LocalPort 3000).OwningProcess

# Command Prompt
netstat -ano | findstr :3000
```

### Kill Process
```powershell
# PowerShell
Stop-Process -Id <PID> -Force

# Command Prompt
taskkill /PID <PID> /F
```

## Configuration File Locations

```powershell
# Gemini CLI config
$env:USERPROFILE\.gemini\settings.json

# npm config
$env:USERPROFILE\.npmrc

# Git config
$env:USERPROFILE\.gitconfig

# PowerShell profile
$PROFILE
# Usually: C:\Users\YourName\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
```

## PowerShell Profile Setup

Add these to your PowerShell profile for convenience:

```powershell
# Edit profile
notepad $PROFILE

# Add these lines:

# Set Gemini API key (if using)
# $env:GEMINI_API_KEY = "your-api-key"

# Alias for quick access
Set-Alias g gemini

# Function to start Gemini in specific directory
function Start-GeminiHere {
    gemini
}
Set-Alias gh Start-GeminiHere

# Function to clear and start fresh
function Start-GeminiFresh {
    Clear-Host
    gemini
}
Set-Alias gf Start-GeminiFresh
```

## Quick Reference: File Paths

| Description | PowerShell | Command Prompt |
|-------------|------------|----------------|
| Home directory | `~` or `$env:USERPROFILE` | `%USERPROFILE%` |
| App data | `$env:APPDATA` | `%APPDATA%` |
| Local app data | `$env:LOCALAPPDATA` | `%LOCALAPPDATA%` |
| Temp directory | `$env:TEMP` | `%TEMP%` |
| Program Files | `$env:ProgramFiles` | `%ProgramFiles%` |

## Keyboard Shortcuts

### Windows Terminal / PowerShell
| Action | Shortcut |
|--------|----------|
| New tab | Ctrl + Shift + T |
| Close tab | Ctrl + Shift + W |
| Copy | Ctrl + Shift + C |
| Paste | Ctrl + Shift + V |
| Find | Ctrl + Shift + F |
| Clear screen | Ctrl + L or `cls` |
| Cancel command | Ctrl + C |
| Autocomplete | Tab |

### Gemini CLI
| Action | Shortcut |
|--------|----------|
| Submit | Enter |
| New line | Shift + Enter |
| Cancel | Ctrl + C |
| Exit | Ctrl + D |

## Common Workflows

### Setup New Project
```powershell
# Navigate to projects folder
cd "$env:USERPROFILE\Documents\Projects"

# Create new directory
mkdir my-new-project
cd my-new-project

# Initialize npm
npm init -y

# Start Gemini to help build
gemini
```

### Debug Existing Project
```powershell
# Navigate to project
cd "C:\path\to\project"

# Check what's there
ls

# Start Gemini for help
gemini

# Inside Gemini:
> Help me debug this error: [paste error]
```

### Update Everything
```powershell
# Update Node.js (download new installer from nodejs.org)

# Update npm
npm install -g npm@latest

# Update Gemini CLI
npm update -g @google/gemini-cli

# Update project dependencies
cd "C:\your\project"
npm update
```

---

**Print this cheat sheet** for quick reference while working with Gemini CLI on Windows!

**Need more help?** See [Windows Setup Guide](../WINDOWS_SETUP.md) | [Windows Troubleshooting](./troubleshooting-windows.md)
