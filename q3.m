%%%%%%%%%%%%%%%%%%%%%%%%%%%% Question 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
clc;

I=imread("testImage.bmp"); % Read RGB image

yellow=I(:,:,1)>190&I(:,:,2)>162&I(:,:,3)<138; % Thresholding to segment yellow plate
imshow(yellow);
imwrite(yellow,"binaryimage.bmp"); %binary image produced

M=size(yellow,1);  %Number of Rows
N=size(yellow,2);  %Number of Columns
pixels_selected=0; %Counter for number of pixels

for i=1:M                     %for
    for j=1:N                    %for
        if yellow(i,j)==1           %if
            pixels_selected=pixels_selected+1; %Increment pixels selected
        end                         %end if
    end                           %end for
end                           %end for

disp(['Pixel Count   = ' num2str(pixels_selected)]);

mask=cat(3,yellow,yellow,yellow); %Same order needed for Hadamard product
product_Hadamard=uint8(mask).*I;  %Calculating hadamard product
imshow(product_Hadamard);  %show hadamard product image
imwrite(product_Hadamard,"hadamardProduct.bmp"); %Saving produced image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
