#!/bin/bash

# Update package list
sudo apt update || { echo "Error: Failed to update package list."; exit 1; }

# Install libgz-sim7-dev and rapidjson-dev
sudo apt install libgz-sim7-dev rapidjson-dev -y || { echo "Error: Failed to install required packages."; exit 1; }

# Create and navigate to the workspace directory
cd ~

# Clone the ArduPilot Gazebo repository
git clone https://github.com/ArduPilot/ardupilot_gazebo || { echo "Error: Failed to clone ArduPilot Gazebo repository."; exit 1; }

# Navigate into the ardupilot_gazebo directory
cd ardupilot_gazebo || { echo: "Error: Failed to navigate to ardupilot_gazebo directory."; exit 1; }

# Create and navigate to the build directory
mkdir -p build && cd build || { echo "Error: Failed to create or navigate to the build directory."; exit 1; }

# Build the project
cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo || { echo "Error: Failed to run CMake."; exit 1; }
make -j4 || { echo "Error: Failed to build the project."; exit 1; }

# Set environment variables
export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/gz_ws/src/ardupilot_gazebo/build:$GZ_SIM_SYSTEM_PLUGIN_PATH
export GZ_SIM_RESOURCE_PATH=$HOME/gz_ws/src/ardupilot_gazebo/models:$HOME/gz_ws/src/ardupilot_gazebo/worlds:$GZ_SIM_RESOURCE_PATH

# Update the environment
. ~/.profile || { echo "Error: Failed to update environment."; exit 1; }

# Print a message indicating successful completion
echo "ArduPilot Gazebo setup completed successfully!"
