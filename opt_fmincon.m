% Author Julián-Alejandro Hernández-Gallardo 2025.
% If you are utilizing this algorithm, please cite one of my publications.
% https://scholar.google.com/citations?user=ru2cJxEAAAAJ&hl=es&oi=ao
%% fmincon Algorithm Optimization
algorithm = 'interior-point'; % Selected algorithm
mIter = 100; % Maximum Iterations
tol = 1e-15; % Tolerance

options_fmin = optimoptions('fmincon', 'Algorithm', algorithm, ...
    'MaxIterations', mIter, 'OptimalityTolerance', tol, 'ConstraintTolerance', tol);

% Preallocate memory for results
Kpfmin = zeros(1, nr);
Kifmin = zeros(1, nr);
Jfmin = zeros(1, nr);

tic
for i = 1:nr
    % Subregions
    figure(1)
    hold on
    vertices  % Program to find vertices of rectangle
    
    % Define bounds for Kp and Ki
    kpl = min(Kkp) + (i - 1) * ancho;  % Lower bound for Kp
    kpu = min(Kkp) + i * ancho;        % Upper bound for Kp
    kil = min(Kki_cruce);              % Lower bound for Ki
    kiu = max(Kki_cruce);              % Upper bound for Ki

    % Initial conditions (midpoint of the bounds)
    kpin = (kpl + kpu) / 2;
    kiin = (kil + kiu) / 2;

    % Plot rectangular region
    plot(Kkp_rect, Kki_rect, '-', 'Color', [0.5 0.5 0.5]);

    % fmincon Optimization
    [K, J] = fmincon(@(gains) responsePI(gains), [kpin, kiin], [], [], [], [], ...
                     [kpl; kil], [kpu; kiu], [], options_fmin);

    % Store results
    Jfmin(i) = J;
    Kpfmin(i) = K(1);
    Kifmin(i) = K(2);

    % Plot fmincon results
    figure(1)
    hold on
    plot(Kpfmin(i), Kifmin(i), 'b*') % fmin result
    hold off

    clc % Clear command window
end

% Find the best result
best = min(Jfmin, [], 'all');
it2 = find(Jfmin == best);
Jminfmin = Jfmin(it2);
Kpminfmin = Kpfmin(it2);
Kiminfmin = Kifmin(it2);

tf_fmin = toc; % Store execution time
