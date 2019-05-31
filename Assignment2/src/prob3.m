%% Problem 3 : Drawing samples from Poisson distribtion
%% Number of samples : N = 10,100,1000,10000

clear;clc;
S_10 = zeros(10,10000);
for i=1:10000
    S = PoissonSamp(10,10);
    S_10(:,i:i) = S(:,1:1);
end
mean_s10 = zeros(1,10000);
for i=1:10000
    mean_s10(1,i) = sum(S_10(:,i:i))/10;
end
figure(1),hist(mean_s10,1000);
title('Histogram plot of means with N = 10 n lambda = 10');

S_100 = zeros(100,10000);
for i=1:10000
    S = PoissonSamp(10,100);
    S_100(:,i:i) = S(:,1:1);
end
mean_s100 = zeros(1,10000);
for i=1:10000
    mean_s100(1,i) = sum(S_100(:,i:i))/100;
end
figure(2),hist(mean_s100,1000);
title('Histogram plot of means with N = 100 n lambda = 10');

S_1000 = zeros(1000,10000);
for i=1:10000
    S = PoissonSamp(10,1000);
    S_1000(:,i:i) = S(:,1:1);
end
mean_s1000 = zeros(1,10000);
for i=1:10000
    mean_s1000(1,i) = sum(S_1000(:,i:i))/1000;
end
figure(3),hist(mean_s1000,1000);
title('Histogram plot of means with N = 1000 n lambda = 10');

S_10000 = zeros(10000,10000);
for i=1:10000
    S = PoissonSamp(10,10000);
    S_10000(:,i:i) = S(:,1:1);
end
mean_s10000 = zeros(1,10000);
for i=1:10000
    mean_s10000(1,i) = sum(S_10000(:,i:i))/10000;
end
figure(4),hist(mean_s10000,1000);
title('Histogram plot of means with N = 10000 n lambda = 10');

%-----------------sample mean in the interval ---------------%
a=9.99; b=10.01;
c=9.9; d=10.1;
disp('How many times was the sample mean in the interval [9:99; 10:01]');
disp(count_mean( mean_s10,a,b));
disp(count_mean( mean_s100,a,b));
disp(count_mean( mean_s1000,a,b));
disp(count_mean( mean_s10000,a,b));

disp('How many times was the sample mean in the interval [9:9; 10:1]');
disp(count_mean( mean_s10,c,d));
disp(count_mean( mean_s100,c,d));
disp(count_mean( mean_s1000,c,d));
disp(count_mean( mean_s10000,c,d));

%----------calculating confidence interval-----------%
critical_value=[2.262,1.984,1.962,1.960];
disp('How many times did the true mean fall outside the confidence interval?');
disp(confidence_interval( critical_value(1),mean_s10,S_10,10 ));
disp(confidence_interval( critical_value(2),mean_s100,S_100,100 ));
disp(confidence_interval( critical_value(3),mean_s1000,S_1000,1000 ));
disp(confidence_interval( critical_value(4),mean_s10000,S_10000,10000 ));

%% -------------accuracy--------------------%
accuracy=0;
for j=1:100:7000
    S_10 = zeros(j,10000);
    for i=1:10000
        S = PoissonSamp(10,j);
        S_10(:,i:i) = S(:,1:1);
    end
    mean_s10 = zeros(1,10000);
    for i=1:10000
        mean_s10(1,i) = sum(S_10(:,i:i))/j;
    end
    accuracy = 1.96*(std(mean_s10(1,:))/sqrt(j));
    disp(accuracy);
end
