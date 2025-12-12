# VS Code Setup for Windows

## Recommended Extensions

Install these extensions for the best development experience on Windows:

### Essential
- **ESLint** (`dbaeumer.vscode-eslint`) - JavaScript linting
- **Prettier** (`esbenp.prettier-vscode`) - Code formatting
- **TypeScript and JavaScript Language Features** (built-in) - IntelliSense

### Recommended
- **Error Lens** (`usernamehw.errorlens`) - Inline error display
- **GitLens** (`eamodio.gitlens`) - Git supercharged
- **npm Intellisense** (`christian-kohler.npm-intellisense`) - npm autocomplete
- **Path Intellisense** (`christian-kohler.path-intellisense`) - Path autocomplete
- **PowerShell** (`ms-vscode.powershell`) - PowerShell support

## Windows-Specific Settings

1. Copy `.vscode/settings.windows.json` to `.vscode/settings.json`:
   ```powershell
   Copy-Item .vscode/settings.windows.json .vscode/settings.json
   ```

2. Or create a new `settings.json` with these critical settings:
   ```json
   {
     "files.eol": "\n",
     "terminal.integrated.defaultProfile.windows": "PowerShell"
   }
   ```

## Line Endings Configuration

Windows uses CRLF (`\r\n`) while Unix/Linux/Mac use LF (`\n`). To avoid issues:

### Git Configuration
```powershell
# Auto-convert CRLF to LF on commit (recommended for cross-platform projects)
git config --global core.autocrlf true

# Or keep line endings as-is
git config --global core.autocrlf false
```

### VS Code Configuration
```json
{
  "files.eol": "\n"
}
```

## Terminal Setup

### PowerShell (Recommended)
```json
{
  "terminal.integrated.defaultProfile.windows": "PowerShell"
}
```

### Git Bash Alternative
If you prefer Unix-like environment:
```json
{
  "terminal.integrated.defaultProfile.windows": "Git Bash",
  "terminal.integrated.profiles.windows": {
    "Git Bash": {
      "path": "C:\\Program Files\\Git\\bin\\bash.exe"
    }
  }
}
```

## Debugging

### Launch Configuration
The project includes debug configurations in `.vscode/launch.json`.

To debug:
1. Open the file you want to debug
2. Set breakpoints (F9)
3. Press F5 or use Debug > Start Debugging
4. Select "Debug Gemini CLI"

### Debug Commands
```powershell
# Debug mode with Inspector
npm run debug

# Then attach VS Code debugger or use Chrome DevTools
```

## Common Issues

### Extension Host Terminated Unexpectedly
If VS Code extensions crash on Windows:
1. Disable Windows Defender scanning for the project folder
2. Add exclusion: `%USERPROFILE%\.vscode\extensions`

### Slow IntelliSense
If TypeScript IntelliSense is slow:
```json
{
  "typescript.tsserver.maxTsServerMemory": 4096,
  "search.exclude": {
    "**/node_modules": true
  }
}
```

### npm Scripts Not Running
If npm scripts don't work in integrated terminal:
1. Ensure Node.js is in PATH
2. Restart VS Code
3. Try running from external PowerShell first

## Keyboard Shortcuts (Windows)

| Action | Shortcut |
|--------|----------|
| Open Terminal | Ctrl + ` |
| Command Palette | Ctrl + Shift + P |
| Quick Open File | Ctrl + P |
| Go to Definition | F12 |
| Format Document | Shift + Alt + F |
| Start Debugging | F5 |
| Toggle Breakpoint | F9 |

## Performance Tips

1. **Exclude folders from search:**
   ```json
   {
     "search.exclude": {
       "**/node_modules": true,
       "**/dist": true,
       "**/bundle": true
     }
   }
   ```

2. **Disable file watching for large folders:**
   ```json
   {
     "files.watcherExclude": {
       "**/node_modules/**": true
     }
   }
   ```

3. **Use WSL for better performance:**
   - Install WSL2
   - Install "Remote - WSL" extension
   - Open project in WSL: `code --remote wsl+Ubuntu /path/to/project`

## Additional Resources

- [VS Code on Windows](https://code.visualstudio.com/docs/setup/windows)
- [Developing in WSL](https://code.visualstudio.com/docs/remote/wsl)
- [Node.js Debugging Guide](https://code.visualstudio.com/docs/nodejs/nodejs-debugging)
