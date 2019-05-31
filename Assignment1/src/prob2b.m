% Problem 2b : Convert top 50 eigen basis into images and plot the same
A = importdata('EigenVectors.mat');
[r,c] = size(A);
for i=1:50
    subplot(5,10,i);
    image = reshape(A(:,i),92,92);
    imshow(image,[]);
end