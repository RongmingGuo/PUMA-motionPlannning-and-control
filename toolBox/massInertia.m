%% Base Cylinder
R1 = 0.08; % m
L1 = 0.5; % m
m1 = pi * (R1)^2 * L1 * 1000;
I1 = 1/2 * m1 * R1^2;
%% Joint 2
R2 = 0.1;
L2 = 0.1;
m2 = pi * R2^2 * L2 * 1000;
I2 = 1/2 * m2 * R2^2;
%% Joint 3 (rod)
l3 = 1;
w3 = l3/12;
t3 = l3/12;
m3 = (l3 * w3 * t3) * 1000;
I3 = 1/12 * m3 * (l3^2 + w3^2);
%% Joint 4 (cylinder)
R4 = 0.2/3;
L4 = 0.2;
m4 = pi * R4^2 * L4 * 1000;
I4 = 1/2 * m4 * R4^2;
%% Joint 5 (rod 2)
l5 = 1;
w5 = l3/12;
t5 = l3/12;
m5 = (l5 * w5 * t5) * 1000;
I5 = 1/12 * m5 * (l5^2 + w5^2);
%% Joint 6 (Sphere, end effector)
R6 = 0.1;
m6 = 3/4 * pi * R6^3 * 1000;
I6 = 2/5 * m6 * R6^2;

