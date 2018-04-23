close all;
clear all;
clc;

%%%%%%%%%%%%%%%%%%%%
% Example of antithetic variates.
% Estimating the integral of fun(x) = exp(-x) from 0 to 1.
% x is uniformly sampled from u ~ U(0, 1).
% We could introduce another function of fun(1-x).
% As a result E(fun(x) + fun(1-x)) is an un-biased estimate of E(fun(x)).


fun = @(x) exp(-x);

EVALUATION = 1E5;
NUM_SIM = 50;

u = rand(EVALUATION, NUM_SIM);

x = fun(u);
y = fun(1-u);

Mu_exp_origin = sum(x) / EVALUATION;

Mu_exp_anti = (sum(x) + sum(y)) / 2 / EVALUATION;

% Original method
% One simulation result
disp(Mu_exp_origin(1));
% Variance of all the {NUM_SIM} simulations
disp(var(Mu_exp_origin));

% Difference estimator method
% One simulation result
disp(Mu_exp_anti(1));
% Variance of all the {NUM_SIM} simulations
disp(var(Mu_exp_anti));