# Pull Request: Windows Setup Enhancements

## Description
This PR adds comprehensive Windows support documentation and tooling to improve the experience for Windows developers using Gemini CLI.

## Related Issue
<!-- Link to the issue this PR addresses -->
Fixes #XXXX

## Changes Made

### 1. Windows Setup Guide
- Added comprehensive `WINDOWS_SETUP.md` with Windows-specific installation instructions
- Included PowerShell examples for authentication
- Added troubleshooting section for common Windows issues
- Documented WSL2 integration tips

### 2. Quick Setup Diagnostic Tool
- Created `scripts/quick-setup.cjs` for automated environment validation
- Checks Node.js version compatibility
- Validates project setup
- Provides platform-specific recommendations
- Added `npm run setup` command

### 3. Documentation Updates
- Updated README with Windows-specific guidance
- Added fork attribution and resources section
- Improved clarity for cross-platform users

## Testing
- [x] Tested on Windows 11 with PowerShell
- [x] Tested on Windows 10 with Command Prompt
- [x] Verified Node.js version checking
- [x] Validated setup script functionality
- [ ] Tested with WSL2 (pending)

## Checklist
- [x] My code follows the project's code style
- [x] I have performed a self-review
- [x] I have commented my code where necessary
- [x] My changes generate no new warnings
- [x] I have added documentation
- [ ] I have signed the CLA

## Screenshots
<!-- Add screenshots if applicable -->

## Additional Context
These changes aim to make Gemini CLI more accessible to Windows developers, who make up a significant portion of the developer community. The setup script provides immediate value by helping users diagnose issues before they encounter errors.
