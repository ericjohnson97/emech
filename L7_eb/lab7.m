%E mech lab 7 
clc; clear all; close all;

data = xlsread('L7_eb/Data/aft_sparr_eb.xlsx');

force = data(:,3).*21843 - 77.4;
freq = data(:,1);
% T = (100-5)*4;
% dt = 1/100;
tvec = [0:95]'; 

Cmems = 300;
tipAccel = ((data(:,2)-mean(data(:,2)))*1000*9.8)/( Cmems);

tipDisp = abs(tipAccel)./freq.^2;



figure(1)
subplot(311);
plot(freq,tipAccel,'k-');
title('Aft Sparr Acceleration')
ylabel('Tip Acceleration, m^2/s');
grid on
subplot(312);
plot(freq,force,'k-');
title('Aft Sparr Force')
ylabel('Force [N]');
grid on
subplot(313);
plot(tvec,tipDisp,'k-');
title('Aft Sparr Displacement')
ylabel('Tip Displacement, m');
xlabel('Time, s');
grid on

data2 = xlsread('L7_eb/Data/front_sparr_eb.xlsx');

force2 = data2(:,3).*21843 - 77.4;

freq2 = data2(:,1);
% T = (100-5)*4;
% dt = 1/100;
tvec = [0:95]'; 

Cmems = 300;
tipAccel2 = ((data2(:,2)-mean(data2(:,2)))*1000*9.8)/( Cmems);

tipDisp2 = abs(tipAccel2)./freq2.^2;

figure(2)
subplot(311);
plot(freq2,tipAccel2,'k-');
title('Front Sparr Acceleration')
ylabel('Tip Acceleration, m^2/s');
grid on
subplot(312);
plot(freq2,force2,'k-');
title('Front Sparr Force')
ylabel('Force [N]');
grid on
subplot(313);
plot(tvec,tipDisp2,'k-');
title('Front Sparr Displacement')
ylabel('Tip Displacement, m');
xlabel('Time, s');
grid on
