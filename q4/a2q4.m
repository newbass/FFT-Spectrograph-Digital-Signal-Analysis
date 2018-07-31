f1 = imread('~/Documents/Semester4/DSAA/Assignment2/20161140/q4/Img1a.png');
f2 = imread('~/Documents/Semester4/DSAA/Assignment2/20161140/q4/Img1b.png');
f3 = imread('~/Documents/Semester4/DSAA/Assignment2/20161140/q4/Img2a.png');
f4 = imread('~/Documents/Semester4/DSAA/Assignment2/20161140/q4/Img2b.png');

f = rgb2gray(f3);

x = fftshift(fft2(f));
figure, plot(abs(x));


