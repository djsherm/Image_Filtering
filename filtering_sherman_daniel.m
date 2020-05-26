%% ENGG 4660: MEDICAL IMAGE PROCESSING
% LAB 1: FILTERING
% DANIEL SHERMAN
% 0954083
% JANUARY 15, 2020

%% CLEAN UP

close all
clear all
clc

%% START OF CODE

checker = imread('checker.png'); %load 'checker.png'
[r_checker c_checker] = size(checker); %grab size of checker phantom

mri = imread('mri.jpg'); %load 'mri.jpg'
[r_mri c_mri] = size(mri); %grab size of mri image

figure() %display checker.png
imshow(checker)
title('checker.png')

figure() %display mri.jpg
imshow(mri)
title('mri.jpg')

%% FILTER CHECKER AND MRI IMAGE THROUGH AVERAGE FILTERS OF SIZE 3X3, 5X5, AND 9X9

av_filt(checker, 'checker.png')
av_filt(mri, 'mri.jpg')

%% FILTER CHECKER AND MRI IMAGE THROUGH GAUSSIAN FILTERS WITH STANDARD DEVIATIONS 1.7, 3, AND 5

gau_filt(checker, 'checker.png')
gau_filt(mri, 'mri.jpg')

%% DEFINE RADIALLY SYMMETRIC IDEAL FREQUENCY-DOMAIN LOW PASS FILTERS

bit = 8; %define bit size of images used

%create radially symmetric filters of appropriate sizes to use with
%checker.png
rad_c01 = radfilt(checker, 0.1*c_checker, bit);
rad_c003 = radfilt(checker, 0.03*c_checker, bit);
rad_c005 = radfilt(checker, 0.05*c_checker, bit);

%display radially symmetric filters for use with checker.png
figure()
subplot(1,3,1)
imshow(rad_c01, [])
ylabel('Radially Symmetric Checker Filters')
title('Radius = 12.8')
subplot(1,3,2)
imshow(rad_c003, [])
title('Radius = 3.84')
subplot(1,3,3)
imshow(rad_c005, [])
title('Radius = 6.4')

%define radially symmetric filters to be used with mri.jpg
rad_m01 = radfilt(mri, 0.1*c_mri, bit);
rad_m003 = radfilt(mri, 0.03*c_mri, bit);
rad_m005 = radfilt(mri, 0.05*c_mri, bit);

%display radially symmetric filters to be used with mri.jpg
figure()
subplot(1,3,1)
imshow(rad_m01, [])
ylabel('Radially Symmetric MRI Filters')
title('Radius = 12.8')
subplot(1,3,2)
imshow(rad_m003, [])
title('Radius = 3.84')
subplot(1,3,3)
imshow(rad_m005, [])
title('Radius = 6.4')

%% FILTER RADIALLY SYMMETRIC - CHECKER

%filter checker.png with radially symmetric filter radius 0.1*size
rad_filtering(checker, rad_c01, '0.1', 'checker.png')

%filter checker.png with radially symmetric filter radius 0.05*size
rad_filtering(checker, rad_c005, '0.05', 'checker.png')

%filter checker.png with radially symmetric filter radius 0.03*size
rad_filtering(checker, rad_c003, '0.03', 'checker.png')

%% FILTER RADIALLY SYMMETRIC - MRI

%filter mri.jpg with radially symmetric filter radius 0.1*size
rad_filtering(mri, rad_m01, '0.1', 'mri.jpg')

%filter mri.jpg with radially symmetric filter radius 0.05*size
rad_filtering(mri, rad_m005, '0.05', 'mri.jpg')

%filter mri.jpg with radially symmetric filter radius 0.03*size
rad_filtering(mri, rad_m003, '0.03', 'mri.jpg')

%% CORRUPT IMAGES WITH GAUSSIAN NOISE

checker_100 = double(checker) + sqrt(100).*randn(size(checker)); %corrupt checker.png with 100 variance noise
checker_900 = double(checker) + sqrt(900).*randn(size(checker)); %corrupt checker.png with 900 variance noise

mri_100 = double(mri) + sqrt(100).*randn(size(mri)); %corrupt mri.jpg with 100 variance noise
mri_900 = double(mri) + sqrt(900).*randn(size(mri)); %corrupt mri.jpg with 900 variance noise

%display noisy test images
figure()
subplot(4,2,1)
imshow(checker_100, [])
title('0 Mean \sigma^2 = 100 Random Noise')
xlabel('Corrupted checker.png')
subplot(4,2,2)
imshow(checker_900, [])
title('0 Mean \sigma^2 = 900 Random Noise')
xlabel('Corrupted checker.png')
subplot(4,2,3)
imshow(mri_100,[])
title('0 Mean \sigma^2 = 100 Random Noise')
xlabel('Corrupted mri.jpg')
subplot(4,2,4)
imshow(mri_900, [])
title('0 Mean \sigma^2 = 900 Random Noise')
xlabel('Corrupted mri.jpg')

%% FILTER NOISY IMAGES

%average filter noisy trest images with variance 100
av_filt(uint8(checker_100), 'Noisy checker.png with \sigma^2 = 100')
av_filt(uint8(mri_100), 'Noisy checker.png with \sigma^2 = 100')

%average filter noisy trest images with variance 900
av_filt(uint8(checker_900), 'Noisy checker.png with \sigma^2 = 900')
av_filt(uint8(mri_900), 'Noisy checker.png with \sigma^2 = 900')

%gaussian filter noisy trest images with variance 100
gau_filt(uint8(checker_100), 'Noisy checker.png with \sigma^2 = 100')
gau_filt(uint8(checker_900), 'Noisy checker.png with \sigma^2 = 900')

%gaussian filter noisy trest images with variance 900
gau_filt(uint8(mri_100), 'Noisy mri.jpg with \sigma^2 = 100')
gau_filt(uint8(mri_900), 'Noisy mri.jpg with \sigma^2 = 900')

%radially symmetric filter noisy checker.png with variance 100
rad_filtering(checker_100, rad_c01, '0.1', 'Noisy checker.jpg, \sigma^2 = 100')
rad_filtering(checker_100, rad_c005, '0.05', 'Noisy checker.jpg, \sigma^2 = 100')
rad_filtering(checker_100, rad_c003, '0.03', 'Noisy checker.jpg, \sigma^2 = 100')

%radially symmetric filter noisy mri.jpg with variance 100
rad_filtering(mri_100, rad_m01, '0.1', 'Noisy mri.png, \sigma^2 = 100')
rad_filtering(mri_100, rad_m005, '0.05', 'Noisy mri.png, \sigma^2 = 100')
rad_filtering(mri_100, rad_m003, '0.03', 'Noisy mri.png, \sigma^2 = 100')

%radially symmetric filter noisy checker.png with variance 900
rad_filtering(checker_900, rad_c01, '0.1', 'Noisy checker.jpg, \sigma^2 = 900')
rad_filtering(checker_900, rad_c005, '0.05', 'Noisy checker.jpg, \sigma^2 = 900')
rad_filtering(checker_900, rad_c003, '0.03', 'Noisy checker.jpg, \sigma^2 = 900')

%radially symmetric filter noisy mri.jpg with variance 100
rad_filtering(mri_900, rad_m01, '0.1', 'Noisy mri.png, \sigma^2 = 900')
rad_filtering(mri_900, rad_m005, '0.05', 'Noisy mri.png, \sigma^2 = 900')
rad_filtering(mri_900, rad_m003, '0.03', 'Noisy mri.png, \sigma^2 = 900')

%% CREATE CUSTOM LOW PASS FILTER

%apply the custom low pass filter and inverse to test images
inverse_filter(checker, 'checker.png')
inverse_filter(mri, 'mri.jpg')
