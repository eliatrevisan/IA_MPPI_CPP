#!/bin/bash

mkdir -p libraries/ && cd libraries/

git clone https://github.com/arntanguy/gram_savitzky_golay.git
cd gram_savitzky_golay
git submodule update --init --recursive
cd ../

cd ../

mkdir -p src/ && cd src/

git clone https://github.com/catkin/catkin_simple.git

git clone https://github.com/MoriKen254/timed_roslaunch.git
# git clone https://github.com/tud-amr/amr-lmpcc.git

git clone -b feature/add_vel_primitives https://github.com/stlucas44/asv_mppi.git
git clone -b fix/ubuntu20.04 https://github.com/stlucas44/roboat_social_simulator.git
git clone https://github.com/stlucas44/spline.git

git clone https://github.com/ros-planning/navigation.git
