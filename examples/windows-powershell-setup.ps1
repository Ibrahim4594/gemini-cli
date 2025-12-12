# Gemini CLI - Windows PowerShell Setup Script
# This script automates the setup process for Gemini CLI on Windows

# Requires -RunAsAdministrator (optional, for system-wide installation)

<#
.SYNOPSIS
    Automated setup script for Gemini CLI on Windows
.DESCRIPTION
    This script checks prerequisites, installs dependencies, and configures
    Gemini CLI for Windows environments.
.EXAMPLE
    .\windows-powershell-setup.ps1
.EXAMPLE
    .\windows-powershell-setup.ps1 -Global
#>

param(
    [switch]$Global,
    [switch]$SkipChecks
)

# Color output functions
function Write-Success {
    param([string]$Message)
    Write-Host "✓ $Message" -ForegroundColor Green
}

function Write-Error-Custom {
    param([string]$Message)
    Write-Host "✗ $Message" -ForegroundColor Red
}

function Write-Info {
    param([string]$Message)
    Write-Host "ℹ $Message" -ForegroundColor Cyan
}

function Write-Warning-Custom {
    param([string]$Message)
    Write-Host "⚠ $Message" -ForegroundColor Yellow
}

# Banner
Write-Host @"
╔════════════════════════════════════════════════════════════╗
║         Gemini CLI - Windows Setup Script                 ║
╚════════════════════════════════════════════════════════════╝
"@ -ForegroundColor Cyan

Write-Host ""

# Check Node.js
Write-Info "Checking Node.js installation..."
try {
    $nodeVersion = node --version
    $nodeMajor = [int]($nodeVersion -replace 'v(\d+)\..*', '$1')

    if ($nodeMajor -ge 20) {
        Write-Success "Node.js $nodeVersion installed (>= 20 required)"
    } else {
        Write-Error-Custom "Node.js $nodeVersion is too old (>= 20 required)"
        Write-Info "Download from: https://nodejs.org/"
        exit 1
    }
} catch {
    Write-Error-Custom "Node.js is not installed"
    Write-Info "Download from: https://nodejs.org/"
    exit 1
}

# Check npm
Write-Info "Checking npm installation..."
try {
    $npmVersion = npm --version
    Write-Success "npm $npmVersion installed"
} catch {
    Write-Error-Custom "npm is not installed"
    exit 1
}

# Check git (optional)
Write-Info "Checking Git installation..."
try {
    $gitVersion = git --version
    Write-Success "$gitVersion installed"
} catch {
    Write-Warning-Custom "Git is not installed (optional)"
    Write-Info "Download from: https://git-scm.com/"
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan

# Installation options
if ($Global) {
    Write-Info "Installing Gemini CLI globally..."
    npm install -g @google/gemini-cli

    if ($LASTEXITCODE -eq 0) {
        Write-Success "Gemini CLI installed globally"
        Write-Info "Run 'gemini' from any directory to start"
    } else {
        Write-Error-Custom "Global installation failed"
        exit 1
    }
} else {
    Write-Info "Setting up local development environment..."

    # Check if we're in the right directory
    if (Test-Path "package.json") {
        Write-Success "Found package.json"

        # Install dependencies
        Write-Info "Installing dependencies..."
        npm install

        if ($LASTEXITCODE -eq 0) {
            Write-Success "Dependencies installed"
        } else {
            Write-Error-Custom "Dependency installation failed"
            exit 1
        }

        # Build project
        Write-Info "Building project..."
        npm run build

        if ($LASTEXITCODE -eq 0) {
            Write-Success "Project built successfully"
        } else {
            Write-Error-Custom "Build failed"
            exit 1
        }
    } else {
        Write-Warning-Custom "Not in Gemini CLI directory"
        Write-Info "Navigate to the gemini-cli directory first"
        exit 1
    }
}

Write-Host ""
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan

# Check for API key
Write-Info "Checking authentication setup..."
if ($env:GEMINI_API_KEY) {
    Write-Success "GEMINI_API_KEY environment variable is set"
} elseif ($env:GOOGLE_API_KEY) {
    Write-Success "GOOGLE_API_KEY environment variable is set"
} else {
    Write-Warning-Custom "No API key environment variable found"
    Write-Host ""
    Write-Info "To set up authentication, choose one of these options:"
    Write-Host ""
    Write-Host "  1. Use Google Login (recommended):" -ForegroundColor Yellow
    Write-Host "     Just run 'gemini' and follow the authentication flow"
    Write-Host ""
    Write-Host "  2. Use API Key:" -ForegroundColor Yellow
    Write-Host "     Get your key from: https://aistudio.google.com/apikey"
    Write-Host "     Then run:"
    Write-Host "     `$env:GEMINI_API_KEY='your-api-key'"
    Write-Host ""
    Write-Host "  3. Use Vertex AI:" -ForegroundColor Yellow
    Write-Host "     `$env:GOOGLE_API_KEY='your-api-key'"
    Write-Host "     `$env:GOOGLE_GENAI_USE_VERTEXAI='true'"
    Write-Host ""
}

# Check Windows Defender exclusion
Write-Host ""
Write-Info "Performance Tip:"
Write-Warning-Custom "Consider adding Node.js to Windows Defender exclusions"
Write-Info "This can significantly improve startup time"
Write-Host "  1. Open Windows Security"
Write-Host "  2. Go to Virus & threat protection > Manage settings"
Write-Host "  3. Add exclusion for: $env:ProgramFiles\nodejs\"
Write-Host ""

# Summary
Write-Host "═══════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host ""
Write-Success "Setup complete!"
Write-Host ""

if ($Global) {
    Write-Info "Next steps:"
    Write-Host "  1. Run: gemini"
    Write-Host "  2. Follow authentication prompts"
    Write-Host "  3. Start using Gemini CLI!"
} else {
    Write-Info "Next steps:"
    Write-Host "  1. Run: npm start"
    Write-Host "  2. Follow authentication prompts"
    Write-Host "  3. Start developing!"
}

Write-Host ""
Write-Info "Documentation: https://geminicli.com/docs/"
Write-Info "Windows Guide: See WINDOWS_SETUP.md"
Write-Host ""
