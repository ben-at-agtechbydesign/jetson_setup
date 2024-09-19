#!/bin/bash

# Update and install necessary packages
sudo apt-get update
sudo apt-get install -y git cmake libpython3-dev python3-numpy

# Clone the jetson-inference repository
git clone --recursive --depth=1 https://github.com/dusty-nv/jetson-inference

# Navigate to the directory and build
cd jetson-inference
mkdir build
cd build
cmake ../
make -j$(nproc)

# Install and configure the system
sudo make install
sudo ldconfig

# Print success message
echo "jetson-inference successfully installed!"
