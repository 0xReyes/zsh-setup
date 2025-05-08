# Minimal Zsh Configuration

A minimal and efficient Zsh setup for macOS and Linux.

## Features
- Fast startup with Sheldon and Starship
- Modern tools: exa, bat, zoxide
- Easy installation and configuration

## Prerequisites
- Zsh installed
- Git for cloning the repository
- curl for installing Homebrew
- For Linux: ensure you have build-essential, curl, file, git installed (e.g., `sudo apt install build-essential curl file git` on Ubuntu)

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/zsh-minimal.git
   cd zsh-minimal
    ```
2. Run the installation script:
   ```bash
    ./install.sh
    ```
3. Set Zsh as your default shell (if not already):
   ```bash
   chsh -s \$(which zsh)
   ```
4. Restart your terminal or run `source ~/.zshrc` to apply changes.
