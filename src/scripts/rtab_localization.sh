#!/bin/bash
function get_ws_dir() {
    SCRIPT_DIR=`dirname $0`
    cd $SCRIPT_DIR/../..
    echo `pwd`
}

ws_dir="`get_ws_dir`"

#xterm -hold -e "cd $ws_dir; pwd" &

# 1 launch my robot
xterm -e "cd $ws_dir; pwd; source /opt/ros/kinetic/setup.bash; source devel/setup.bash; roslaunch my_robot world.launch" &
sleep 5

# 2 run teleop keyboard
xterm -e "cd $ws_dir; pwd; source /opt/ros/kinetic/setup.bash; source devel/setup.bash; rosrun teleop_twist_keyboard teleop_twist_keyboard.py" &
sleep 5

# 3 launch rviz
xterm -e "cd $ws_dir; pwd; source /opt/ros/kinetic/setup.bash; source devel/setup.bash; roslaunch my_robot mapping.launch"
sleep 10
