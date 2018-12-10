cmake_minimum_required(VERSION 2.8.3) 
project(turtle_test) 
find_package(catkin REQUIRED COMPONENTS 
	roscpp 
	std_msgs 
)
catkin_package( 
	LIBRARIES  
	CATKIN_DEPENDS 
	roscpp 
	std_msgs
) 
include_directories( ${catkin_INCLUDE_DIRS} include )
add_executable(turtle_controller src/turtle_controller.cpp) 
add_dependencies(turtle_controller ${${PROJECT_NAME}_EXPORTED_TARGETS} ${catkin_EXPORTED_TARGETS}) 
target_link_libraries(turtle_controller ${catkin_LIBRARIES}) 

