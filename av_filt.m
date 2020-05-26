function av_filt(img, name)
%% DOCUMENTATION

% FUNCTION TAKES AN IMAGE AND A FILE NAME.
% FILTERS IMAGE THROUGH AVERAGE FILTERS OF SIZE 3X3, 5X5, AND 9X9 AND PLOTS

% MADE BY: DANIEL SHERMAN
% JANUARY 20, 2020

%% START OF CODE

%define and apply average filters of size 3x3, 5x5, and 9x9
img_3 = imfilter(double(img), fspecial('average', [3 3]), 'replicate');
img_5 = imfilter(double(img), fspecial('average', [5 5]), 'replicate');
img_9 = imfilter(double(img), fspecial('average', [9 9]), 'replicate');

%plot filtered images
figure()
subplot(1,3,1)
imshow(uint8(img_3))
title('Average Filter 3x3 Mask')
ylabel(strcat(['Filtered' ' ' name]))
subplot(1,3,2)
imshow(uint8(img_5))
title('Average Filter 5x5 Mask')
subplot(1,3,3)
imshow(uint8(img_9))
title('Average Filter 9x9 Mask')
