# Getting Started
To view this project, you must have Gazebo and ROS installed on Linux.

With Gazebo and ROS installed follow the steps -
```
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash
sudo apt-get install git-lfs
git lfs install
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

## Official ROS packages
Import these packages now and install them in the src directory of your catkin workspace. Be sure to clone the full GitHub directory and not just the package itself.

1. [gmapping](http://wiki.ros.org/gmapping): With the gmapping_demo.launch file, you can easily perform SLAM and build a map of the environment with a robot equipped with laser range finder sensors or RGB-D cameras.
2. [turtlebot_teleop](http://wiki.ros.org/turtlebot_teleop): With the keyboard_teleop.launch file, you can manually control a robot using keyboard commands.
3. [turtlebot_rviz_launchers](http://wiki.ros.org/turtlebot_rviz_launchers): With the view_navigation.launch file, you can load a  preconfigured rviz workspace. You’ll save a lot of time by launching this file, because it will automatically load the robot model, trajectories, and map for you.
4. [turtlebot_gazebo](http://wiki.ros.org/turtlebot_gazebo): With the turtlebot_world.launch you can deploy a turtlebot in a gazebo environment by linking the world file to it.

## Scripts to run the project
1. SLAM Testing
```
cd RoboND-Home_Service_Robot-catkin_ws/src/scripts/
./test_slam.sh
```
2. Localization and Navigation Testing
```
cd RoboND-Home_Service_Robot-catkin_ws/src/scripts/
./test_navigation.sh
```
3. Navigation Goal Node
```
cd RoboND-Home_Service_Robot-catkin_ws/src/scripts/
./pick_objects.sh
```
4. Virtual Objects
```
cd RoboND-Home_Service_Robot-catkin_ws/src/scripts/
./add_markers.sh
```
5. Home Service Robot
```
cd RoboND-Home_Service_Robot-catkin_ws/src/scripts/
./home_service.sh
```