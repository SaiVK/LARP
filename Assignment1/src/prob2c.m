%%Problem 2c : For each image, project it onto the eigenspace

A = importdata('EigenVectors.mat');
[r,c] = size(A);
filename = input('Enter image name');
fid = fopen('error.txt','w+');
im = imread(filename);
im = im2double(im);
im1 = reshape(im,c,1);
prod = zeros(r,2);

%% Calculate dot product between image and eigenvectors
for i=1:c
    prod(i,1) = abs(dot(im1,A(:,i)));
    prod(i,2) = i;
end

% Sort the product in descending order
sorted_prod = sortrows(prod,-1);

for k=1:500:6000
    Pro_matrix = zeros(r,k);
    for i=1:k
        index = sorted_prod(i,2);
        Pro_matrix(:,i) = A(:,index);
    end
    P_matrix = Pro_matrix * inv(Pro_matrix'*Pro_matrix) * Pro_matrix';
    P_im = P_matrix * im1;
    P_im = reshape(P_im,92,92);
    figure,imshow(P_im,[]);
    title('Reconstructed image');
    err = im - P_im;
    figure,imshow(err,[]);
    title('Error image');
    error = norm(err,'fro')/norm(im,'fro');
    error = error * 100;
    disp(error);
    fprintf(fid,'%d \t %f \n',[k error]);
end
fclose(fid);

%%Plotting relative error vs top K eigenvectors
close all;
load error.txt
N = error(:,1);
err = error(:,2);
plot(N,err,'-r*');
xlabel('Number of top eigenvectors : N');ylabel('Relative error in percent');title('Fig : Number of eigenvectors vs relative error graph');
grid on

