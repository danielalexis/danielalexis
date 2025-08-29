#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Update system packages
echo "Updating system packages..."
sudo dnf update -y

# Install Zsh
echo "Installing Zsh..."
sudo dnf install -y zsh

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is already installed. Skipping."
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Git
echo "Installing Git..."
sudo dnf install -y git

# Install GitHub CLI
echo "Installing GitHub CLI..."
sudo dnf install dnf5-plugins
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo [18]
sudo dnf install -y gh

# Install FNM (Fast Node Manager)
echo "Installing FNM..."
if [ -d "$HOME/.fnm" ]; then
    echo "FNM is already installed. Skipping."
else
    curl -fsSL https://fnm.vercel.app/install | bash
fi
# Add fnm to Zsh path
echo 'export PATH="$HOME/.fnm:$PATH"' >> ~/.zshrc
echo 'eval "`fnm env`"' >> ~/.zshrc

# Install Go
echo "Installing Go..."
sudo dnf install -y golang

# Install Zed
echo "Installing Zed..."
curl -f https://zed.dev/install.sh | sh

# Install Visual Studio Code
echo "Installing Visual Studio Code..."
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
sudo dnf check-update
sudo dnf install -y code

# Install Podman
echo "Installing Podman..."
sudo dnf install -y podman

echo "Installation complete!"
echo "Please restart your terminal or run 'source ~/.zshrc' to apply the changes."
echo "To set Zsh as your default shell, run: chsh -s \$(which zsh)"
