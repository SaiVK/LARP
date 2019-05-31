%% Function to generate samples from a distribution whose PMF is given by F = 3/(pi*pi*k*k)
function S = discretesample(n)
S = zeros(n,1); % Stores the n samples from the given distribution
for i=1:n
    k = 1;
    low = 0;
    high = 3/(pi*pi);
    u = rand;
    % For value of u > 0.5, we know it's a positive value with probability
    % u - 0.5
    if u > 0.5
        u = u - 0.5;
        for j=2:100 %CDF till f(100)
            if ((u>low) && (u<=high))
                S(i) = k;
            end
            k = k+1;
            low = high;
            high = high + 3/(pi*pi*j*j);
        end
    else
        for j=2:100
            if ((u>low) && (u<=high))
                S(i) = -k;
            end
            k = k+1;
            low = high;
            high = high + 3/(pi*pi*j*j);
        end
    end
end
end

