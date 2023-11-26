clear;
clc;
close all;
file_path = 'D:\XLTHS\code\HuanLuyen16k\';
concatenate_files = dir('D:\XLTHS\code\HuanLuyen16k\');
for i = 1:4
    randomInteger = randi([1, 21]);
    % random file
    path_random = strcat(file_path, '\', concatenate_files(randomInteger).name);
    path_read = strcat(path_random, '\*.wav');
    concatenate_files1 = dir(path_read);
    
    for j = 1:length(concatenate_files1)
        x = concatenate_files(randomInteger).name + "\" + concatenate_files1(j).name;
        figure('Name', x); 
        path_last = strcat(path_random, '\', concatenate_files1(j).name);
        [data, fs] = audioread(path_last);
        data = data ./ max(data);
        t = 0:1/fs:length(data)/fs - 1/fs;
        % độ dài của cửa sổ 5 msec and bước 3 msec và wideband 5ms
        title('Phổ của nguyên âm u');
        spectrogram(data, 5*10^(-3)*fs, 2*10^(-3)*fs, 1024, fs, 'yaxis');
    end
end
