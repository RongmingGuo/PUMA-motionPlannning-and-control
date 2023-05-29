function [motionData] = moPlan1(tf, tEnd)
    % t is the total amount of time desired to accomplish the task
    R = 0.1;
    precision = 40;
    % Planning Position-level data
    section0 = ones(2, precision/2) .* [0.1; 0.3]; % Give the robot some time to initiate
    section1 = [0.2; 0.3] + [cos(linspace(pi, -pi, precision)); sin(linspace(pi, -pi, precision))] .* R;
    section2 = [0.41; 0.3] + [cos(linspace(pi, -pi, precision)); sin(linspace(pi, -pi, precision))] .* R;
    section3 = [0.62; 0.3] + [cos(linspace(pi, -pi, precision)); sin(linspace(pi, -pi, precision))] .* R;
    % Linear In-between
    section1_2 = [linspace(section1(1, end), section2(1, 1), precision / 2); ones(1, precision / 2) * 0.3];
    section2_3 = [linspace(section2(1, end), section3(1, 1), precision / 2);ones(1, precision / 2) * 0.3];
    section3_end = [linspace(section3(1, end), 0.2, precision / 2); linspace(section3(2, end), 0.2, precision / 2)];
    motionData = [section0, section1, section1_2, section2, section2_3, section3, section3_end]';
    [m, ~] = size(motionData);
    % Paring with time
    t = linspace(0, tEnd, m);
    motionData = [t', motionData, zeros(m, 1)];
    trest = linspace(tEnd, tf, precision);
    motionData = [motionData; [trest', ones(precision, 2) .* 0.2, zeros(precision, 1)]];
end