# Windows Quick Start Guide

Get up and running with Gemini CLI on Windows in 5 minutes.

## Prerequisites

✅ **Windows 10 or 11**
✅ **Node.js 20 or higher** - [Download](https://nodejs.org/)
✅ **PowerShell or Command Prompt**

## Installation

### Option 1: npx (No Installation Required) ⚡

```powershell
npx @google/gemini-cli
```

This runs Gemini CLI immediately without installing anything globally.

### Option 2: Global Installation

```powershell
npm install -g @google/gemini-cli
gemini
```

### Option 3: Using Automated Script

Download and run the setup script:

```powershell
# PowerShell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/google-gemini/gemini-cli/main/examples/windows-powershell-setup.ps1" -OutFile "setup.ps1"
.\setup.ps1 -Global
```

Or use the batch script:

```batch
REM Command Prompt
curl -o install.bat https://raw.githubusercontent.com/google-gemini/gemini-cli/main/examples/batch-scripts/install-windows.bat
install.bat
```

## Authentication

### Method 1: Google Login (Recommended)

1. Run `gemini`
2. Select "Login with Google"
3. Complete authentication in browser
4. Start chatting!

### Method 2: API Key

1. Get your API key from [Google AI Studio](https://aistudio.google.com/apikey)
2. Set environment variable:

**PowerShell:**
```powershell
$env:GEMINI_API_KEY="your-api-key-here"
gemini
```

**Command Prompt:**
```batch
set GEMINI_API_KEY=your-api-key-here
gemini
```

### Method 3: Vertex AI

**PowerShell:**
```powershell
$env:GOOGLE_API_KEY="your-api-key"
$env:GOOGLE_GENAI_USE_VERTEXAI="true"
gemini
```

## First Commands

### Start Interactive Session
```powershell
gemini
```

### Ask a Question
```powershell
gemini -p "Explain what Node.js is"
```

### Get Help
```powershell
gemini --help
```

### Use Specific Model
```powershell
gemini -m gemini-2.5-flash
```

## Essential Commands Inside Gemini CLI

| Command | Description |
|---------|-------------|
| `/help` | Show all available commands |
| `/clear` | Clear conversation history |
| `/quit` | Exit Gemini CLI |
| `/settings` | Open settings |
| `/auth` | Change authentication method |
| `/model` | Switch AI model |

## Common Use Cases

### 1. Code Explanation
```powershell
gemini
> Explain this TypeScript code: [paste your code]
```

### 2. Debug Help
```powershell
gemini
> I'm getting this error: [paste error message]
> Here's my code: [paste code]
```

### 3. Generate Code
```powershell
gemini
> Write a Python function to fetch data from an API
```

### 4. Project Analysis
```powershell
cd C:\path\to\your\project
gemini
> Analyze the structure of this codebase
```

## Configuration

### Config File Location
```
C:\Users\YourName\.gemini\settings.json
```

### Edit Configuration
```powershell
notepad $env:USERPROFILE\.gemini\settings.json
```

### Common Settings

```json
{
  "model": "gemini-2.5-pro",
  "temperature": 0.7,
  "theme": "default"
}
```

## Troubleshooting

### Command Not Found
If `gemini` command is not recognized:
1. Close and reopen your terminal
2. Verify installation: `npm list -g @google/gemini-cli`
3. Check npm global path: `npm config get prefix`

### Permission Errors
Run as Administrator or configure npm:
```powershell
npm config set prefix $env:APPDATA\npm
```

### API Errors
- Verify your API key is correct
- Check your internet connection
- Ensure you haven't exceeded rate limits

## Next Steps

📚 **Read the full documentation:**
- [Windows Setup Guide](../../WINDOWS_SETUP.md)
- [Configuration Guide](./configuration.md)
- [Authentication Guide](./authentication.md)

🎯 **Try these tutorials:**
- [Basic Usage](../cli/tutorials.md)
- [Advanced Features](../cli/commands.md)

🐛 **Having issues?**
- [Windows Troubleshooting](../troubleshooting-windows.md)
- [General Troubleshooting](../troubleshooting.md)
- [Report Issues](https://github.com/google-gemini/gemini-cli/issues)

## Pro Tips for Windows Users

1. **Use Windows Terminal** for better experience
2. **Add to PATH** for easy access
3. **Create shortcuts** for common workflows
4. **Use PowerShell profiles** to set env vars automatically:
   ```powershell
   notepad $PROFILE
   # Add: $env:GEMINI_API_KEY="your-key"
   ```
5. **Consider WSL2** for Linux-like environment

## Quick Reference Card

```powershell
# Installation
npm install -g @google/gemini-cli

# Start
gemini

# With specific model
gemini -m gemini-2.5-flash

# Non-interactive
gemini -p "your question"

# In specific directory
cd C:\your\project && gemini

# Check version
gemini --version

# Update
npm update -g @google/gemini-cli
```

---

**Need Help?** Join our community or check out the [FAQ](../faq.md)
