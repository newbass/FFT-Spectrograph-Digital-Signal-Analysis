% s0 = audioread('q5/0.ogg');
% input_file = '~/Documents/Semester4/DSAA/Assignment2/q5/Police.ogg';
input_file = '~/Documents/Semester4/DSAA/Assignment2/20161140/q5/9515733002.ogg';
audinfo = audioinfo(input_file);
input_audio = audioread(input_file);

digits = audinfo.TotalSamples/audinfo.SampleRate;

s0 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/0.ogg'));
s1 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/1.ogg'));
s2 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/2.ogg'));
s3 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/3.ogg'));
s4 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/4.ogg'));
s5 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/5.ogg'));
s6 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/6.ogg'));
s7 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/7.ogg'));
s8 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/8.ogg'));
s9 = fft(audioread('~/Documents/Semester4/DSAA/Assignment2/20161140/q5/9.ogg'));
storage = [s0 s1 s2 s3 s4 s5 s6 s7 s8 s9];

number = 0;
array = zeros(10,1);
for i=1:digits
    sample_cut = input_audio((i-1)*audinfo.SampleRate+1:i*audinfo.SampleRate, 1);
    
    % corr = 0;
    idx = -1;
    for j = 0:9
        check = dot(fft(sample_cut), storage(:,j+1));
        array(j+1,:) = check;
    end
    
    max_v = max(array);
    for j = 0:9
        if(max_v == array(j+1,:))
            idx = j;
            break
        end
    end
    number = number*10 + idx;
end

