# Ardupilot-SITL-Gazebo-Setup

**Summary:**
This set of instructions guides you through the installation of Ardupilot and Software-in-the-Loop (SITL) along with Gazebo simulation. It involves cloning a repository, setting up Ardupilot, configuring Gazebo, and testing the integration of Ardupilot with Gazebo.

**Requirements:**

- Ubuntu 20.04 or 22.04
- Graphics card recommended

**Instructions:**
1. Install Ardupilot & SITL:
   - Setup Ardupilot & SITL
      ```bash
      git clone https://github.com/Sky-Labs-Research/Ardupilot-SITL-Gazebo-Setup.git
      cd Ardupilot-SITL-Gazebo-Setup
      ./setup_ardupilot.sh
      ```
   - Test Ardupilot SITL
      ```bash
      cd ~/ardupilot/ArduCopter
      sim_vehicle.py -w
      sim_vehicle.py --console –map
      ```
3. Install Gazebo:
   - Setup Gazebo
      ```bash
      ./setup_gazebo
      ```
   - Test Gazebo
      ```bash
      gz sim -v4 -r shapes.sdf
      ```
4. Install Ardupilot + Gazebo:
   - Setup Ardupilot Gazebo
      ```bash
      ./setup_ardupilot_gazebo
      ```
   - Test Ardupilot and Gazebo
      ```bash
      # In one console
      gz sim -v4 -r iris_runway.sdf
      # In another console (CTRL+T Opens a new console tab)
      sim_vehicle.py -v ArduCopter -f gazebo-iris --model JSON --map --console
      # Arm and Take off
      # STABILIZE> mode guided
      # GUIDED> arm throttle
      # GUIDED> takeoff 5
      ```

**References:**
- Ardupilot setup: [Building Setup for Linux](https://ardupilot.org/dev/docs/building-setup-linux.html#building-setup-linux)
- Setting up SITL on Linux: [Ardupilot Documentation](https://ardupilot.org/dev/docs/setting-up-sitl-on-linux.html#setting-up-sitl-on-linux)
- Gazebo setup: [Install Gazebo on Ubuntu](https://gazebosim.org/docs/garden/install_ubuntu)
- Ardupilot with Gazebo: [SITL with Gazebo](https://ardupilot.org/dev/docs/sitl-with-gazebo.html)

**No Script (Manual) Instructions:**

1. **Install Ardupilot & SITL:**
   - Run the following commands:
     ```bash
     sudo apt-get update
     sudo apt-get install git
     sudo apt-get install gitk git-gui
     git clone --recurse-submodules https://github.com/ArduPilot/ardupilot.git
     cd ardupilot
     Tools/environment_install/install-prereqs-ubuntu.sh -y
     . ~/.profile
     ```

2. **Setting up SITL:**
   - Run the following commands:
     ```bash
     cd ~/ardupilot/ArduCopter
     # Wipe EEPROM
     sim_vehicle.py -w
     # Test
     sim_vehicle.py --console –map
     ```

3. **Install Gazebo:**
   - Run the following commands:
     ```bash
     sudo apt-get update
     sudo apt-get install lsb-release wget gnupg
     sudo wget https://packages.osrfoundation.org/gazebo.gpg -O /usr/share/keyrings/pkgs-osrf-archive-keyring.gpg
     echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/pkgs-osrf-archive-keyring.gpg] http://packages.osrfoundation.org/gazebo/ubuntu-stable $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/gazebo-stable.list > /dev/null
     sudo apt-get update
     sudo apt-get install gz-garden
     . ~/.profile
     ```

4. **Setup Ardupilot with Gazebo:**
   - Run the following commands:
     ```bash
     # Check Gazebo
     gz sim -v4 -r shapes.sdf
     sudo apt update
     sudo apt install libgz-sim7-dev rapidjson-dev -y
     cd ~
     git clone https://github.com/ArduPilot/ardupilot_gazebo
     cd ardupilot_gazebo
     mkdir build && cd build
     cmake .. -DCMAKE_BUILD_TYPE=RelWithDebInfo
     make -j4
     export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/ardupilot_gazebo/build:$GZ_SIM_SYSTEM_PLUGIN_PATH
     export GZ_SIM_RESOURCE_PATH=$HOME/ardupilot_gazebo/models:$HOME/ardupilot_gazebo/worlds:$GZ_SIM_RESOURCE_PATH
     echo 'export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}' >> ~/.bashrc
     echo 'export GZ_SIM_RESOURCE_PATH=$HOME/ardupilot_gazebo/models:$HOME/ardupilot_gazebo/worlds:${GZ_SIM_RESOURCE_PATH}' >> ~/.bashrc
     . ~/.profile
     ```

5. **Test Gazebo SITL Plugin:**
   - Run the following commands:
     ```bash
     # In one console
     gz sim -v4 -r iris_runway.sdf
     # In another console (CTRL+T Opens a new console tab)
     sim_vehicle.py -v ArduCopter -f gazebo-iris --model JSON --map --console
     # Arm and Take off
     # STABILIZE> mode guided
     # GUIDED> arm throttle
     # GUIDED> takeoff 5
     ```



This software includes components from the ArduPilot project, which are licensed under the GNU General Public License version 3 (GPLv3). You can find the source code for ArduPilot at https://github.com/ArduPilot/ardupilot. The full text of the GPLv3 license can be found at https://www.gnu.org/licenses/gpl-3.0.html.
