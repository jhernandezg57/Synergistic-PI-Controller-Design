%% Stability Regions
w0 = 1.15; % Initial frequency
wf = 2.29; % Final frequency

% Set LaTeX formatting for axis labels and dashed grid lines
set(groot, 'defaultAxesTickLabelInterpreter', 'latex');
set(gca, 'GridLineStyle', '--');
hold on

% Frequency vector
w = w0:(w0 - 0.0001)/(nw - 1):wf;

% Curve equations
kp = ((26 - 6 .* w.^2) .* cos(2 .* w) + w .* (-9 + 4 .* w.^2) .* sin(2 .* w)) ./ (4 .* (4 + w.^2));
ki = (w .* (w .* (-9 + 4 .* w.^2) .* cos(2 .* w) + 2 .* (-13 + 3 .* w.^2) .* sin(2 .* w))) ./ (4 .* (4 + w.^2));

% Find self-intersection points
[kp0, ki0, I] = selfintersect(kp, ki);

% Extract stability region bounds
Kkp = kp(I(1):I(2));
Kki = ki(I(1):I(2));
Ww = w(I(1):I(2));

% Plot settings
box on
hold on

% Plot stability region boundary
plot(Kkp, Kki, '-k', 'LineWidth', 1.5, 'HandleVisibility', 'off');

% Optional: Fill the stable region with a transparent yellow shade
% fill(Kkp, Kki, 'y', 'FaceAlpha', 0.1, 'HandleVisibility', 'off');

% Axis labels
xlabel('$k_p(\omega)$', 'Interpreter', 'Latex', 'FontSize', 14);
ylabel('$k_i(\omega)$', 'Interpreter', 'Latex', 'FontSize', 14);