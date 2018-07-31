% function [result] = q3(file,winLen,strideLen)
clear;
load train;
% load laughter;
% t = [0:1/320:100-1/320];  % sampling in time
% x = 5+ 2*cos(100*pi*t-pi/2);
% file = x;
file = y;
windowSize = 30;
overlapLength = 10;


figure, imagesc(spectrogr(file, windowSize, overlapLength));
colorbar;

function [result] = spectrogr(file, windowSize, overlapLength)

% initializing gaussian filter for sftt
gauss_filter = gausswin(windowSize);

% length of input
[row , ~] = size(file);
fileSize = row;

% effective number of windows to be used for spectrogram building
effectiveWindowSize = windowSize-overlapLength;
effectiveWindows = ceil(fileSize/effectiveWindowSize);



% array for rendering into for spectrogram
final = zeros(effectiveWindows, windowSize);

start_point = 1;
reachEnd = 0;
for i = 1:effectiveWindows
    end_point = start_point + windowSize - 1;
    
    % check if it is the last window
    if end_point > fileSize
        reachEnd = 1;
        end_point = fileSize;
        gauss_filter = gausswin(end_point - start_point + 1);
    end
    % check ends
    
    % calculating the fft
    a = file(start_point:end_point) .* gauss_filter;
    a = fft(a);
    a = abs(a);
    % 
    
    % rendering the final array
    if end_point - start_point + 1 < windowSize 
        final(i,1:end_point - start_point + 1) = a;
    else
        final(i,1:windowSize) = a;
    end
    
    % updating start point as per the overlap length
    start_point = start_point + windowSize - overlapLength;
    i = i + 1;
    if reachEnd == 1
        break
    end
end
result = flipud(log(final(:, 1:windowSize/2)));
end