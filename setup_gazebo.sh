#!/bin/bash

# Update package list
sudo apt-get update || { echo "Error: Failed to update package list."; exit 1; }

# Install lsb-release, wget, and gnupg
sudo apt-get install lsb-release wget gnupg -y || { echo "Error: Failed to install required packages."; exit 1; }

# Download and add the GPG key for OSRF packages
sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg || { echo "Error: Failed to download GPG key."; exit 1; }

# Add the Gazebo repository to the package sources
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null || { echo "Error: Failed to add Gazebo repository."; exit 1; }

# Update package list again
sudo apt-get update || { echo "Error: Failed to update package list."; exit 1; }

# Install Gazebo (gz-garden)
sudo apt-get install gz-garden -y || { echo "Error: Failed to install Gazebo."; exit 1; }

# Update the environment
. ~/.profile || { echo "Error: Failed to update environment."; exit 1; }

# Print a message indicating successful completion
echo "Gazebo installation completed successfully!"
