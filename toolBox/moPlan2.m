function [motionData] = moPlan2(tf, tEnd, nClicks)
    % t is the total amount of time desired to accomplish the task
    N = nClicks; % Precision of the trajectory
    figure(1);
    grid on;
    [xed, yed] = ginput(N);
    plot(xed,yed);
    % Motion Data
    t = linspace(0, tEnd, N);
    motionData = [t', xed, yed, zeros(N, 1)];
    trest = linspace(tEnd, tf, N);
    motionData = [motionData; [trest', ones(N, 2) .* 0.2, zeros(N, 1)]];
end