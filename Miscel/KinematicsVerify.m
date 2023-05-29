%% Gravity Vectory Verification
for theta3 = [1 : -0.01: -1]
    q = [0; -pi/4; theta3]; 
    figure(1);
    title('PUMA Robot Kinematics Verification');
    plot_puma(q);
    hold off
    grid on
    axis equal
    xlim([-2, 2])
    ylim([-2, 2])
    zlim([-2, 2])
    xlabel('x(m)');
    ylabel('y(m)');
    zlabel('z(m)');
end
%% Question 1 - 1 Motion Planning Verify
motionData = moPlan1(10, 5); % [t, xed, yed, zed]
[m, n] = size(motionData);
% Inverse Kinematics to get joint configurations 
qData = zeros(m, n);
qData(:, 1) = motionData(:, 1);
choice = 1;
for i = 1 : m
   p0e = motionData(i, 2:4);
   q = IK_puma(p0e);
   qData(i, 2:4) = q(:, choice)';
end
% Plot
for i = 1 : m
    figure(1);
    title('PUMA Robot Kinematics Verification');
    plot_puma(qData(i, 2:4));
    hold off
    grid on
    axis equal
    xlim([-2, 2])
    ylim([-2, 2])
    zlim([-2, 2])
    xlabel('x(m)');
    ylabel('y(m)');
    zlabel('z(m)');
end
