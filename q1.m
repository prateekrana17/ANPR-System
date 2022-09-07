%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Question 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;

L=imread('testImage.bmp'); %Reading the image

Lgray=rgb2gray(L); % Converting image to grayscale

Lgray=double(Lgray); %converting to type double

%Getting maximum and minimum values
Lmax=max(max(Lgray));%Alternatively Lmax=max(Lgray,[],"all");
Lmin=min(min(Lgray)); %Alternatively Lmin=min(min(min(L)));

Crange=Lmax-Lmin;  %Contrast Range
disp(['Range              = ' num2str(Crange)]);

CnormRange=Crange/255; %Normalized Contrast Range
disp(['Normalised Range   = ' num2str(CnormRange)]);

Cmichelson=(Lmax-Lmin)/(Lmax+Lmin); %Michelson contrast
disp(['Michelson Contrast = ' num2str(Cmichelson)]);

ariMeanL=mean2(Lgray); %Arithmetic mean
disp(['L Arithmetic Mean = ' num2str(ariMeanL)]);

geoMeanL=geomean(Lgray(:));   %Geometric mean
disp(['L Geometric Mean  = ' num2str(geoMeanL)]);

harmoMeanL=harmmean(Lgray(:)); %Harmonic mean
disp(['L Harmonic Mean   = ' num2str(harmoMeanL)]);

M=size(Lgray,1); %Getting the number of rows
N=size(Lgray,2); %Getting the number of columns

Crms= sqrt((1/(M*N))*sum(sum((Lgray-ariMeanL).^2))); %RMS contrast
disp(['RMS Contrast = ' num2str(Crms)]);

CmidRange=(Lmax+Lmin)/2; %Midrange contrast
disp(['Mid Range = ' num2str(CmidRange)]);

trimmedMeanL=trimmean(Lgray(:),10); %Trimmed mean
disp(['10% Trimmed Mean = ' num2str(trimmedMeanL)]);

%%%%%%%%%%%%%%%%%%%%%%%%%% Calculating winsorized mean %%%%%%%%%%%%
L2=Lgray;
% Loops through the image
for i=1+1:M-1                        % for
    for j=1+1:N-1                              % for
        % Selects the pixel if:
        % It is lower than the minimum + percentage
        % OR It is higher than the maximum - percentage
        if (Lgray(i,j) <= Lmin * (1 + 10 / 100)) || (Lgray(i,j) >= Lmax  * (1 + 10 / 100))  % if
            window = L(i-1:i+1,j-1:j+1); % Gets the window around the pixel
            L2(i,j) = mean2(window); % calculates the arithmetic mean of the pixels around and gives the value to the pixel in the middle
        end     %end if
    end       %end for
end         %end for

winsorisedMeanL=mean2(L2); %calculates the winsorized mean
disp(['10% Winsorised Mean = ' num2str(winsorisedMeanL)])
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%