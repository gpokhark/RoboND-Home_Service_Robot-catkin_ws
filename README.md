# Getting Started
To view this project, you must have Gazebo and ROS installed on Linux.

With Gazebo and ROS installed follow the steps -
```
git clone git@github.com:gpokhark/RoboND-Home_Service_Robot-catkin_ws.git
cd RoboND-Home_Service_Robot-catkin_ws/src
catkin_init_workspace
cd ..
rosdep install -i my_robot
rosdep install -i slam_gmapping
rosdep install -i turtlebot
rosdep install -i turtlebot_interactions 
rosdep install -i turtlebot_simulator
catkin_make
source devel/setup.bash
```
# Project Overview - Home Service Robot
