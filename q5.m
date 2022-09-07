%%%%%%%%%%%%%%%%%%%%%%% Question 5 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
clc;

I=imread("testImage.bmp"); %RGB image
binary=I(:,:,1)>190&I(:,:,2)>162&I(:,:,3)<138; %Obtaining the binary image produced in Q3

%structuruing element%
%%%% Change the size and shape here
s=strel('disk',5);

Bopen=imopen(binary,s);          %open morphological operation
Bclose=imclose(binary,s);        %close morphological operation
Bdilate=imdilate(binary,s);      %dilate morphological operation
Berode=imerode(binary,s);        %erode morphological operation
Bgradient=imdilate(binary,s)-imerode(binary,s); %gradient morphological operator

figure;
subplot(2,3,1); %plot original image
imshow(binary);
axis image;axis off;
title('original');

subplot(2,3,2);
imshow(Bopen); %plot opened image
axis image;axis off;
title('Open');

subplot(2,3,3);
imshow(Bclose); %plot closed image
axis image;axis off;
title('Close');

subplot(2,3,4);
imshow(Bdilate); %plot dilated image
axis image;axis off;
title('Dilate');

subplot(2,3,5);
imshow(Berode); %plot eroded image
axis image;axis off;
title('Erode');

subplot(2,3,6);
imshow(Bgradient); %plot gradient
axis image;axis off;
title('Gradient');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


