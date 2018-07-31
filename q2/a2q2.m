clear;
load ~/Documents/Semester4/DSAA/Assignment2/20161140/q2/q2.mat
% sound(X, Fs)
len = length(X);
y = abs(fftshift(fft(X)));

[a, b] = max(y);
h1x = b;
h1y = a;
y(b) = 0;

[a, b] = max(y);
h2x = b;
h2y = a;
y(b) = 0;

[a, b] = max(y);
h3x = b;
h3y = a;
y(b) = 0;


[a, b] = max(y);
h4x = b;
h4y = a;
y(b) = 0;

y(h1x) = h1y;
y(h2x) = h2y;
y(h3x) = h3y;
y(h4x) = h4y;

filter = zeros(size(y, 1), 1);
filter(h1x-10:h1x+10) = gausswin(21);
filter(h2x-10:h2x+10) = gausswin(21);
filter(h3x-10:h3x+10) = gausswin(21);
filter(h4x-10:h4x+10) = gausswin(21);

int_result = filter .* y;
final_result = ifft(ifftshift(int_result));
% sound(final_result, Fs)
