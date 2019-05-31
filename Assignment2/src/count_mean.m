function [ count_mean_s ] = count_mean( mean_s,a,b)
%------------counting the number of means close to the interval of
%[9.99,10.01]-------------------%
count_mean_s=0;
for i=1:10000
    if mean_s(i)>=a && mean_s(i)<=b
    count_mean_s=count_mean_s+1;
    else
    ;
    end
end
end

