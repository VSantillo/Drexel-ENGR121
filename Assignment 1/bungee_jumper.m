% Vincent Santillo
% ENGR121 - Assignment 1
% Problem 2 - Bungee Jumper
% ----- ----- %

% --- Boilerplate Reset --- %
clear all,clc,close all

% --- Variable Declaration --- %
v = 40;          % Velocity of 40 m/s
t = 5;           % Time at 5s
drag = 0.35;     % Drag Coefficient of 0.35 kg/m
grav = 9.81;     % Gravity Constant of 9.81 m/s^2
m = [50:200];    % Vector Mass from 50 kg to 200 kg

% --- Main Function --- %
fm = sqrt((grav .* m) / drag) .* tanh(t * sqrt((grav * drag)./ m )) - v; % Finding the f(m) as given in the problem
[root, I] = min(abs(fm)); % Finding the value of m that makes f(m) closest to 0. 

% --- Graphical Output --- %
figure
plot(m,fm)  % Plot all values of the computed x and y values for each step of Theta
title('f(m) versus m')
xlabel('m')
ylabel('f(m)')

fprintf('The root of the function is found by finding the value of m when f(m) is closest to 0.\nThe root is m = %d, f(m) = %.3f\n',I+50, root) % Output statement, 50 must be added to I to find the correct m value that represents the root