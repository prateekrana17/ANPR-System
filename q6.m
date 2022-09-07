%%%%%%%%%%%%%%%%%%%%%%%%% Question 6 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
clc;

I=imread("testImage.bmp"); %RGB Image
binary=I(:,:,1)>190&I(:,:,2)>162&I(:,:,3)<138; %Obtaining the binary image produced in Q3

%%%%%%%%%% structuruing element %%%%%%%%%%%%%%%%%%
%%%% Change the size and shape here %%%%
s=strel('diamond',5);

Bclose=imclose(binary,s); %%%%Closing morphological operation

numPlateInverted=Bclose-binary; %%% closed image has higher intensity

numPlate=~numPlateInverted; %Inverting colors for ocr

%You must select a portion of the image and then right click and select
%crop

cropped=imcrop(numPlate); %%Cropping the image

ocrResults=ocr(cropped);    %%%%using ocrfunction to read the text

text=ocrResults.Text;  %%Obtaining the text part

disp(['Identified Text: ',text]);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
