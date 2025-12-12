# Examples Directory

This directory contains example scripts and configurations for Gemini CLI.

## Windows Setup Scripts

### PowerShell
- **windows-powershell-setup.ps1** - Automated setup wizard for Windows users
  - Checks prerequisites
  - Installs dependencies
  - Configures environment
  - Provides setup guidance

### Batch Scripts
- **batch-scripts/install-windows.bat** - Command Prompt installer
- **batch-scripts/uninstall-windows.bat** - Clean uninstall script

## Usage

### PowerShell Script
```powershell
# Download and run
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Ibrahim4594/gemini-cli/main/examples/windows-powershell-setup.ps1" -OutFile "setup.ps1"
.\setup.ps1 -Global
```

### Batch Script
```batch
REM Download and run
curl -o install.bat https://raw.githubusercontent.com/Ibrahim4594/gemini-cli/main/examples/batch-scripts/install-windows.bat
install.bat
```

## Contributing Examples

Have a useful script or configuration? Submit a PR!

### Guidelines
- Add clear comments
- Include usage instructions
- Test on multiple Windows versions
- Follow existing code style
