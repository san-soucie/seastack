#!/bin/bash
set -e
cp /home/ros/.host.ssh/* /home/ros/.ssh
cat <<EOF >> /home/ros/.ssh/config
Host *
  StrictHostKeyChecking no
EOF
vcs import --input src/ros.repos src
sudo apt-get update
rosdep update
rosdep install --from-paths src --ignore-src -y

# Patch build configuration for cv_bridge
# https://github.com/ros-perception/vision_opencv/issues/345
# sudo sed -i 's,/usr/include/opencv",/usr/include/opencv4",g' \
#     /opt/ros/noetic/share/cv_bridge/cmake/cv_bridgeConfig.cmake
sudo sed -i 's,/usr/include/opencv ",/usr/include/opencv4 ",g' \
    /opt/ros/noetic/share/cv_bridge/cmake/cv_bridgeConfig.cmake
  

echo "if [ -f /workspaces/ros_ws/devel/setup.bash ]; then source /workspaces/ros_ws/devel/setup.bash; fi" >> /home/ros/.bashrc
