#!/usr/bin/env zsh
set -e

command_exists() {
  command -v "\$1" >/dev/null 2>&1
}

if ! command_exists brew; then
  echo "Installing Homebrew..."
  /bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ "\$(uname)" == "Linux" ]]; then
    eval "\$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  fi
else
  echo "Homebrew is already installed."
fi

tools=(sheldon starship zoxide exa bat)
for tool in "\${tools[@]}"; do
  if ! command_exists "\$tool"; then
    echo "Installing \$tool..."
    brew install "\$tool"
  else
    echo "\$tool is already installed."
  fi
done

echo "Setting up configuration files..."
ln -sf "\$(pwd)/.zshrc" ~/.zshrc
mkdir -p ~/.config/sheldon
ln -sf "\$(pwd)/config/sheldon/plugins.toml" ~/.config/sheldon/plugins.toml
ln -sf "\$(pwd)/config/starship.toml" ~/.config/starship.toml
echo "Setup complete. Please restart your terminal or run 'source ~/.zshrc' to apply changes."
