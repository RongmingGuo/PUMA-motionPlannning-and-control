function [q] = IK_puma(p_e_0)
    % ANGLES IN RADIANS!
    la = 1;
    lb = 0.2;
    lc = 1;
    % Initialize output
    q = zeros(3, 4);
    rx = p_e_0(1);
    ry = p_e_0(2);
    rz = p_e_0(3);
    % Find theta1
    theta1_1 = atan2(-rx, ry) + atan2(sqrt(rx^2 + ry^2 - lb^2), lb);
    theta1_2 = atan2(-rx, ry) - atan2(sqrt(rx^2 + ry^2 - lb^2), lb);
    % Find theta3
    k = sqrt((rx^2 + ry^2 + rz^2 - lb^2 + la^2 + lc^2)^2 - 2 * ((rx^2 + ry^2 + rz^2 - lb^2)^2 + la^4 + lc^4));
    theta3_1 = atan2(k, rx^2 + ry^2 + rz^2 - lb^2 - la^2 - lc^2);
    theta3_2 = -atan2(k, rx^2 + ry^2 + rz^2 - lb^2 - la^2 - lc^2);
    % output
    q(:, 1) = [theta1_1; atan2(-rz * (lc * cos(theta3_1) + la) - (cos(theta1_1) * rx + sin(theta1_1) * ry) * lc * sin(theta3_1), (cos(theta1_1) * rx + sin(theta1_1) * ry) * (lc * cos(theta3_1) + la) - rz * lc * sin(theta3_1)); theta3_1];
    q(:, 2) = [theta1_1; atan2(-rz * (lc * cos(theta3_2) + la) - (cos(theta1_1) * rx + sin(theta1_1) * ry) * lc * sin(theta3_2), (cos(theta1_1) * rx + sin(theta1_1) * ry) * (lc * cos(theta3_2) + la) - rz * lc * sin(theta3_2)); theta3_2];
    q(:, 3) = [theta1_2; atan2(-rz * (lc * cos(theta3_1) + la) - (cos(theta1_2) * rx + sin(theta1_2) * ry) * lc * sin(theta3_1), (cos(theta1_2) * rx + sin(theta1_2) * ry) * (lc * cos(theta3_1) + la) - rz * lc * sin(theta3_1)); theta3_1];
    q(:, 4) = [theta1_2; atan2(-rz * (lc * cos(theta3_2) + la) - (cos(theta1_2) * rx + sin(theta1_2) * ry) * lc * sin(theta3_2), (cos(theta1_2) * rx + sin(theta1_2) * ry) * (lc * cos(theta3_2) + la) - rz * lc * sin(theta3_2)); theta3_2];
end