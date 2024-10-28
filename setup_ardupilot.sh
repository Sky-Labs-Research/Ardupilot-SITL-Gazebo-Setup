#!/bin/bash

# Update package list
sudo apt-get update || { echo "Error: Failed to update package list."; exit 1; }

# Install git and gitk/git-gui
sudo apt-get install git gitk git-gui -y || { echo "Error: Failed to install Git and Git GUI."; exit 1; }

# Clone ArduPilot repository with submodules
git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git || { echo "Error: Failed to clone ArduPilot repository."; exit 1; }

# Navigate to the ArduPilot directory
cd ardupilot || { echo "Error: Failed to navigate to ArduPilot directory."; exit 1; }

# Run the installation script
Tools/environment_install/install-prereqs-ubuntu.sh -y || { echo "Error: Failed to run ArduPilot installation script."; exit 1; }

# Update the environment
. ~/.profile || { echo "Error: Failed to update environment."; exit 1; }

# Navigate to our script directory
cd .. || { echo "Error: Failed to navigate to directory."; exit 1; }

# Print a message indicating successful completion
echo "ArduPilot setup completed successfully!"
