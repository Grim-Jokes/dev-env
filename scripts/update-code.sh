#!/bin/bash

# Set debconf to non-interactive mode
export DEBIAN_FRONTEND=noninteractive

# Update package list
sudo apt-get update -y

# Install wget and required dependencies
sudo apt-get install -y wget apt-transport-https

# Add Microsoft's GPG key and repository for Visual Studio Code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor | sudo tee /usr/share/keyrings/vscode.gpg > /dev/null
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/vscode.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Update package list again and install Visual Studio Code
sudo apt-get update -y
sudo apt-get install -y code
