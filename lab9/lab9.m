% emech lab 9: Digital Image Correlation 
clc; clear all; close all;



aluminum = xlsread('aluminum.xlsx');
poly = xlsread('poly.xlsx');

figure(1)
plot(aluminum(:,2), aluminum(:,3))
hold on 
%title('Force vs Displacement Aluminum')
xlabel('displacement [mm]')
ylabel('force [N]')

figure(2)
plot(poly(:,2), poly(:,3))
hold on 
%title('Force vs Displacement Polycarbonate')
xlabel('displacement [mm]')
ylabel('force [N]')

