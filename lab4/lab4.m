%emech lab 4 
clc; clear all; close all;

[~,sheet_name]=xlsfinfo('measurmentsL4.xlsx');
for k=1:numel(sheet_name)
  data{k}=xlsread('measurmentsL4.xlsx',sheet_name{k});
end

%DCDT calibration 
%y = 0.1984*vin+0.5493

%calculate deflection experimentally 
y = 0.1984*(data{3}(:,4)-data{3}(:,3));

%calculate deflection theoretically 
A = mean(y);
L = 233;
%A = mean(y)/mean(cos((2*pi*data{3}(:,2))/L));
yt = -A*(cos((2*pi*data{3}(:,2))/L)-1);

delta = L - L - A*cos((2*pi*L)/L) %mm

E = 68.9e9;
b = 25.52/1000;
h = 3.22/1000;
I = (b*h^3)/12;
Pc = (4*(pi^2)*E*I)/((L/1000)^2)

figure(1)
scatter(data{3}(:,2), y)
hold on
plot(data{3}(:,2), yt)


