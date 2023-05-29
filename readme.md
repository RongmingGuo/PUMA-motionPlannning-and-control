## Control and Trajectory Planning for a Simplified PUMA Robot
### Introduction
Programmable Universal Machine for Assembly (PUMA) is a class of industrial robotic arms (serial manipulators) initially developed by Victor Scheinman at Unimation in the 70s. PUMA Robots are highly agile, accurate, and versatile, making them ideal for a wide range of industrial applications, particularly in manufacturing and assembly processes.

In this project, we develop a trajectory planning and control framework for a simplified PUMA Robot consisting of 3 Degrees of Freedom (DOF). 

A simulated environment is auto-generated using Simscape Multibody incorporating full system dynamics.

Various concepts are explored, including but not limited to:
1. Forward and Inverse Kinematics
2. Forward and Inverse Dynamics
3. Trajectory Planning
4. Joint-space Controller Design

### Execution
1. To begin with, run "modelInit.m". This will setup the path, initialize the Simulink model, and open up the Simulink model for you. It is also within this step that you run trajectory planning of the robot for the upcoming tasks. Two planners (moplan1() and moplan2())are provided for Circle Drawing / Arbitrary Drawing functionalities. Commenting out the one you don't want and run the other one in the last cell of this script.

2. Click the green run button ON SIMULINK to run the simulation. Access simulation output plots by clicking into the Scope objects within the Simulink Block Diagram.

### Exploration
Feel free to explore my implemenetation of trajectory palnner and controller! I implemented a Joint-space PD Controller with Gravity Compensation for the specific task. The PD gains are manually tuned.

## Acknoledgement and References
This project is dedicated to Georgia Tech ME 6407 Robotics taught by Professor Jun Ueda during the Spring of 2023. The backbone of this project is designed and provided by the institution. For the detailed course description, refer to https://www.me.gatech.edu/me-6407-robotics