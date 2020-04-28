#!/bin/bash

# source the ros helper file
source ./ros_helpers.sh

# 1 launch turtlebot
roslaunch_xterm turtlebot_gazebo turtlebot_world.launch world_file:=$world_file
sleep 5

# 2 run gmapping
rosrun_xterm gmapping slam_gmapping
sleep 5

# 3 launch rviz
roslaunch_xterm turtlebot_rviz_launchers view_navigation.launch
sleep 5

# 4 launch keyboard teleop
roslaunch_xterm turtlebot_teleop keyboard_teleop.launch
