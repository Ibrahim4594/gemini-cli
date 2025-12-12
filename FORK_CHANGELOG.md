# Fork Changelog

This changelog tracks modifications made to this fork of the official Gemini CLI.

**Fork Maintainer:** Ibrahim4594
**Original Repository:** [google-gemini/gemini-cli](https://github.com/google-gemini/gemini-cli)
**Fork Repository:** [Ibrahim4594/gemini-cli](https://github.com/Ibrahim4594/gemini-cli)

## [Unreleased]

### Added
- **Windows Setup Guide** (`WINDOWS_SETUP.md`): Comprehensive guide for Windows users including:
  - Installation methods specific to Windows
  - PowerShell-specific authentication commands
  - Common Windows issues and solutions
  - WSL2 integration tips
  - File path and permission considerations

- **Quick Setup Script** (`scripts/quick-setup.js`): Automated setup utility that:
  - Checks system prerequisites (Node.js version)
  - Validates the environment
  - Offers to install dependencies
  - Provides quick-start commands
  - Cross-platform compatible (Windows, macOS, Linux)

- **Enhanced Error Logging**: Improved error messages with more context for debugging

- **Fork Documentation**: This changelog to track fork-specific changes

### Changed
- Updated `README.md` to indicate this is a community fork
- Enhanced error messages in main entry point for better debugging

### Fixed
- Improved error handling in the global entry point
- Better path resolution for Windows environments

## About This Fork

This fork aims to:
1. Provide better Windows support and documentation
2. Add developer-friendly utilities and scripts
3. Include community-driven enhancements
4. Maintain compatibility with the upstream project

## Staying Updated

To sync with upstream changes:
```bash
git remote add upstream https://github.com/google-gemini/gemini-cli.git
git fetch upstream
git merge upstream/main
```

## Contributing to This Fork

Contributions are welcome! Please:
1. Fork this repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

For major changes, please open an issue first to discuss what you would like to change.

## License

This fork maintains the same Apache 2.0 license as the original project.
