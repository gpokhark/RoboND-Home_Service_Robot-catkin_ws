#!/bin/bash

# source the ros helper file
source ./ros_helpers.sh

# 1 launch turtlebot
roslaunch_xterm turtlebot_gazebo turtlebot_world.launch world_file:=$world_file
sleep 5

# 2 launch amcl demo
roslaunch_xterm turtlebot_gazebo amcl_demo.launch map_file:=$map_file
sleep 5

# 3 launch rviz
roslaunch_xterm turtlebot_rviz_launchers view_navigation.launch
sleep 10

# 4 run pick up objects
rosrun_xterm pick_objects pick_objects
