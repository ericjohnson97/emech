% LABORATORY 6
% code to process the measured acceleration signal
% plots time history 
% integrates to find displacement
% calculates power spectrum

% sirohi 102214
clc; clear all; close all;

fs = 1000;              % sampling frequency, Hz
T = 4.1;                  % duration of signal, s

dt = 1/fs;              % calculate time interval, s
tvec = [0:dt:T-dt]';    % generate time vector

%conversion factors 
Cmems = 300;
Cpizzo = 10;

files = ["lab6/pizzo/trial_1.xlsx", "lab6/pizzo/trial_2.xlsx", "lab6/pizzo/trial_3.xlsx", "lab6/pizzo/trial_4.xlsx", "lab6/pizzo/trial.xlsx"];
for i=1:length(files)
    data = xlsread(files(i));

    tipAccel = ((data(:,3)-mean(data(:,3)))*1000)/( Cpizzo*9.8);
    tipVel = zeros(length(tvec),1);
    tipDisp = zeros(length(tvec),1);

    tipVel = cumtrapz(tipAccel)*dt;
    tipDisp = cumtrapz(tipVel)*dt;

    figure(i*2 -1)
    subplot(311);
    plot(tvec,tipAccel,'k-');
    ylabel('Tip Acceleration Y, m^2/s');
    grid on
    subplot(312);
    plot(tvec,tipVel,'k-');
    ylabel('Tip Velocity Y, m/s');
    grid on
    subplot(313);
    plot(tvec,tipDisp,'k-');
    ylabel('Tip Displacement Y, m');
    xlabel('Time, s');
    grid on

    dftAccel = fft(tipAccel);                               % calculate FFT
    dftAccel = dftAccel(1:length(tvec)/2+1);                % throw away negative frequencies
    %magAccel = 1/length(tvec)*abs(dftAccel)*2;               % only magnitude at each frequency
    psdAccel = (1/(fs*length(tvec))) * abs(dftAccel).^2;    % calculate power and scale it
    psdAccel(2:end-1) = 2*psdAccel(2:end-1);                % multiply by two to account for negative frequencies
    fvec(i,:) = 0:fs/length(tvec):fs/2;                          % generate properly scaled frequency vector

    figure(i*2)
    subplot(211)
    plot(tvec,tipAccel,'k-');
    ylabel('Tip Acceleration, m^2/s');
    xlabel('Time, s');
    grid on
    subplot(212);
    plot(fvec(i, :),10*log10(psdAccel))
    %plot(fvec,magAccel, 'b-');
    grid on
    xlabel('Frequency, Hz')
    ylabel('Power/Frequency (dB/Hz)')
    
  
end



files = ["lab6/mems/trial_1.xlsx", "lab6/mems/trial_2.xlsx", "lab6/mems/trial_3.xlsx", "lab6/mems/trial_4.xlsx", "lab6/mems/trial.xlsx"];
for i=1:length(files)
    data = xlsread(files(i));

    tipAccel = ((data(:,1)-mean(data(:,1)))*1000)/( Cmems*9.8);
    tipVel = zeros(length(tvec),1);
    tipDisp = zeros(length(tvec),1);

    tipVel = cumtrapz(tipAccel)*dt;
    tipDisp = cumtrapz(tipVel)*dt;

    figure(i*4 -3 + 10)
    subplot(311);
    plot(tvec,tipAccel,'k-');
    ylabel('Tip Acceleration Y, m^2/s');
    grid on
    subplot(312);
    plot(tvec,tipVel,'k-');
    ylabel('Tip Velocity Y, m/s');
    grid on
    subplot(313);
    plot(tvec,tipDisp,'k-');
    ylabel('Tip Displacement Y, m');
    xlabel('Time, s');
    grid on

    dftAccel = fft(tipAccel);                               % calculate FFT
    dftAccel = dftAccel(1:length(tvec)/2+1);                % throw away negative frequencies
    %magAccel = 1/length(tvec)*abs(dftAccel)*2;               % only magnitude at each frequency
    psdAccel = (1/(fs*length(tvec))) * abs(dftAccel).^2;    % calculate power and scale it
    psdAccel(2:end-1) = 2*psdAccel(2:end-1);                % multiply by two to account for negative frequencies
    fvec = 0:fs/length(tvec):fs/2;                          % generate properly scaled frequency vector


    
    figure(i*4 -2 + 10)
    subplot(211)
    plot(tvec,tipAccel,'k-');
    ylabel('Tip Acceleration Y, m^2/s');
    xlabel('Time, s');
    grid on
    subplot(212);
    plot(fvec,10*log10(psdAccel))
    %plot(fvec,magAccel, 'b-');
    grid on
    xlabel('Frequency, Hz')
    ylabel('Power/Frequency Y (dB/Hz)')
    
    
    tipAccel = ((data(:,2)-mean(data(:,2)))*1000)/( Cmems*9.8);
    tipVel = zeros(length(tvec),1);
    tipDisp = zeros(length(tvec),1);

    tipVel = cumtrapz(tipAccel)*dt;
    tipDisp = cumtrapz(tipVel)*dt;

    figure(i*4 -1 +10)
    subplot(311);
    plot(tvec,tipAccel,'k-');
    ylabel('Tip Acceleration X, m^2/s');
    grid on
    subplot(312);
    plot(tvec,tipVel,'k-');
    ylabel('Tip Velocity X, m/s');
    grid on
    subplot(313);
    plot(tvec,tipDisp,'k-');
    ylabel('Tip Displacement X, m');
    xlabel('Time, s');
    grid on

    dftAccel = fft(tipAccel);                               % calculate FFT
    dftAccel = dftAccel(1:length(tvec)/2+1);                % throw away negative frequencies
    %magAccel = 1/length(tvec)*abs(dftAccel)*2;               % only magnitude at each frequency
    psdAccel = (1/(fs*length(tvec))) * abs(dftAccel).^2;    % calculate power and scale it
    psdAccel(2:end-1) = 2*psdAccel(2:end-1);                % multiply by two to account for negative frequencies
    fvec = 0:fs/length(tvec):fs/2;                          % generate properly scaled frequency vector

    figure(i*4 + 10)
    subplot(211)
    plot(tvec,tipAccel,'k-');
    ylabel('Tip Acceleration X, m^2/s');
    xlabel('Time, s');
    grid on
    subplot(212);
    plot(fvec,10*log10(psdAccel))
    %plot(fvec,magAccel, 'b-');
    grid on
    xlabel('Frequency, Hz')
    ylabel('Power/Frequency X (dB/Hz)')
    
end
data = xlsread(files(3));

tipAccel = ((data(:,1)-mean(data(:,1)))*1000)/( Cmems*9.8);
tipVel = zeros(length(tvec),1);
tipDisp = zeros(length(tvec),1);

tipVel = cumtrapz(tipAccel)*dt;
tipDisp = cumtrapz(tipVel)*dt;

dftAccel3 = fft(tipAccel(1:3000));                               % calculate FFT
dftAccel3 = dftAccel3(1:3000/2+1);                % throw away negative frequencies
psdAccel3 = (1/(fs*3000)) * abs(dftAccel3).^2;    % calculate power and scale it
psdAccel3(2:end-1) = 2*psdAccel3(2:end-1);                % multiply by two to account for negative frequencies
fvec3 = 0:fs/3000:fs/2;                          % generate properly scaled frequency vector

figure(31)
subplot(211)
plot(tvec(1:3000),tipAccel(1:3000),'k-');
ylabel('Tip Acceleration, m^2/s');
xlabel('Time, s');
grid on
subplot(212);
plot(fvec3,10*log10(psdAccel3))
%plot(fvec,magAccel, 'b-');
grid on
xlabel('Frequency, Hz')
ylabel('Power/Frequency (dB/Hz)')


dftAccel1 = fft(tipAccel(3000:4000));                               % calculate FFT
dftAccel1 = dftAccel1(1:1000/2+1);                % throw away negative frequencies
psdAccel1 = (1/(fs*1000)) * abs(dftAccel1).^2; % calculate power and scale it
size(psdAccel1)
psdAccel1(2:end-1) = 2*psdAccel1(2:end-1);                % multiply by two to account for negative frequencies
fvec1 = 0:fs/1000:fs/2;                          % generate properly scaled frequency vector

figure(32)
subplot(211)
plot(tvec(3000:4000),tipAccel(3000:4000),'k-');
ylabel('Tip Acceleration, m^2/s');
xlabel('Time, s');
grid on
subplot(212);
plot(fvec1,10*log10(psdAccel1))
%plot(fvec,magAccel, 'b-');
grid on
xlabel('Frequency, Hz')
ylabel('Power/Frequency (dB/Hz)')

