#!/bin/bash
function get_ws_dir() {
    SCRIPT_DIR=`dirname $0`
    cd $SCRIPT_DIR/../..
    echo `pwd`
}

ws_dir="`get_ws_dir`"

#xterm -hold -e "cd $ws_dir; pwd" &

# 1 launch turtlebot
xterm -e "cd $ws_dir; pwd; source /opt/ros/kinetic/setup.bash; source devel/setup.bash; roslaunch turtlebot_gazebo turtlebot_world.launch" &
sleep 5

# 2 launch amcl demo
xterm -e "cd $ws_dir; pwd; source /opt/ros/kinetic/setup.bash; source devel/setup.bash; roslaunch turtlebot_gazebo amcl_demo.launch" &
sleep 5

# 3 launch rviz
xterm -e "cd $ws_dir; pwd; source /opt/ros/kinetic/setup.bash; source devel/setup.bash; roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 5

# 4 run pick up objects
xterm -e "cd $ws_dir; pwd; source /opt/ros/kinetic/setup.bash; source devel/setup.bash; rosrun pick_objects pick_objects"

