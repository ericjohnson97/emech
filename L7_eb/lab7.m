%E mech lab 7 
clc; clear all; close all;

data = xlsread('Data/aft_sparr_eb.xlsx');

force = data(:,3).*21843 - 77.4;
accel = data(:,2);
freq = data(:,1);

Cmems = 300;
tipAccel = (data(:,2)-mean(data(:,2)))/( Cmems*9.8);

figure(1)
subplot(311);
plot(freq,tipAccel,'k-');
ylabel('Tip Acceleration, m^2/s');
grid on
subplot(312);
plot(freq,force,'k-');
ylabel('Force [N]');
grid on
subplot(313);
% plot(tvec,tipDisp,'k-');
% ylabel('Tip Displacement Y, m');
% xlabel('Time, s');
grid on

