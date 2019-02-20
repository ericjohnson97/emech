%Eric Johnson electromechanical systems lab
clc; clear all; close all;


%Part 1 
combinedData = xlsread('lab2_eb.xlsx');

%plot thermocouple
deltaTThermocouple = .000005; 
figure(1)
plot(1:length(combinedData), combinedData(:,1))
title("Temperature Over Time Thermocouple"); 
xlabel( 'Time' )
ylabel( 'Temperature [C]' )


%IC Voltage to temperature calculation
%T = a*Vout + b
b = -50; %C
a = (1/10)*(1000); %(mV/C) * (1/1000)
T = a*combinedData(:,2) + b;
deltaTIC = a*.000005;

figure(2)
plot(1:length(combinedData), T)
title("Temperature Over Time IC"); 
xlabel( 'Time' )
ylabel( 'Temperature [C]' )



%Thermistor voltage to resitance to temperature calc;
%Vout = (Rt / (Rt + R)) * Vin
%Rt = -1 + Vout/Vin


R = 1430; %ohms
Vin = 5; %V
%cold
Tc = 6.44;
Vc = 4.4449;
Rtc = R*Vc/(Vin - Vc);
Kc = log(Rtc);

%hot
Th = 42.5;
Vh = 3.6634;
Rth = R*Vh/(Vin - Vh);
Kh = log(Rth);

%ambient 
Ta = 23.15;
Va = 3.8068;
Rta = R*Va/(Vin-Va);
Ka = log(Rta);

vTemp = [ 1/Tc; 1/Th; 1/Ta];
M = [ 1, Kc, Kc^3; 1, Kh, Kh^3; 1, Ka, Ka^3];
consts = M\vTemp;

for i=1:length(combinedData)
    Rt = R*combinedData(i,3) / (Vin - combinedData(i,3));
    tThermistor(i) = 1/(consts(1) + consts(2)*log(Rt) + consts(3)*(log(Rt))^3);
end



figure(3)
plot(1:length(combinedData), tThermistor)
title("Temperature Over Time Thermistor"); 
xlabel( 'Time' )
ylabel( 'Temperature [C]' )


%plot distribution of thermocouple 
figure(4)
histfit(combinedData(:,1))

%plot distribution of IC
figure(5)
histfit(T)

%plot distribution of Thermistor
figure(6)
histfit(tThermistor)











