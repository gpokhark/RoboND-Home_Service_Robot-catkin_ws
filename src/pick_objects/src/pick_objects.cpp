#include <ros/ros.h>
#include <string.h>
#include <move_base_msgs/MoveBaseAction.h>
#include <actionlib/client/simple_action_client.h>
// Define a client to send goal requests to the move_base server through a SimpleActionClient
typedef actionlib::SimpleActionClient<move_base_msgs::MoveBaseAction> MoveBaseClient;


std::string goal_name;
int iLoc=0;
bool completed;
const int total_num_goals = 10;
const int loop_num_goals = 10;
std::string goal_names[total_num_goals] = {
         "pickup","dropoff"
        ,"second pickup","second dropoff"
        ,"third pickup","third dropoff"
        ,"fourth pickup","fourth dropoff"
        ,"fifth pickup","fifth dropoff"
};
//loop the same  path twice... we can even loop endlessly
float goal_locations[total_num_goals][3] = {
        {-7.69351482391, 8.74377632141, 1.0},
        {-7.53121423721, -7.15490913391, 1.0},

        {2.28988242149, -7.44545555115, 1.0},
        {10.0007648468, -1.20438063145, 1.0},

        {4.64369773865, -3.53033542633, 1.0},
        {0.758845567703, 7.47144031525, 1.0},

        {7.99535894394, 3.71894645691, 0.999587059073},
        {-3.80013895035, 11.2739114761, 0.299583},

        {-8.03609848022, 7.91320180893, 0.227342},
        {0.475704044104, 0.777441263199, 0.869835738702}

};


int main(int argc, char** argv){
  // Initialize the pick_objects node
  ros::init(argc, argv, "pick_objects");

  //tell the action client that we want to spin a thread by default
  MoveBaseClient ac("move_base", true);

  // Wait 5 sec for move_base action server to come up
  while(!ac.waitForServer(ros::Duration(5.0))){
    ROS_INFO("Waiting for the move_base action server to come up");
  }
  ROS_INFO("starting move_base for five pickup and dropoff");
  int iLocation = 0;
  while(!completed) {
    move_base_msgs::MoveBaseGoal goal;

    // set up the frame parameters
    goal.target_pose.header.frame_id = "map";
    goal.target_pose.header.stamp = ros::Time::now();

    // Define a position and orientation for the robot to reach
    goal.target_pose.pose.position.x = goal_locations[iLoc][0];
    goal.target_pose.pose.position.y = goal_locations[iLoc][1];
    goal.target_pose.pose.orientation.w =goal_locations[iLoc][2];

    // Send the goal position and orientation for the robot to reach
    std::string goal_name = goal_names[iLoc];//iLocation %2 ==0 ? " dropoff " : " pickup ";
    ROS_INFO("Sending the %s goal, x %f,  y %f \n", goal_name.c_str(), goal_locations[iLoc][0], goal_locations[iLoc][1]);

    ac.sendGoal(goal);

    // Wait an infinite time for the results
    ac.waitForResult();
    if(ac.getState() == actionlib::SimpleClientGoalState::SUCCEEDED) {
      ROS_INFO("Hooray, the base moved to the %s goal location! , x %f,  y %f \n", goal_name.c_str(), goal_locations[iLoc][0], goal_locations[iLoc][1]);
        iLoc = iLoc+1;
        //set we are at end of the loops
        completed = iLoc >= loop_num_goals;
    } else {
      ROS_WARN("The base failed to move to the second goal for some reason");
      return 1;
    }
  }

  ros::spin();
  return 0;
}
