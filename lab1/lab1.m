clc; clear all; close all;

gData = xlsread('test1.xlsx');

sampleSize = 1000:1000:100000;

for i=1:length(sampleSize)
    
   Mean(i) = sum(gData(1:sampleSize(i)))/sampleSize(i);
   stdDev(i) = std(gData(1:sampleSize(i)));
end

err = abs(zeros(1,length(sampleSize)) - Mean);
epsilon = stdDev ./ sqrt(sampleSize);

%XP 2 

blockData = xlsread('lab1_block.xlsx');
%col 1 T, Col 2 W, Col 3 L
meanT = sum(blockData(1:length(blockData), 1));
meanW = sum(blockData(1:length(blockData), 2));
meanL = sum(blockData(1:length(blockData), 3));

stdT = std(blockData(1:length(blockData), 1));
stdW = std(blockData(1:length(blockData), 2));
stdL = std(blockData(1:length(blockData), 3));

figure(1)
plot(sampleSize, Mean)
hold on
plot(sampleSize, zeros(1,length(Mean)))
title("Mean vs Sample Size"); 
xlabel( 'Number of Samples' )
ylabel( 'Mean' )
legend({'Experimental Mean','Theoretical Mean'});

figure(2)
plot(sampleSize, stdDev)
hold on
plot(sampleSize, ones(1,length(Mean)))
title("Standard Deviation vs Sample Size"); 
xlabel( 'Number of Samples' )
ylabel( 'Standard of Deviation' )
legend({'Experimental STD','Theoretical STD'});

figure(3)
plot(sampleSize, err)
hold on 
plot(sampleSize, epsilon)
title("Error vs Sample Size"); 
xlabel( 'Number of Samples' )
ylabel( 'Magnitude of error' )
legend({'Experimental Error','Theoretical Error'});

figure(4)
histfit(gData)
hold on
title("Distribution of Measurments"); 
xlabel( 'Magnitude' )
ylabel( 'Number of Samples' )
legend({'Number of Samples','Gaussian Fit'});

figure(5)
plot(1:length(gData), gData)

figure(6)
subplot(3,1,1)
histfit(blockData(1:length(blockData),1));
title('Thickness Measurments distributions')
xlabel( 'Thickness in [mm]' )
ylabel( 'Number of each Measurment' )
subplot(3,1,2)
histfit(blockData(1:length(blockData),2));
title('Width Measurments distributions')
xlabel( 'Width in [mm]' )
ylabel( 'Number of each Measurment' )
subplot(3,1,3)
histfit(blockData(1:length(blockData),3));
title('Length Measurments distributions')
xlabel( 'Length in [mm]' )
ylabel( 'Number of each Measurment' )




