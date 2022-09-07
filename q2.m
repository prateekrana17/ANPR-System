%%%%%%%%%%%%%%%%%%% Question 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;
clear all;
clc;

A=imread("testImage.bmp");  % Read RGB image
R = A(:,:,1);  % get Red plane from RGB
G = A(:,:,2);  % get Green plane from RGB
B = A(:,:,3);  % get Blue plane from RGB
M = size(A,1); % Number of rows
N = size(A,2); % Number of columns

%Count Histogram
[countR, x] = imhist(R);
[countG, x] = imhist(G);
[countB, x] = imhist(B);
figs(1)=figure;
%subplot(2,2,1);
plot(x, countR, 'R', x, countG, 'G', x, countB, 'B'); %plot histogram
xlim([0 255]);
xlabel('Luminance');
ylabel('Count');
axis square;
title('Count Histogram');
print(figs(1),'countHistogram','-dpng') %save histogram produced

%Normalised Count Histogram
figs(2)=figure;
%subplot(2,2,2);
normCountR  = (countR)./(M*N);
normCountG  = (countG)./(M*N);
normCountB  = (countB)./(M*N);
plot(x,normCountR,'r',x,normCountG,'g',x,normCountB,'b'); %plot histogram
xlim([0 255]);
xlabel('Luminance');
ylabel('Normalised Count');
axis square;
title('Normalised Count Histogram');
print(figs(2),'normalisedCountHistogram','-dpng') %save histogram produced

%Cumulative Count Histogram
figs(3)=figure;
%subplot(2,2,3);
cumulCountR = cumsum(imhist(R));
cumulCountG  = cumsum(imhist(G));
cumulCountB  = cumsum(imhist(B));
plot(x,cumulCountR,'red',x,cumulCountG,'green',x,cumulCountB,'blue'); %plot histogram
xlim([0 255]);
xlabel('Luminance');
ylabel('Cumulative Count');
axis square;
title('Cumulative Count Histogram');
print(figs(3),'cumulativeCountHistogram','-dpng') %save histogram produced


%Normalised Cumulative Count Histogram
figs(4)=figure;
%subplot(2,2,4);
normCumulCountR  = cumulCountR./(M*N);
normCumulCountG  = cumulCountG./(M*N);
normCumulCountB  = cumulCountB./(M*N);
plot(x,normCumulCountR,'red',x,normCumulCountG,'green',x,normCumulCountB,'blue'); %plot histogram
xlim([0 255]);
xlabel('Luminance');
ylabel('Normalised Cumulative Count');
axis square;
title('Normalised Cumulative Count Histogram');
print(figs(4),'normalisedCumulativeCountHistogram','-dpng') %save histogram produced
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%