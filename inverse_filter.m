function inverse_filter(img, name)

%% DOCUMENTATION

% FUNCTION ACCEPTS AN IMAGE AND A TITLE STRING
% CREATES A CUSTOM LOW PASS FILTER, FILTERS THE IMAGE, AND AFTER DERIVING THE INVERSE FILTER, TAKES THE INVERSE FILTER
% FUNCTION RETURNS AN IMAGE OF ALL THREE WITH TITLE

%% START OF CODE

% define custom low pass filter size 31x31
h0 = 0.8.^(abs(-30:30));
k = 1/sum(h0);
h = k.*h0;

% apply custom low pass filter in the x and y directions
img_low = imfilter(imfilter(double(img), h, 'replicate'), h.', 'replicate');

% define inverse filter
H_inv = [-0.8, 1+(0.8)^2, -0.8]./(k - k*(0.8).^2);

% apply noise (var = 25, 100) to the low passed images
img_low_25 = double(img_low) + sqrt(25).*randn(size(img_low));
img_low_100 = double(img_low) + sqrt(100).*randn(size(img_low));

% apply inverse filter to clean and noisy low passed images
img_inv = imfilter(imfilter(double(img_low),H_inv, 'replicate'), H_inv.', 'replicate');
img_inv_25 = imfilter(imfilter(double(img_low_25), H_inv, 'replicate'), H_inv.', 'replicate');
img_inv_100 = imfilter(imfilter(double(img_low_100), H_inv, 'replicate'), H_inv.', 'replicate');

% plot clean image
figure()
subplot(1,3,1)
imshow(uint8(img))
title('Raw Image');
ylabel(name)
subplot(1,3,2)
imshow(uint8(img_low))
title('Custom Low Passed')
xlabel('31x31 Window')
subplot(1,3,3)
imshow(uint8(img_inv))
title('Passed through Inverse')
xlabel('31x31 Window')

% plot noisy image (var = 25)
figure()
subplot(1,2,1)
imshow(uint8(img_low_25))
title('Custom Low Passed with Noise')
ylabel(['Noisy ', name, ', \sigma^2 = 25'])
xlabel('Noise Added to Low Passed Image')
subplot(1,2,2)
imshow(uint8(img_inv_25))
title('Passed Through Inverse')

% plot noisy image (var = 100)
figure()
subplot(1,2,1)
imshow(uint8(img_low_100))
title('Custom Low Passed with Noise')
ylabel(['Noisy ', name, ', \sigma^2 = 100'])
xlabel('Noise Added to Low Passed Image')
subplot(1,2,2)
imshow(uint8(img_inv_100))
title('Passed Through Inverse')
