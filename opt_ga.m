%% Genetic Algorithm (GA) Optimization
tol = 1e-15; % Tolerance
nGen = 20; % Number of generations
pSize = 200; % Population size

options_GA = optimoptions('ga', 'ConstraintTolerance', tol, 'Generations', nGen, ...
    'PopulationSize', pSize, 'PlotFcns', @gaplotbestf);

rng(1, 'twister') % Ensures reproducibility

% Preallocate memory for results
Kpga = zeros(1, nr);
Kiga = zeros(1, nr);
Jga = zeros(1, nr);

%% GA Optimization Process
tic
for i = 1:nr
    % Subregions
    figure(1)
    hold on
    vertices  % Program to find vertices of rectangle
    
    kpl = min(Kkp) + (i - 1) * ancho;  % Lower bound for Kp
    kpu = min(Kkp) + i * ancho;        % Upper bound for Kp
    kil = min(Kki_cruce);              % Lower bound for Ki
    kiu = max(Kki_cruce);              % Upper bound for Ki

    % Plot the rectangular region
    plot(Kkp_rect, Kki_rect, '-', 'Color', [0.5 0.5 0.5]);
    hold on

    % Genetic Algorithm execution
    [K, J] = ga(@(gains) responsePI(gains), 2, [], [], [], [], ...
                [kpl; kil], [kpu; kiu], [], options_GA);
    
    % Store results
    Jga(i) = J;
    Kpga(i) = K(1);
    Kiga(i) = K(2);

    % Plot GA results
    plot(Kpga(i), Kiga(i), 'r*') % Genetic algorithm result
    hold off

    clc % Clears the command window
end

% Find the best result
best = min(Jga, [], 'all');
it1 = find(Jga == best);
Jminga = Jga(it1);
Kpminga = Kpga(it1);
Kiminga = Kiga(it1);

tf_ga = toc; % Store execution time