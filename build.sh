#!/bin/bash
set -e
catkin config --install
catkin build --force-cmake --pre-clean
