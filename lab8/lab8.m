%emech lab 8 landing gear drop
clc; clear all; close all;

sheets = ["data_167.xlsx" "data_600.xlsx" "data_750.xlsx"  "data_907.xlsx"  "data_300.xlsx"   "data_450.xlsx"];

Cpizzo = 10;
for i=1:length(sheets)
    data{i}=xlsread(sheets(i)); 
    t{i} = 1/1000:(1/1000):length(data{i})/1000;
    accel{i} = ((data{i}(:,2)-mean(data{i}(:,2)))*1000)/( Cpizzo*9.8);
    angle{i} = ((data{i}(:,3)/5)-.5)*(90/.8);
    %angle{i} = ((data{i}(:,3)/5)) + (45/.5);
    %deltaX = sqrt(3^2 + 4.45^2 - 2*3*4.45*cosd(angle))
    
    
    figure(i)
    subplot(211);
    plot(t{i},accel{i},'k-');
    ylabel('Acceleration [m^2/s]');
    grid on
    subplot(212);
    plot(t{i},angle{i},'k-');
    ylabel('angle [degrees]');
    grid on

end





