function [J] = J_puma(q)
    % This Function Computes The Jacobian of The Simplified PUMA ROBOT
    J = zeros(6, 3); % Determine Size
    % Robot Parameters
    la = 1;
    lb = 0.2;
    lc = 1;
    % Configuration decomposition: input q is in RADIANS!!!!!!!!
    o1 = rad2deg(q(1));
    o2 = rad2deg(q(2));
    o3 = rad2deg(q(3));
    % HTMs
    T01 = [rotz(o1), zeros(3, 1); zeros(1, 3), 1];
    T12 = [rotx(-90) * rotz(o2), zeros(3, 1); zeros(1, 3), 1];
    T23 = [rotz(o3), [la; 0; 0]; zeros(1, 3), 1];
    T34 = [eye(3), [lc; 0; lb]; zeros(1, 3), 1];
    T02 = T01 * T12;
    T03 = T02 * T23;
    T04 = T03 * T34;
    % Find useful relative positions
    p14 = T04(1:3, 4) - T01(1:3, 4);
    p24 = T04(1:3, 4) - T02(1:3, 4);
    p34 = T04(1:3, 4) - T03(1:3, 4);
    % Apply definition of jacobian to HTMs
    J(1:3, 1) = cross(T01(1:3, 3), p14);
    J(4:6, 1) = T01(1:3, 3); % Joint1
    J(1:3, 2) = cross(T02(1:3, 3), p24);
    J(4:6, 2) = T02(1:3, 3); % Joint2
    J(1:3, 3) = cross(T03(1:3, 3), p34);
    J(4:6, 3) = T03(1:3, 3); % Joint3
end