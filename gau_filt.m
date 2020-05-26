function gau_filt(img, name)
%% DOCUMENTATION

% FUNCTION TAKES AN IMAGE AND A FILE NAME.
% FILTERS IMAGE THROUGH GAUSSIAN FILTERS WITH STANDARD DEVIATIONS 1.7, 3,
% AND 5 AND PLOTS

% MADE BY: DANIEL SHERMAN
% JANUARY 20, 2020

%% START OF CODE

%define and apply gaussian filters of standard deviation 1.7, 3, and 5
img_G17 = imfilter(double(img), fspecial('gaussian', [11 11], 1.7), 'replicate');
img_G3 = imfilter(double(img), fspecial('gaussian', [11 11], 3), 'replicate');
img_G5 = imfilter(double(img), fspecial('gaussian', [11 11], 5), 'replicate');

%plot filtered images
figure()
subplot(1,3,1)
imshow(uint8(img_G17))
title('Gaussian Filter 11x11, \sigma = 1.7')
ylabel(strcat(['Filtered' ' ' name]))
subplot(1,3,2)
imshow(uint8(img_G3))
title('Gaussian Filter 11x11, \sigma = 3')
subplot(1,3,3)
imshow(uint8(img_G5))
title('Gaussian Filter 11x11, \sigma = 5')
