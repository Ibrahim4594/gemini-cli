# Security Policy

## Reporting Security Issues

### For the Original Project

If you discover a security vulnerability in the core Gemini CLI functionality, please report it to the upstream project:

- **Original Repository:** https://github.com/google-gemini/gemini-cli
- **Security Policy:** https://github.com/google-gemini/gemini-cli/security/policy

### For Fork-Specific Code

If you discover a security vulnerability in the fork-specific additions (Windows scripts, setup tools, etc.), please report it by:

1. **Do NOT open a public issue**
2. Email: ibrahimsamad507@gmail.com with subject "Security Issue: Gemini CLI Fork"
3. Include:
   - Description of the vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

## Supported Versions

This fork tracks the original project's security updates.

| Version | Supported          |
| ------- | ------------------ |
| Latest  | :white_check_mark: |
| < 0.21  | :x:                |

## Security Best Practices

### When Using Setup Scripts

1. **Review Before Running**
   - Always review PowerShell scripts before execution
   - Check batch files for unexpected commands
   - Verify download sources

2. **Environment Variables**
   - Never commit API keys to repositories
   - Use environment variables for sensitive data
   - Rotate keys regularly

3. **Windows Defender**
   - Keep Windows Defender up to date
   - Scan downloaded scripts
   - Add exclusions carefully

### API Key Security

- Store keys in environment variables, not code
- Never share keys publicly
- Use `.gitignore` for `.env` files
- Rotate keys if compromised

### PowerShell Execution

```powershell
# Check script before running
Get-Content script.ps1

# Run with restricted execution
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process
```

## Known Security Considerations

### Setup Scripts
- PowerShell scripts require execution policy adjustment
- Batch scripts run with current user permissions
- No elevation required for user-level installation

### Configuration Files
- Settings stored in `~/.gemini/` directory
- Contains authentication tokens
- Protect with appropriate file permissions

## Updates and Patches

- Monitor original repository for security updates
- Fork will be updated to include security patches
- Check releases page for security-related updates

## Responsible Disclosure

We follow responsible disclosure practices:
- 90-day disclosure timeline
- Coordinated with upstream project
- Credit to security researchers

## Contact

For security concerns:
- Fork-specific: ibrahimsamad507@gmail.com
- Original project: https://github.com/google-gemini/gemini-cli/security

---

**Thank you for helping keep Gemini CLI and this fork secure!**
