# Ardupilot-SITL-Gazebo-Setup

**Summary:**
This set of instructions guides you through the installation of Ardupilot and Software-in-the-Loop (SITL) along with Gazebo simulation. It involves cloning a repository, setting up Ardupilot, configuring Gazebo, and testing the integration of Ardupilot with Gazebo.

**Requirements:**

- Ubuntu 20.04 or 22.04
- Graphics card recommended
- git `sudo apt install git`

**Instructions:**
1. Install Ardupilot & SITL:
   - Setup Ardupilot & SITL
      ```bash
      git clone https://github.com/Sky-Labs-Research/Ardupilot-SITL-Gazebo-Setup.git
      cd Ardupilot-SITL-Gazebo-Setup
      . ./setup_ardupilot.sh
      . ~/.profile 
      ```
   - Test Ardupilot SITL
      ```bash
      # In another console (CTRL+T Opens a new console tab)
      sim_vehicle.py -v ArduCopter -w --map --console
      ```
3. Install Gazebo [Garden/7 or Harmonic/8, see [here](https://gazebosim.org/docs/latest/getstarted/) for which version is compatible with your OS]:
   - Setup Gazebo
      for Garden
      ```bash
      . ./setup_gazebo_garden.sh
      ```
      for Harmonic
      ```bash
      . ./setup_gazebo_harmonic.sh
      ```
   - Test Gazebo
      ```bash
      gz sim -v4 -r shapes.sdf
      ```
4. Install Ardupilot + Gazebo:
   - Setup Ardupilot Gazebo for garden
      ```bash
      echo 'export GZ_VERSION=garden' >> ~/.bashrc
      source ~/.bashrc
      . ./setup_ardupilot_gazebo_garden.sh
      echo 'export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}' >> ~/.bashrc
      echo 'export GZ_SIM_RESOURCE_PATH=$HOME/ardupilot_gazebo/models:$HOME/ardupilot_gazebo/worlds:${GZ_SIM_RESOURCE_PATH}' >> ~/.bashrc
      source ~/.bashrc
      ```
      or harmonic
      ```bash
      echo 'export GZ_VERSION=harmonic' >> ~/.bashrc
      source ~/.bashrc
      . ./setup_ardupilot_gazebo_harmonic.sh
      echo 'export GZ_SIM_SYSTEM_PLUGIN_PATH=$HOME/ardupilot_gazebo/build:${GZ_SIM_SYSTEM_PLUGIN_PATH}' >> ~/.bashrc
      echo 'export GZ_SIM_RESOURCE_PATH=$HOME/ardupilot_gazebo/models:$HOME/ardupilot_gazebo/worlds:${GZ_SIM_RESOURCE_PATH}' >> ~/.bashrc
      source ~/.bashrc
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

**Common Issues:**

- `sim_vehicle.py: command not found` : Try to refresh your terminal profile with `. ~/.profile `
- `gz-sim Unable to find or download file` : 
gazebo is unable to find the installed worlds and models from ardupilot_gazebo. Ensure you exported the paths to bashrc and refresh your terminal environment with `source ~/.bashrc`


**References:**
- Ardupilot setup: [Building Setup for Linux](https://ardupilot.org/dev/docs/building-setup-linux.html#building-setup-linux)
- Setting up SITL on Linux: [Ardupilot Documentation](https://ardupilot.org/dev/docs/setting-up-sitl-on-linux.html#setting-up-sitl-on-linux)
- Gazebo setup: [Install Gazebo on Ubuntu](https://gazebosim.org/docs/garden/install_ubuntu)
- Ardupilot with Gazebo: [SITL with Gazebo](https://ardupilot.org/dev/docs/sitl-with-gazebo.html)

**No Script (Manual) Instructions:**

Please view each .sh script for line by line comments of each command.



This software includes components from the ArduPilot project, which are licensed under the GNU General Public License version 3 (GPLv3). You can find the source code for ArduPilot at https://github.com/ArduPilot/ardupilot. The full text of the GPLv3 license can be found at https://www.gnu.org/licenses/gpl-3.0.html.
