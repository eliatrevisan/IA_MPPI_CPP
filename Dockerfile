# MIT License
#
# Copyright (c) 2022 Ignacio Vizzo
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
FROM ignaciovizzo/ros_in_docker:noetic
LABEL maintainer="Ignacio Vizzo <ignaciovizzo@gmail.com>"

# Add any additional dependencies here:
RUN apt-get update && apt-get install --no-install-recommends -y \
    rsync \
    && rm -rf /var/lib/apt/lists/*

# Install additional ROS packages
RUN apt-get update && apt-get install ros-$ROS_DISTRO-grid-map -y
RUN apt-get update && apt-get install ros-$ROS_DISTRO-turtle-tf2 ros-$ROS_DISTRO-tf2-tools ros-$ROS_DISTRO-tf -y

# Install SDL2 and SDL2-image
RUN apt-get install libsdl-dev -y
RUN apt-get install libsdl-image1.2-dev -y

# Install tf2_sensor_msgs
RUN apt install ros-$ROS_DISTRO-tf2-sensor-msgs

# Install move_base_msgs
RUN apt-get install ros-$ROS_DISTRO-move-base-msgs

# Mount libraries folder from host to container
COPY libraries /home/$USER_NAME/libraries 

# Compile and install the Savitzky-Golay filter library
WORKDIR /home/$USER_NAME/libraries/gram_savitzky_golay 
RUN mkdir build
WORKDIR /home/$USER_NAME/libraries/gram_savitzky_golay/build
RUN cmake -DCMAKE_BUILD_TYPE=Release ..
RUN make
RUN sudo make install

# $USER_NAME Inherited from .base/Dockerfile
WORKDIR /home/$USER_NAME/ros_ws
CMD ["zsh"]
