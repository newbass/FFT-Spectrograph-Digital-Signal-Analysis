filename = '~/Documents/Semester4/DSAA/Assignment2/20161140/q4/Img3.png';
x = imread(filename);

% figure, imshow(uint8(abs(fft2(x))));
Denoise(filename);
%Filter
function [result] = Denoise(filename)
input_image = imread(filename);

input_blue = input_image(:,:,3);
input_green = input_image(:,:,2);
input_red = input_image(:,:,1);

blue_fft = fftshift(fft2(input_blue));
green_fft = fftshift(fft2(input_green));
red_fft = fftshift(fft2(input_red));

[row, col, ~] = size(input_image);

a = zeros(row,col);
filter = double(ones(row,col));
b1 = 50;
b2 = 50;

% for i=b2:b2:col-20
%    filter(:,i-1:i+1) = 0.0;
% end
filter(:,col-5:col-3) = 0.0;
filter(:,5:7) = 0.0;
filter(:,59:61) = 0.0;
filter(:,78:80) = 0.0;
filter(:,87:89) = 0.0;
filter(:,174:176) = 0.0;
filter(:,159:161) = 0.0;
filter(:,181:183) = 0.0;
filter(:,202:204) = 0.0;
filter(48-1:48+1,1:120) = 0.0;
filter(48-1:48+1,140:end) = 0.0;

for i=2*b1:b1:row-2
    filter(i-1:i+1,1:120) = 0.0;
end

for i=2*b1:b1:row-2
    filter(i-1:i+1,140:end) = 0.0;
end

for i=120:10:140
    filter(:,i-1:i+1) = 1.0;
end
% 
filter(99:101,1:119) = 0.0;
% 
filter(99:101,140:end) = 0.0;
% 
filter(1:90,130:132) = 0.0;
% 
filter(110:end,130:132) = 0.0;
%

% f = mat2gray(log(abs(filtered_red)+1));
% figure;
% imagesc(f) , colormap gray;

filtered_blue = blue_fft.*filter;
filtered_green = green_fft.*filter;
filtered_red = red_fft.*filter;

blue = (abs(ifft2(ifftshift(filtered_blue))));
green = (abs(ifft2(ifftshift(filtered_green))));
red = (abs(ifft2(ifftshift(filtered_red))));

result = cat(3, uint8(red), uint8(green), uint8(blue));

figure;
imshow(result);

end
