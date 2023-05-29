function [] = plot_puma(q)
    la = 1;
    lb = 0.2;
    lc = 1;
    % Radians to degrees to use the rot() functions
    o1 = rad2deg(q(1));
    o2 = rad2deg(q(2));
    o3 = rad2deg(q(3));
    % Homogeneous Transformation Matrices
    T01 = [rotz(o1), zeros(3, 1); zeros(1, 3), 1];
    p1j1 = [0; 0; 0; 1];
    p0j1 = T01 * p1j1; % Joint 1
    T12 = [rotx(-90) * rotz(o2), zeros(3, 1); zeros(1, 3), 1];
    p2j2 = [la; 0; 0; 1];
    T02 = T01 * T12;
    p0j2 = T02 * p2j2; % Joint 2;
    T23 = [rotz(o3), [la; 0; 0]; zeros(1, 3), 1];
    p3j3 = [0; 0; lb; 1];
    p3je = [lc; 0; lb; 1];
    T03 = T02 * T23;
    p0j3 = T03 * p3j3;
    p0je = T03 * p3je; % Joint 3 & Joint EndEffector
    % Plot
    points = [p0j1, p0j2, p0j3, p0je];
    plot3(points(1, :), points(2, :), points(3, :), '-o', 'MarkerSize', 4, 'LineWidth', 1.5);
    view(45, 45);
end