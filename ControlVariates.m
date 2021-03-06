close all;
clear all;
clc;

%%%%%%%%%%%%%%%%%%%%
% Example of control variates.
% Estimating the integral of exp(-x) from 0 to 1.
% x is uniformly sampled from u ~ U(0, 1).
% We could introduce another random variable y = u - 1/2, such that E(y) =
% 0 and var(y) = 1/2, cov(x, y) != 0. (remains to be estimated)


fun = @(x) exp(-x);

EVALUATION = 1E5;
NUM_SIM = 50;

u = rand(EVALUATION, NUM_SIM);

x = fun(u);
y = u - 1/2;

Mu_exp_origin = sum(x) / EVALUATION;

cov_mat = cov(x(:,1),y(:,1));
% Covariance/var(y): optimal beta
beta_opt = cov_mat(1,2)/var(y(:,1));
disp(beta_opt);

Mu_exp_diff = sum(x - beta_opt*y) / EVALUATION;

% Original method
% One simulation result
disp(Mu_exp_origin(1));
% Variance of all the {NUM_SIM} simulations
disp(var(Mu_exp_origin));

% Difference estimator method
% One simulation result
disp(Mu_exp_diff(1));
% Variance of all the {NUM_SIM} simulations
disp(var(Mu_exp_diff));