%% Problem 4b: Given a PMF, draw random samples of size N = 1000,10000 from it.
clear all;
clc;
S_1000 = zeros(1000,10000);
for j=1:10000
    x = discretesample(1000);
    S_1000(:,j:j) = x(:,1:1);
end
mean_s1000 = zeros(1,10000);
for i=1:10000
    mean_s1000(1,i) = sum(S_1000(:,i:i))/1000;
end
figure(1),hist(mean_s1000,1000);
title('Histogram plot of means with N = 1000');

S_10000 = zeros(10000,10000);
for j=1:10000
    x = discretesample(10000);
    S_10000(:,j:j) = x(:,1:1);
end
mean_s10000 = zeros(1,10000);
for i=1:10000
    mean_s10000(1,i) = sum(S_10000(:,i:i))/10000;
end
figure(2),hist(mean_s10000,1000);
title('Histogram plot of means with N = 10000');
