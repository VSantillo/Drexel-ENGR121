% Vincent Santillo
% ENGR121 - Assignment 1
% Problem 1 - Trajectory
% ----- ----- %

% --- Boilerplate Reset --- %
clear all,clc,close all

% --- Variable Declaration --- %
theta1 = 60;              % Theta angle of 60 degrees
theta2 = 65;              % Theta angle of 65 degrees
theta3 = 70;              % Theta angle of 70 degrees
theta4 = 75;              % Theta angle of 75 degrees
time = [0:(1/128):8];       % Time in s, start at 0s, end at 8s, incrementing by 1/128s
vel = 8;                  % Velocity of 8 m/s
grav = 9.81;              % Gravity Constant of 9.81 m/s^2

% --- Main Function --- %
x1 = vel*cosd(theta1)*time;                       % x value when Theta = 60
y1 = vel*sind(theta1)*time - 0.5*grav*(time.^2);  % y value when Theta = 60

x2 = vel*cosd(theta2)*time;                       % x value when Theta = 65
y2 = vel*sind(theta2)*time - 0.5*grav*(time.^2);  % y value when Theta = 65

x3 = vel*cosd(theta3)*time;                       % x value when Theta = 70
y3 = vel*sind(theta3)*time - 0.5*grav*(time.^2);  % y value when Theta = 70

x4 = vel*cosd(theta4)*time;                       % x value when Theta = 75
y4 = vel*sind(theta4)*time - 0.5*grav*(time.^2);  % y value when Theta = 75

% --- Graphical Output --- %
figure
plot(x1,y1,x2,y2,x3,y3,x4,y4)  % Plot all values of the computed x and y values for each step of Theta
title('Projectile Motion')
xlabel('Horizontal Distance, x, (m)')
ylabel('Height, y, (m)')
legend('Angle = 60\circ', 'Angle = 65\circ', 'Angle = 70\circ', 'Angle = 75\circ', 'Location','NorthEast')
axis([0 8 0 max(y4)]) % Axis values