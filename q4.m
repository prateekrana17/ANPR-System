%%%%%%%%%%%%%%%%%%%% Question 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
clc;

I=imread("testImage.bmp"); %Read RGB image
binary=I(:,:,1)>190&I(:,:,2)>162&I(:,:,3)<138; %Obtaining the binary image produced in Q3

M=size(binary,1); %Number of rows
N=size(binary,2); %Number of columns

%%%%%%%%%%%%%%%%%%%%%%%%% Majority Filter %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Window size
W=5;
majorityF = binary; % Will leave border unconvolved

for i=1+floor(W/2):M-floor(W/2)        %for
    for j=1+floor(W/2):N-floor(W/2)       %for
        
        window       = binary(i-floor(W/2):i+floor(W/2),j-floor(W/2):j+floor(W/2));
        window       = window(:);
        outputValue  = mode(window); % Note, in MATLAB this is smallest mode
        majorityF(i,j)      = uint8(outputValue);
        
    end                                    %end for
end                                      %end for

pixels_selected=0; %counts the number of pixels selected

%%%%%%% Pixels Selected %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:M                    %for
    for j=1:N                   %for
        if majorityF(i,j)==1      %if
            pixels_selected=pixels_selected+1; %Increment number of pixels
        end                       %end if
    end                         %end for
end                           %end for

disp(['Pixels selected in Majority Filtered Image   = ' num2str(pixels_selected)]);

figure;
imshow(binary);
title('Original'); %show original image
figure;
imshow(majorityF); %show image after majority filter
title('Majority Filter: Window size 5');
imwrite(majorityF, 'majorityFilterSize5.bmp'); %save image produced
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%