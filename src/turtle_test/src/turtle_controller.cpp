#include "ros/ros.h"
#include "sensor_msgs/Joy.h"
#include "geometry_msgs/Twist.h"
#include "stdio.h"

float g_turn = 0;
float g_direction = 0;

void callback_joy(const sensor_msgs::Joy msg){
	printf("Turn %f   Direction %f\n", g_turn, g_direction);
	g_turn = msg.axes[4];
	g_direction = msg.axes[5];	
}

int main(int argc, char **argv) { 
	ros::init(argc, argv, "turtle_controller"); 
	ros::NodeHandle nh; 
	ros::Publisher publisher = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000); 
	ros::Subscriber sub = nh.subscribe("joy", 1000, callback_joy);
	ros::Rate loop_rate(20);
	geometry_msgs::Twist msg;
	while (ros::ok()) { 
		printf("send %f %f\n", g_turn, g_direction);
		msg.linear.x = g_direction;
		msg.angular.z = g_turn;
		publisher.publish(msg); 
		loop_rate.sleep(); 
		ros::spinOnce();
	} 
	return 0; 
}

