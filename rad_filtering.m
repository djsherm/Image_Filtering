function rad_filtering(img, filter, size, name)
%% DOCUMENTATION

% FUNCTION TAKES AN IMAGE, SIZE OF ORIGINAL IMAGE AND THE RADIALLY SYMMETRIC FILTER TO BE USED.
% FILTERS IMAGE THROUGH RADIALLY SYMMETRIC FILTER AND PLOTS

% MADE BY: DANIEL SHERMAN
% JANUARY 20, 2020

%% START OF CODE

img_fft = double(fftshift(fft2(img))); %take and shift fft appropriately

img_filter_fft = img_fft.*double(filter); %filter in frequency domain with the appropriately sized filter
img_filter_spat = ifft2(fftshift(img_filter_fft)); %go back to spatial domain

%plot filtered images
figure()
subplot(1,2,1)
imshow(abs(img_filter_spat), [])
ylabel(name)
title('Filtered Image')
subplot(1,2,2)
imshow(real(img_filter_fft))
title('Frequency Domain')
xlabel(strcat(size,'*Size Radius Filter'))