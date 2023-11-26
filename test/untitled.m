clear;
clc;
close all;

file_path = 'C:\Users\Admin\Downloads\testmathlab\HuanLuyen16k\27MCM\a.wav';

% Đọc dữ liệu âm thanh và trích xuất tần số lấy mẫu
[data, fs] = audioread(file_path);

% Tạo ảnh phổ
[S, F, T] = spectrogram(data, 5*10^(-3)*fs, 2*10^(-3)*fs, 1024, fs);

% Xác định vùng tần số của F1
f1_range = [200 1000];
% Tạo dữ liệu phổ trong vùng tần số của F1
spectrogram_slice = abs(S(F >= f1_range(1) & F <= f1_range(end), :));
% Tìm các đỉnh phổ trong vùng tần số của F1
[f1, x1] = findpeaks(spectrogram_slice(:), 'MinPeakHeight', 1);

% Đánh dấu F1
figure;
subplot(3, 1, 1);
surf(T, F, 10*log10(abs(S)), 'EdgeColor', 'none');
axis xy;
xlabel('Thời gian (s)');
ylabel('Tần số (Hz)');
zlabel('Cường độ (dB)');
title('Phổ của âm thanh');
hold on;
scatter3(T(x1), F(f1_range(1) + x1 - 1), f1, 'r', 'filled');
hold off;

% Xác định vùng tần số của F2
f2_range = [1000 2500];

% Tìm các đỉnh phổ trong vùng tần số của F2
[f2, x2] = findpeaks(abs(S(F >= f2_range(1) & F <= f2_range(end), :)), 'MinPeakHeight', 1);

% Đánh dấu F2
subplot(3, 1, 2);
surf(T, F, 10*log10(abs(S)), 'EdgeColor', 'none');
axis xy;
xlabel('Thời gian (s)');
ylabel('Tần số (Hz)');
zlabel('Cường độ (dB)');
title('Phổ của âm thanh');
hold on;
scatter3(T(x2), F(f2_range(1) + x2 - 1), f2, 'g', 'filled');
hold off;

% Xác định vùng tần số của F3
f3_range = [2500 5000];

% Tìm các đỉnh phổ trong vùng tần số của F3
[f3, x3] = findpeaks(abs(S(F >= f3_range(1) & F <= f3_range(end), :)), 'MinPeakHeight', 1);

% Đánh dấu F3
subplot(3, 1, 3);
surf(T, F, 10*log10(abs(S)), 'EdgeColor', 'none');
axis xy;
xlabel('Thời gian (s)');
ylabel('Tần số (Hz)');
zlabel('Cường độ (dB)');
title('Phổ của âm thanh');
hold on;
scatter3(T(x3), F(f3_range(1) + x3 - 1), f3, 'b', 'filled');
hold off;
