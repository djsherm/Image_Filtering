function B = radfilt(I, radius, bit)
%% DOCUMENTATION

% DANIEL SHERMAN
% JANUARY 13, 2020
% 
% FUNCTION ACCEPTS IMAGE I, DOUBLE radius, AND INTEGER bit AND CREATES AN
% IDEAL LOW PASS CIRCULAR FILTER

%% BEGIN CODE

[row, column] = size(I); %find out size of image

B = uint8(zeros(row, column)); %define initial matrix of zeros to populate

for i = 1 : row
    for j = 1 : column
        d = sqrt((i - round(row/2))^2 + (j - round(column/2))^2); %define circle which will be the filter
        if (d < radius) %check if a pixel is within the defined circle
            B(i,j) = 2^bit - 1; %if it is, set to the highest bit value we can have
        else
            B(i,j) = 0; %otherwise, leave as 0
        end
    end
end

