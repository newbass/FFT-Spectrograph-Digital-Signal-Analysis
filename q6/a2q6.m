[X,f]=audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q6/message1.wav');

% store the fft of sample in fft_x
fft_x=fft(X);

% length of each subsample, dividing into 8 parts. Conjugate as well
% permutations has all possible possibilities for [1 2 3 4]
permutations=perms([1 2 3 4]);
length_perm = size(fft_x,1)/8;

% 1 2 3 4 5 6 7 8
part = zeros(8, length_perm);

for i=1:8
    part(i,:) = fft_x(length_perm*(i-1)+1 : length_perm*i);
end
% now part(i,:) has ith part of the fft of initial signal.

dummy = zeros(24, size(fft_x,1));
% dummy will store all 24 mix matched signals

for i=1:24
     temp_fft = fft_x;
 
     for j=1:4
         temp_fft((j-1)*length_perm+1 : j*length_perm) = part(permutations(i,j), : );
         if permutations(i,j) == 1
             temp_fft((j-1)*length_perm+1 : (j-1)*length_perm+1) = 0;
         end
         temp_fft((8-j)*length_perm+1 : (8-j+1)*length_perm) = part(8-permutations(i,j)+1, : );
     end
     temp_fft(1) = fft_x(1);
     figure,plot(abs(temp_fft));
     dummy(i, : ) = abs(ifft(temp_fft));
end
% 
for i=1:24
     sound(dummy(i, : ),f);
     disp(permutations(i,:))
     pause(5);
end

% If you're good at something, never do it for free. 
% Why so serious?
% Let's put a smile on that face. 
