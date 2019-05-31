% % Problem 2a : Plot Intensity histograms of 10 given images
 close all;
for i=1:10
    filename = ['s12/face' num2str(i) '.pgm'];
    A = imread(filename);
    figure;
    imshow(A);
    figure;
    imhist(A);
    title(['Histogram for Face' num2str(i) '.pgm']);
    ylabel('Number of pixels');
end