### 5. install.sh

```bash
#!/bin/bash

# GitHub repository information
REPO_OWNER="biohacker0"
REPO_NAME="gitswitch"
BRANCH="main"

# Determine OS
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    OS="windows"
else
    echo "Unsupported OS"
    exit 1
fi

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Node.js is not installed. Please install Node.js and try again."
    exit 1
fi

# Install gitswitch from GitHub
npm install -g ${REPO_OWNER}/${REPO_NAME}

# Add gitswitch to PATH (for non-Windows systems)
if [[ "$OS" != "windows" ]]; then
    echo 'export PATH="$PATH:$(npm prefix -g)/bin"' >> ~/.bashrc
    echo 'export PATH="$PATH:$(npm prefix -g)/bin"' >> ~/.zshrc
    echo "Please restart your terminal or run 'source ~/.bashrc' (or ~/.zshrc) to use gitswitch."
else
    echo "gitswitch has been installed. You may need to restart your terminal to use it."
fi

echo "Installation complete. You can now use 'gitswitch' command."