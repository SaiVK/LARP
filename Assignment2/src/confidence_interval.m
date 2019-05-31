function [ count_fall ] = confidence_interval( critical_value,mean_s,S,N )
confidence_interval=zeros(2,10000);count_fall=0;
for i=1:10000
    confidence_interval(1,i)=mean_s(1,i)-( critical_value * ( std ( S(:,i) / sqrt(N) ) ) );
    confidence_interval(2,i)=mean_s(1,i)+( critical_value * ( std ( S(:,i) / sqrt(N) ) ) );
    if(confidence_interval(1,i) <= 10 && 10 <= confidence_interval(2,i))
        count_fall=count_fall+1;
 
    else
        ;
    end
end
count_fall=10000 - count_fall;

end

