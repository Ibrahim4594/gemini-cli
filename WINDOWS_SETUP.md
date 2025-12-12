# Windows Setup Guide for Gemini CLI

This guide provides Windows-specific instructions for setting up and using Gemini CLI.

## Prerequisites

### 1. Install Node.js
- Download Node.js 20 or higher from [nodejs.org](https://nodejs.org/)
- Run the installer and follow the prompts
- Verify installation:
  ```powershell
  node --version
  npm --version
  ```

### 2. Install Git (Optional but Recommended)
- Download Git from [git-scm.com](https://git-scm.com/download/win)
- Install with default settings

## Installation Methods

### Method 1: Quick Start with npx (Recommended)
No installation required! Just run:
```powershell
npx @google/gemini-cli
```

### Method 2: Global Installation
```powershell
npm install -g @google/gemini-cli
gemini
```

### Method 3: Build from Source

1. Clone the repository:
   ```powershell
   git clone https://github.com/Ibrahim4594/gemini-cli
   cd gemini-cli
   ```

2. Install dependencies:
   ```powershell
   npm install
   ```

3. Build the project:
   ```powershell
   npm run build
   ```

4. Start the CLI:
   ```powershell
   npm start
   ```

## Authentication on Windows

### Using Google Login (Recommended)
```powershell
# Set your Google Cloud Project (if using Code Assist License)
$env:GOOGLE_CLOUD_PROJECT="YOUR_PROJECT_ID"
gemini
```

### Using API Key
```powershell
# Get your key from https://aistudio.google.com/apikey
$env:GEMINI_API_KEY="YOUR_API_KEY"
gemini
```

### Using Vertex AI
```powershell
$env:GOOGLE_API_KEY="YOUR_API_KEY"
$env:GOOGLE_GENAI_USE_VERTEXAI="true"
gemini
```

## Common Windows Issues and Solutions

### Issue: Command Not Found
If `gemini` command is not recognized after global installation:
1. Close and reopen PowerShell/Command Prompt
2. Verify npm global path is in PATH:
   ```powershell
   npm config get prefix
   ```
3. Add the npm global path to your system PATH if needed

### Issue: Execution Policy Error
If you see "execution policy" errors:
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Issue: Long Path Names
Windows has a 260 character path limit. Enable long paths:
1. Run as Administrator:
   ```powershell
   New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
   ```
2. Or use Git Bash which handles long paths better

### Issue: Node-gyp Build Errors
Some optional dependencies require build tools:
```powershell
npm install --global windows-build-tools
```

## Running Tests on Windows

```powershell
# Run all tests
npm test

# Run specific test suite
npm run test:integration:sandbox:none
```

## Development Tips for Windows

### Use PowerShell or Windows Terminal
Modern terminals provide better experience than Command Prompt.

### Consider WSL2 for Better Compatibility
For best compatibility with the Linux-based sandbox features:
1. Install WSL2: [Microsoft WSL Guide](https://docs.microsoft.com/en-us/windows/wsl/install)
2. Install Node.js in WSL2
3. Run Gemini CLI from within WSL2

### File Permissions
Windows file permissions work differently. The sandbox features may behave differently on Windows vs Linux/Mac.

## Configuration Location

Gemini CLI settings are stored in:
```
%USERPROFILE%\.gemini\settings.json
```

You can edit this file directly or use:
```powershell
notepad $env:USERPROFILE\.gemini\settings.json
```

## Quick Commands

### Check Version
```powershell
gemini --version
```

### Get Help
```powershell
gemini --help
```

### Use Specific Model
```powershell
gemini -m gemini-2.5-flash
```

### Non-interactive Mode
```powershell
gemini -p "Explain this codebase"
```

## Troubleshooting

### Enable Debug Mode
```powershell
$env:DEBUG="1"
gemini
```

### Clear Cache
```powershell
Remove-Item -Recurse -Force $env:USERPROFILE\.gemini\cache
```

### Reinstall Clean
```powershell
npm uninstall -g @google/gemini-cli
Remove-Item -Recurse -Force $env:USERPROFILE\.gemini
npm install -g @google/gemini-cli
```

## Additional Resources

- [Main README](./README.md)
- [Troubleshooting Guide](./docs/troubleshooting.md)
- [Configuration Guide](./docs/get-started/configuration.md)
- [GitHub Issues](https://github.com/Ibrahim4594/gemini-cli/issues)

## Contributing

See [CONTRIBUTING.md](./CONTRIBUTING.md) for how to contribute to this fork.
