clear;clc;close all;
%% Machband Creation
gray_machband_r = zeros(128,128);
gray_machband_g = zeros(128,128);
gray_machband_b = zeros(128,128);
for i=1:8
    gray_machband_r(:,((i-1)*16)+1:i*16)=(i-1)*32/256;
    gray_machband_g(:,((i-1)*16)+1:i*16)=(i-1)*32/256;
    gray_machband_b(:,((i-1)*16)+1:i*16)=(i-1)*32/256;
end
gray_machband=cat(3,gray_machband_r,gray_machband_g,gray_machband_b);
figure(1)
imshow((gray_machband));
title('Gray Machband');
imwrite(gray_machband,'Gray Machband.bmp');


yellow_machband_r = zeros(128,128);
yellow_machband_g = zeros(128,128);
yellow_machband_b = zeros(128,128);
for i=1:8
    yellow_machband_r(:,((i-1)*16)+1:i*16)=(i-1)*32/256;
    yellow_machband_g(:,((i-1)*16)+1:i*16)=(i-1)*32/256;
end
figure(2)
yellow_machband=cat(3,yellow_machband_r,yellow_machband_g,yellow_machband_b);
imshow(yellow_machband);
title('Yellow Machband');
imwrite(yellow_machband,'Yellow Machband.bmp');

neg_gray_machband_r = zeros(128,128);
neg_gray_machband_g = zeros(128,128);
neg_gray_machband_b = zeros(128,128);
for i=1:8
    neg_gray_machband_r(:,((i-1)*16)+1:i*16)=(256-(i-1)*32)/256;
    neg_gray_machband_g(:,((i-1)*16)+1:i*16)=(256-(i-1)*32)/256;
    neg_gray_machband_b(:,((i-1)*16)+1:i*16)=(256-(i-1)*32)/256;
end
neg_gray_machband=cat(3,neg_gray_machband_r,neg_gray_machband_g,neg_gray_machband_b);
figure(3)
imshow(neg_gray_machband);
title('Negative Gray Machband');
imwrite(neg_gray_machband,'Negative Gray Machband.bmp');
%% Image Blending
lena   = imread('lena.bmp');
baboon = imread('baboon.bmp');
output_r=zeros(128,128); 
output_g=zeros(128,128);
output_b=zeros(128,128);
for i = 1:128
    for j = 1:128
        output_r(i,j)=double(lena(i,j,1))*gray_machband_r(i,j)+double(baboon(i,j,1))*neg_gray_machband_r(i,j);
        output_g(i,j)=double(lena(i,j,2))*gray_machband_g(i,j)+double(baboon(i,j,2))*neg_gray_machband_g(i,j);
        output_b(i,j)=double(lena(i,j,3))*gray_machband_b(i,j)+double(baboon(i,j,3))*neg_gray_machband_b(i,j);
    end
end
output=uint8(cat(3,output_r,output_g,output_b));
figure(4)
imshow(output);
title('Blended Image')
imwrite(output,'Blended Image.bmp');


