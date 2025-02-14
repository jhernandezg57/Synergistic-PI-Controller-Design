function varargout = responsePI(gains)
    s = tf('s');

    % Transfer function of the system
    P = ((s - 2) * exp(-2 * s)) / (s^2 - (1/2) * s + 13/4); 

    % Time step and simulation time vector
    ts = 0.1; 
    tsim = 0:ts:100; 

    % PI Controller
    C = gains(1) + gains(2) / s;

    % Closed-loop transfer function
    T = feedback(P * C, 1); 

    % Step response
    [y, t] = step(T, tsim); 
    unitstep = t>=0;

    % Step response characteristics
    data = stepinfo(y, t, 1, 'SettlingTimeThreshold', 0.01); 
    tss = data.SettlingTime;  % Settling time

    % Error calculation
    N = length(tsim); 
    e = 1 - y(1:N); 

    % Control effort calculation
    Tu = feedback(C, P); 
    [u, t] = step(Tu, tsim); 
    du = gradient(u, ts);  

    % Performance indices using Simpson’s rule
    CES = simps(tsim, u.^2);        % Control energy squared
    CVS = simps(tsim, du.^2);       % Control variation squared
    ITSE = simps(tsim, tsim' .* (e).^2); % Integral of time-weighted squared error
    ITAE = simps(tsim, tsim' .* abs(e)); % Integral of time-weighted absolute error

    % Objective function
    J = tss^2;
    % Alternative cost function
    % J = ITAE + ITSE + CES + CVS;
    
    % Return the requested output
    if abs(nargout) == 1
        varargout = {J};
    else
        varargout = {J, t, y, unitstep};
    end
end
