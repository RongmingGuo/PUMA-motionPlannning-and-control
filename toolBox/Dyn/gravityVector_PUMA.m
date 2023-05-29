function [G] = gravityVector_PUMA(q)
    g = 9.81;
    % Mass and Inertia
    m3 = 6.944444444444444; % kg
    m4 = 2.792526803190928;
    m5 = 6.944444444444444;
    m6 = 2.356194490192345;
    % Lengths
    l3 = 1;
    l5 = 1;
    % Extract joint
    o2 = q(2);
    o3 = q(3);
    % Compute
    G = zeros(3, 1);
    G(2) = -1/2 * g * (l3 * (m3 + 2 * (m4 + m5 + m6))) * cos(o2) + l5 * (m5 + 2 * m6) * cos(o2 + o3);
    G(3) = -1/2 * g * l5 * (m5 + 2 * m6) * cos(o2 + o3);
end