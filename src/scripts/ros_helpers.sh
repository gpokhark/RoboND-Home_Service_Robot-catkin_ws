#!/bin/bash
function get_ws_dir() {
    SCRIPT_DIR=`dirname $0`
    cd $SCRIPT_DIR/../..
    echo `pwd`
}

ws_dir="`get_ws_dir`"
my_robot_dir=$ws_dir/src/my_robot
world_file=$my_robot_dir/worlds/office_pnd.world
map_file=$my_robot_dir/maps/office_pnd.yaml

function roslaunch_xterm(){
    cd_dir="cd $ws_dir"
    source_setup="source devel/setup.bash"
    ros_launch="roslaunch ${1} ${2} ${3} ${4} ${5}"
    xterm -e "$cd_dir; $source_setup; $ros_launch" &
}

function rosrun_xterm(){
    cd_dir="cd $ws_dir"
    source_setup="source devel/setup.bash"
    ros_run="rosrun ${1} ${2} ${3} ${4} ${5} ${9} ${7}"
    xterm -e "$cd_dir; $source_setup; $ros_run" &
}