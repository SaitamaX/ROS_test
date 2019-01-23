// Snaker.cpp : 定义控制台应用程序的入口点。
//

//#include "stdafx.h"
//#include "Snaker.h"
#include "stdio.h"
#include "ros/ros.h"
#include "sensor_msgs/Joy.h"
#include <iostream>
#include <cstdlib>
#include <ctime>
#include <pthread.h>
//#include <windows.h>
#include <deque>
#define zone_size 40

// msg.axes[0]、msg.axes[1]和msg.buttons[0]是手柄定义的方向键左右、上下和X键位

using namespace std;
char body[zone_size][zone_size];//游戏过程界面
enum direction {_up_ = 0, _down_ = 1, _left_ = 2, _right_ = 3};//分别用于当前前进方向的判断
deque<pair<int, int> > snake;//存放组成蛇身体的每个点的位置
size_t level;//设置难度
int x, y;//食物的二维坐标
//用来接收手柄按键信息的变量
float button_left_right = 0.0, button_up_down = 0.0;
int button_start = 0;


void srand_food() {//生成新食物的位置
	bool flag_srand = true;
	x = rand() % (zone_size - 1) + 0;
	y = rand() % (zone_size - 1) + 0;
	while (flag_srand) {//检验生成随机数的二维坐标
		flag_srand = false;
		for (size_t i = 0; i < snake.size(); i++) {
			if (snake[i].first == x && snake[i].second == y) {
				x = rand() % (zone_size - 1) + 0;
				y = rand() % (zone_size - 1) + 0;
				flag_srand = true;
			}
		}
	}
	body[x][y] = '*';
}

void show_result() {
	for (size_t i = 0; i < zone_size; ++i) {
		for (size_t j = 0; j < zone_size; ++j)
			if (j != zone_size - 1)
				cout << body[i][j] << ' ';
			else
				cout << body[i][j];
		//cout << '#';
		cout << endl;
	}
	//cout << " # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # # #";
}

 void callback_joy(const sensor_msgs::Joy msg){//订阅手柄的按键信息
	 button_left_right = msg.axes[0];//控制左右的按钮
	 button_up_down = msg.axes[1];//控制上下的按钮
	 button_start = msg.buttons[0];//控制游戏开始的按钮
	 cout <<"left_right"<< button_left_right <<"  up_down"<< button_up_down <<"  start" << button_start << endl;
 }

void climb(int s_direction) {
	int x_offset, y_offset;
	switch (s_direction) {
	case _up_:
		x_offset = snake[snake.size() - 1].first - 1;
		y_offset = snake[snake.size() - 1].second; 
		break;
	case _down_:
		x_offset = snake[snake.size() - 1].first + 1;
		y_offset = snake[snake.size() - 1].second;
		break;
	case _left_:
		x_offset = snake[snake.size() - 1].first;
		y_offset = snake[snake.size() - 1].second - 1;
		break;
	case _right_:
		x_offset = snake[snake.size() - 1].first;
		y_offset = snake[snake.size() - 1].second + 1;
	}
	if (body[x_offset][y_offset] == '*') {//向该方向刚好吃到食物
		body[x_offset][y_offset] = '@';
		snake.push_back(make_pair(x_offset, y_offset));
		body[snake[0].first][snake[0].second] = ' ';
		snake.pop_front();
		snake.push_back(make_pair(x_offset, y_offset));
		body[snake[snake.size() - 1].first][snake[snake.size() - 1].second] = '@';
		srand_food();
	}
	else {//继续向该方向走
		snake.push_back(make_pair(x_offset, y_offset));
		body[snake[0].first][snake[0].second] = ' ';
		snake.pop_front();
		body[snake[snake.size() - 1].first][snake[snake.size() - 1].second] = '@';
	}
}

void *ros_subscriber(void *arg){
	ros::NodeHandle nh;
	ros::Subscriber sub = nh.subscribe("joy", 1000, callback_joy);
	ros::Rate loop_rate(20);
	ros::spin();
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "turtle_snaker");
	pthread_t tid;
	pthread_create(&tid, NULL, ros_subscriber, NULL);
	bool flag = true;//主程序循环标志
	int ch1 = 0;//ch获取按键信息,ch1用于难度判断
	/************************************程序主界面************************************/
	while (flag) {
		cout << "*****************************************Snaker*******************************************" << endl;
		cout << endl;
		cout << endl;
		cout << "------------------------------------------------------------------------------------------" << endl;
		cout << "                            手柄方向键上下选择难度，手柄X按钮开始游戏"  << endl;
		cout << "------------------------------------------------------------------------------------------" << endl;
		cout << endl;
		if (ch1 == 0) {
			cout << "                   >> 1.简单                           简单的难度:" << endl;
			cout << endl;
			cout << "                      2.困难                              蛇的移动速度较慢。" << endl;
			cout << endl;
			cout << "                      3.冷酷" << endl;
		}
		else if (ch1 == 1) {
			cout << "                      1.简单                           困难的难度:" << endl;
			cout << endl;
			cout << "                   >> 2.困难                              蛇的移动速度较快。" << endl;
			cout << endl;
			cout << "                      3.冷酷" << endl;
		}
		else {
			cout << "                      1.简单                           冷酷的难度:" << endl;
			cout << endl;
			cout << "                      2.困难                              你的眼镜可能会感到不适" << endl;
			cout << endl;
			cout << "                   >> 3.冷酷" << endl;
		}
		cout << endl;
		cout << endl;
		cout << "------------------------------------------------------------------------------------------" << endl;
		cout << "                                    制作人: 相博文        " << endl;
		cout << "------------------------------------------------------------------------------------------" << endl;
		while(true){
			if (button_up_down != 0.0 || button_start != 0) {
				if (button_up_down == -1.0){
					if (ch1 != 2)
						ch1++;
					else
						ch1 = 0;
					while(true){//松开按键后算一次完整的按下
						if(button_up_down == 0.0)
							break;
					}
					break;
				}
				else if (button_up_down == 1.0){
					if (ch1 != 0)
						ch1--;
					else
						ch1 = 2;
					while(true){
						if(button_up_down == 0.0)
							break;
					}
					break;
				}
				else if (button_start == 1) {
					flag = false;
					if (ch1 == 0)
						level = 100000;
					else if (ch1 == 1)
						level = 50000;
					else if (ch1 == 2)
						level = 1000;
					while(true){
						if(button_start == 0)
							break;
					}
					break;
				}
			}
		}
		system("clear");
	}
	flag = true;//重置标志器
	//程序初始状态
	for (size_t i = 0; i < zone_size; ++i)
		for (size_t j = 0; j < zone_size; ++j)
				body[i][j] = ' ';
	for (size_t i = 0; i < 4; ++i)
		body[0][i] = '@';
	show_result();
	/**********************************************************************************/
	/************************************游戏主过程************************************/
	for (size_t i = 0; i < 4; i++)//初始化蛇身长度为4
		snake.push_back(make_pair(0, i));
	int curr_dirct = _right_;//蛇的初始化方向
	srand((unsigned)time(NULL));
	srand_food();
	while (flag) {
		if (button_up_down == 1.0) {//上方向键
			// while(true){//松开按键后算一次完整的按下
			// 	if(button_up_down == 0.0)
			// 		break;
			// }
			if (snake[snake.size() - 1].first == 0)//上方已到边界
				flag = false;
			else if (curr_dirct == _down_)//蛇无法向当前方向的相反方向走，按键无效
				climb(_down_);
			else if (body[snake[snake.size() - 1].first - 1][snake[snake.size() - 1].second] == '@')//向上行走会咬到自己
				flag = false;
			else {//向上走
				curr_dirct = _up_;
				climb(_up_);
			}
		}
		else if (button_left_right == 1.0) {//左方向键
			// while(true){//松开按键后算一次完整的按下
			// 	if(button_left_right == 0.0)
			// 		break;
			// }
			if (snake[snake.size() - 1].second == 0)
				flag = false;
			else if (curr_dirct == _right_)//蛇无法向当前方向的相反方向走，按键无效
				climb(_right_); 
			else if (body[snake[snake.size() - 1].first][snake[snake.size() - 1].second - 1] == '@')
				flag = false;
			else {
				curr_dirct = _left_;
				climb(_left_);
			}
		}
		else if (button_up_down == -1.0) {//下方向键
			// while(true){//松开按键后算一次完整的按下
			// 	if(button_up_down == 0.0)
			// 		break;
			// }
			if (snake[snake.size() - 1].first == zone_size - 1)
				flag = false;
			else if (curr_dirct == _up_)//蛇无法向当前方向的相反方向走，按键无效
				climb(_up_); 
			else if (body[snake[snake.size() - 1].first + 1][snake[snake.size() - 1].second] == '@')
				flag = false;
			else {
				curr_dirct = _down_;
				climb(_down_);
			}
		}
		else if (button_left_right == -1.0) {//右方向键
			// while(true){//松开按键后算一次完整的按下
			// 	if(button_left_right == 0.0)
			// 		break;
			// }
			if (snake[snake.size() - 1].second == zone_size - 1)
				flag = false;
			else if (curr_dirct == _left_)//蛇无法向当前方向的相反方向走，按键无效
				climb(_left_); 
			else if (body[snake[snake.size() - 1].first][snake[snake.size() - 1].second + 1] == '@')
				flag = false;
			else {
				curr_dirct = _right_;
				climb(_right_);
			}
		}
		else if (curr_dirct == _right_) {//未按下按键，继续向当前方向爬行
                        if (snake[snake.size() - 1].second == zone_size - 1 )//到边界
                                flag = false;
                        else if (body[snake[snake.size() - 1].first][snake[snake.size() - 1].second + 1] == '@')//未到但咬到自己
                                flag = false;
                        else //向该方向继续前进
                                climb(_right_);
                }
                else if (curr_dirct == _up_) {//继续向上行走
                        if (snake[snake.size() - 1].first == 0 )
                                flag = false;
                        else if (body[snake[snake.size() - 1].first - 1][snake[snake.size() - 1].second] == '@')
                                flag = false;
                        else
                                climb(_up_);
                }
                else if (curr_dirct == _down_) {//继续向下行走
                        if (snake[snake.size() - 1].first == zone_size - 1)
                                flag = false;
                        else if (body[snake[snake.size() - 1].first + 1][snake[snake.size() - 1].second] == '@')
                                flag = false;
                        else
                                climb(_down_);
                }
                else if (curr_dirct == _left_) {//继续向左行走
                        if (snake[snake.size() - 1].second == 0)
                                flag = false;
                        else if (body[snake[snake.size() - 1].first][snake[snake.size() - 1].second - 1] == '@')
                                flag = false;
                        else
                                climb(_left_);
                }
                system("clear");
                show_result();
                usleep(level);
        }
        cout << endl;
        //system("pause");
}
