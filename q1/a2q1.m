clear;

f1 = imread('~/Documents/Semester4/DSAA/Assignment2/20161140/q1/f1_input.jpg');

% f1 = imread('cameraman.tif');
% f1 = zeros(256);
% f1(120:136, 120:136) = 255;
% 
% f2 = zeros(256);
% f2(230:246, 230:246) = 255;
% 
% f3 = zeros(256);
% f3(110:146, 120:136) = 255;

imshow(f1);
f = f1;
%f1 = rgb2gray(f1);
[row, col] = size(f);

output = zeros(row, col);

for s = 1:col
   output(1:row,s:s) = recursive_fft(f(1:row, s:s));
end

n_output = zeros(row, col);
for t = 1:row
   n_output(t:t,1:col) = recursive_fft(output(t:t, 1:col).');
end



function [x] = recursive_fft(a)
    n = size(a, 1);
    if (n==1)
        x = a;
        return;
    end
    omega_n = exp((-2*pi*1i)/n);
    omega = 1;
    a0 = a(1:2:end);
    a1 = a(2:2:end);
    
    y0 = recursive_fft(a0);
    y1 = recursive_fft(a1);
    y = zeros(n,1);
    for k = 1:floor(n/2)
        y(k:k, 1:1) = y0(k:k, 1:1) + omega * y1(k:k, 1:1);
        y(k+floor(n/2):k+floor(n/2), 1:1) = y0(k:k, 1:1) - omega * y1(k:k, 1:1);
        omega = omega * omega_n;
    end
    x = y;
    return;
end

