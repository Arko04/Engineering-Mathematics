%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Problem 1 %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
close all
clear all


%% Part 1

x = -2*pi/(pi/8):1/100:2*pi/(pi/8);
y = (cos(pi*x/4) ./ sin(pi*x/4)) .* sin(pi*x/8);
figure(1)
plot(x,y,'LineWidth',1);
xlabel('Horizontal Axis')
ylabel('Vertical Axis')
xlim([-2*pi/(pi/8),2*pi/(pi/8)])
ylim([-10,10])
title('Problem 1 - Part 1')
grid on

%% Part 2

x = -10:1/100:10;
y = sign(1./(x.^2));
figure(2)
plot(x,y,'LineWidth',1);
xlabel('Horizontal Axis')
ylabel('Vertical Axis')
xlim([-10,10])
ylim([0,2])
title('Problem 1 - Part 2')
grid on

%% Part 3

syms x
y = piecewise(x<-3, -1, -3<x<0, 0, 0<x<3, 3*x, x>3, exp(-2.5*x));
figure(3)
fplot(x,y,'LineWidth',1);
xlabel('Horizontal Axis')
ylabel('Vertical Axis')
xlim([-5,5])
ylim([-5,10])
title('Problem 1 - Part 3')
grid on

