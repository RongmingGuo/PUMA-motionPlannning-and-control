%% Path Initialization
clear;
clc;
close all;
addpath(genpath('toolBox'));
open_system('HW05_simplified_PUMA_controls_simscape.slx');
%% Simplified PUMA Simscape Model Initialization
la=1;
lb=0.2;
lc=1;

%external force and moment at the tip (world frame)
external_force=[0;0;-1];
external_moment=[0;1;0];

%initial angles
theta1=45/360*2*pi;
theta2=-60/360*2*pi;
theta3=120/360*2*pi;

%joint torque setting
tau1=0;
tau2=0;
tau3=0;

%xedyedzedsim=[0.0 0.5 0.2 0.0];
tf= 10; % simulation end time

%% Motion Planning (Circle Drawing / Character Drawing)
% xedyedzedsim = moPlan1(tf, 9.8); % For Circle Drawing
xedyedzedsim = moPlan2(tf, 9.8, 200); % For Arbitrary / Character Drawing (3rd input specifies the number of discrete points you can use to define the drawing)