#!/bin/bash
xterm -e "source /opt/ros/kinetic/setup.bash; gazebo" &
sleep 5
xterm -e "source /opt/ros/kinetic/setup.bash; roscore" &
sleep 5
xterm -e "source /opt/ros/kinetic/setup.bash; rosrun rviz rviz"
