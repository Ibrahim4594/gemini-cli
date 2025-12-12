# Windows Troubleshooting Guide

This guide addresses common issues Windows users encounter when using Gemini CLI.

## Table of Contents
- [Installation Issues](#installation-issues)
- [Runtime Errors](#runtime-errors)
- [Authentication Problems](#authentication-problems)
- [Performance Issues](#performance-issues)
- [Path and File System Issues](#path-and-file-system-issues)

## Installation Issues

### npm Command Not Found

**Problem:** After installing Node.js, `npm` command is not recognized.

**Solution:**
1. Close and reopen your terminal
2. Verify Node.js installation:
   ```powershell
   node --version
   npm --version
   ```
3. If still not working, add npm to PATH manually:
   - Search for "Environment Variables" in Windows
   - Add `C:\Program Files\nodejs\` to PATH

### Global Package Installation Fails

**Problem:** `npm install -g` fails with permission errors.

**Solution:**
```powershell
# Run as Administrator, or configure npm to use a different directory
npm config set prefix %APPDATA%\npm
```

### Long Path Issues

**Problem:** `ENAMETOOLONG` errors during installation.

**Solution:**
1. Enable long paths in Windows 10/11:
   ```powershell
   # Run as Administrator
   New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" -Name "LongPathsEnabled" -Value 1 -PropertyType DWORD -Force
   ```
2. Or use shorter installation path

## Runtime Errors

### "Cannot find module" Errors

**Problem:** Module not found errors when running `gemini`.

**Solution:**
```powershell
# Reinstall dependencies
rm -r node_modules
npm install
```

### PowerShell Execution Policy Error

**Problem:** Scripts cannot be run due to execution policy.

**Solution:**
```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### Port Already in Use

**Problem:** Error: "EADDRINUSE: address already in use".

**Solution:**
```powershell
# Find process using the port
netstat -ano | findstr :PORT_NUMBER
# Kill the process
taskkill /PID <PID> /F
```

## Authentication Problems

### OAuth Flow Not Opening Browser

**Problem:** Browser doesn't open during Google login.

**Solution:**
1. Manually copy the URL from terminal
2. Paste in browser
3. Complete authentication
4. Copy token back to terminal

### API Key Not Recognized

**Problem:** Environment variable not recognized.

**Solution:**
```powershell
# PowerShell - Session only
$env:GEMINI_API_KEY="your-key"

# PowerShell - Persistent
[System.Environment]::SetEnvironmentVariable('GEMINI_API_KEY','your-key','User')

# Verify
echo $env:GEMINI_API_KEY
```

## Performance Issues

### Slow Startup on Windows Defender

**Problem:** Gemini CLI starts slowly.

**Solution:**
Add exclusion in Windows Defender:
1. Open Windows Security
2. Go to "Virus & threat protection"
3. Click "Manage settings"
4. Add exclusion for Node.js and project directory

### High Memory Usage

**Problem:** Node.js consuming too much memory.

**Solution:**
```powershell
# Limit Node.js memory
$env:NODE_OPTIONS="--max-old-space-size=4096"
gemini
```

## Path and File System Issues

### Backslash vs Forward Slash

**Problem:** Path errors with forward slashes.

**Solution:**
- Use forward slashes in config files: `path/to/file`
- Or use escaped backslashes: `path\\to\\file`

### Case Sensitivity

**Problem:** Files not found due to case mismatch.

**Solution:**
- Windows is case-insensitive but case-preserving
- Always use consistent casing in your codebase
- Be aware when collaborating with Linux/Mac users

### Special Characters in Paths

**Problem:** Errors with spaces or special characters in paths.

**Solution:**
```powershell
# Always quote paths with spaces
cd "C:\Path With Spaces\project"
gemini --include-directories "C:\My Documents\code"
```

## WSL2 Issues

### File System Performance

**Problem:** Slow file operations when accessing Windows drives from WSL2.

**Solution:**
- Keep project files in WSL2 file system (`~/project`)
- Avoid accessing `/mnt/c/` frequently
- Use `\\wsl$\Ubuntu\home\username\` from Windows

### Line Ending Issues

**Problem:** `CRLF` vs `LF` line ending conflicts.

**Solution:**
```bash
# Configure git to handle line endings
git config --global core.autocrlf true  # Windows
git config --global core.autocrlf input # WSL2
```

## Getting More Help

If you continue to experience issues:

1. Enable debug mode:
   ```powershell
   $env:DEBUG="*"
   gemini
   ```

2. Check logs location:
   ```
   %USERPROFILE%\.gemini\logs
   ```

3. Report issues: [GitHub Issues](https://github.com/google-gemini/gemini-cli/issues)

4. Include in your report:
   - Windows version
   - PowerShell version
   - Node.js version
   - Error message and stack trace
   - Steps to reproduce

## Additional Resources

- [Main Documentation](./index.md)
- [Windows Setup Guide](../WINDOWS_SETUP.md)
- [General Troubleshooting](./troubleshooting.md)
- [Configuration Guide](./get-started/configuration.md)
