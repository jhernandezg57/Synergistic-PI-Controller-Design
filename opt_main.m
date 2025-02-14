% Author Julián-Alejandro Hernández-Gallardo 2025.
% If you are utilizing this algorithm, please cite one of my publications.
% https://scholar.google.com/citations?user=ru2cJxEAAAAJ&hl=es&oi=ao

%% Clear workspace
clc
clearvars;
close all;

%% System Definition
% Regions
nw=5000; % frequency step
figure(1);
regions % Program to find stability region
hold on

% Number of regions and width calculation
nr = 1;
ancho = (max(Kkp) - min(Kkp))/nr; % rectangle base

%% Genetic Algorithm (GA) Optimization
opt_ga

%% fmincon Optimization
% OPTFMIN (Ensure this section is correctly implemented)
opt_fmincon
