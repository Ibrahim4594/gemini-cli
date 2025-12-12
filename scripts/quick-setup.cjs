#!/usr/bin/env node

/**
 * @license
 * Copyright 2025 Google LLC
 * SPDX-License-Identifier: Apache-2.0
 *
 * Quick Setup Script for Gemini CLI
 * This script helps users get started quickly by checking prerequisites
 * and guiding them through the setup process.
 */

const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');
const os = require('os');

const colors = {
  reset: '\x1b[0m',
  bright: '\x1b[1m',
  green: '\x1b[32m',
  yellow: '\x1b[33m',
  red: '\x1b[31m',
  cyan: '\x1b[36m',
};

function log(message, color = colors.reset) {
  console.log(`${color}${message}${colors.reset}`);
}

function logSection(title) {
  console.log('\n' + '='.repeat(60));
  log(title, colors.bright + colors.cyan);
  console.log('='.repeat(60));
}

function checkCommand(command, friendlyName) {
  try {
    execSync(`${command} --version`, { stdio: 'pipe' });
    log(`✓ ${friendlyName} is installed`, colors.green);
    return true;
  } catch (error) {
    log(`✗ ${friendlyName} is not installed`, colors.red);
    return false;
  }
}

function getNodeVersion() {
  try {
    const version = execSync('node --version', { encoding: 'utf-8' }).trim();
    const majorVersion = parseInt(version.slice(1).split('.')[0]);
    return { version, majorVersion };
  } catch (error) {
    return null;
  }
}

function checkNodeVersion() {
  const nodeInfo = getNodeVersion();
  if (!nodeInfo) {
    log('✗ Node.js is not installed', colors.red);
    return false;
  }

  const { version, majorVersion } = nodeInfo;
  const requiredVersion = 20;

  if (majorVersion >= requiredVersion) {
    log(`✓ Node.js ${version} (>= ${requiredVersion}.0.0 required)`, colors.green);
    return true;
  } else {
    log(`✗ Node.js ${version} is too old (>= ${requiredVersion}.0.0 required)`, colors.red);
    return false;
  }
}

function checkGitRepo() {
  try {
    execSync('git rev-parse --git-dir', { stdio: 'pipe' });
    log('✓ Git repository initialized', colors.green);
    return true;
  } catch (error) {
    log('✗ Not a git repository', colors.yellow);
    return false;
  }
}

function checkPackageLock() {
  const lockFile = path.join(process.cwd(), 'package-lock.json');
  if (fs.existsSync(lockFile)) {
    log('✓ package-lock.json exists', colors.green);
    return true;
  } else {
    log('✗ package-lock.json not found', colors.yellow);
    return false;
  }
}

function checkNodeModules() {
  const nodeModules = path.join(process.cwd(), 'node_modules');
  if (fs.existsSync(nodeModules)) {
    log('✓ node_modules directory exists', colors.green);
    return true;
  } else {
    log('✗ node_modules directory not found', colors.yellow);
    return false;
  }
}

function printSystemInfo() {
  logSection('System Information');
  log(`Platform: ${os.platform()}`);
  log(`Architecture: ${os.arch()}`);
  log(`OS: ${os.type()} ${os.release()}`);
  log(`Node.js: ${process.version}`);
  log(`npm: ${execSync('npm --version', { encoding: 'utf-8' }).trim()}`);
}

function printQuickStartGuide() {
  logSection('Quick Start Guide');

  console.log('\nTo get started with Gemini CLI:\n');

  log('1. Install dependencies:', colors.cyan);
  log('   npm install\n');

  log('2. Build the project:', colors.cyan);
  log('   npm run build\n');

  log('3. Start Gemini CLI:', colors.cyan);
  log('   npm start\n');

  log('4. Or use the built bundle:', colors.cyan);
  log('   node bundle/gemini.js\n');

  log('Authentication Options:', colors.bright);
  log('  • Google Login: Just run gemini and follow prompts');
  log('  • API Key: Set GEMINI_API_KEY environment variable');
  log('  • Vertex AI: Set GOOGLE_API_KEY and GOOGLE_GENAI_USE_VERTEXAI=true\n');
}

function printWindowsSpecificInfo() {
  if (os.platform() === 'win32') {
    logSection('Windows-Specific Information');
    log('You are running on Windows. Additional tips:', colors.yellow);
    log('  • See WINDOWS_SETUP.md for detailed Windows instructions');
    log('  • Use PowerShell or Windows Terminal for best experience');
    log('  • Consider WSL2 for better Linux compatibility');
    log('  • Set environment variables in PowerShell:');
    log('    $env:GEMINI_API_KEY="your-api-key"');
  }
}

function runChecks() {
  logSection('Checking Prerequisites');

  const checks = {
    node: checkNodeVersion(),
    npm: checkCommand('npm', 'npm'),
    git: checkCommand('git', 'Git'),
  };

  logSection('Checking Project Setup');

  const projectChecks = {
    gitRepo: checkGitRepo(),
    packageLock: checkPackageLock(),
    nodeModules: checkNodeModules(),
  };

  return { ...checks, ...projectChecks };
}

function provideSuggestions(checks) {
  logSection('Recommendations');

  const issues = [];

  if (!checks.node) {
    issues.push({
      problem: 'Node.js is not installed or version is too old',
      solution: 'Install Node.js 20+ from https://nodejs.org/',
    });
  }

  if (!checks.npm) {
    issues.push({
      problem: 'npm is not installed',
      solution: 'npm comes with Node.js. Install Node.js from https://nodejs.org/',
    });
  }

  if (!checks.git) {
    issues.push({
      problem: 'Git is not installed',
      solution: 'Install Git from https://git-scm.com/ (optional but recommended)',
    });
  }

  if (!checks.nodeModules) {
    issues.push({
      problem: 'Dependencies are not installed',
      solution: 'Run: npm install',
    });
  }

  if (!checks.gitRepo) {
    issues.push({
      problem: 'Not a git repository',
      solution: 'Run: git init (if you want version control)',
    });
  }

  if (issues.length === 0) {
    log('✓ All checks passed! You\'re ready to build and run Gemini CLI.', colors.green);
    log('\nNext steps:', colors.bright);
    log('  1. npm run build');
    log('  2. npm start');
  } else {
    log('⚠ Some issues were found:\n', colors.yellow);
    issues.forEach((issue, index) => {
      log(`${index + 1}. ${issue.problem}`, colors.red);
      log(`   → ${issue.solution}`, colors.cyan);
      console.log();
    });
  }
}

function main() {
  console.clear();
  log('╔════════════════════════════════════════════════════════════╗', colors.bright + colors.cyan);
  log('║         Gemini CLI - Quick Setup & Diagnostics            ║', colors.bright + colors.cyan);
  log('╚════════════════════════════════════════════════════════════╝', colors.bright + colors.cyan);

  printSystemInfo();
  const checks = runChecks();
  provideSuggestions(checks);
  printWindowsSpecificInfo();
  printQuickStartGuide();

  logSection('Additional Resources');
  log('  • Main Documentation: README.md');
  log('  • Windows Guide: WINDOWS_SETUP.md');
  log('  • Fork Changelog: FORK_CHANGELOG.md');
  log('  • Contributing: CONTRIBUTING.md');
  log('  • Troubleshooting: docs/troubleshooting.md');

  console.log('\n' + '='.repeat(60) + '\n');
  log('For more help, visit: https://github.com/Ibrahim4594/gemini-cli', colors.cyan);
  console.log();
}

// Run the script
main();
