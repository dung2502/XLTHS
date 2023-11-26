clear;
clc;
close all;
file_path = 'C:\Users\Admin\Downloads\testmathlab\HuanLuyen16k\35MMQ\o.wav';
% Đọc file âm thanh
[y, fs] = audioread(file_path);
% Tạo phổ bằng hàm spectrogram
window = hamming(512);  % Cửa sổ Hamming
noverlap = 256;         % Hệ số chồng lấp
nfft = 1024;            % Số điểm FFT
[S, F, T] = spectrogram(y, window, noverlap, nfft, fs);
% Hiển thị phổ
figure;
spectrogram(y, window, noverlap, nfft, fs, 'yaxis');
title('Phổ của nguyên âm o (người 4)');
% Trung bình năng lượng qua tất cả các khung thời gian để đơn giản hóa việc tìm các đỉnh formant
mean_energy = mean(abs(S), 2);
% Chuyển mean_energy về dB
mean_energy_db = 10*log10(mean_energy);
% Các dải tần số cần quan tâm cho từng formant
F1_range = [300, 800];     % Formant F1
F2_range = [800, 2500];    % Formant F2
F3_range = [2500, 3500];   % Formant F3
% Tìm kiếm các đỉnh trong các khoảng dải tần quan tâm
[pks, locs] = findpeaks(mean_energy_db, F, 'MinPeakProminence',5, 'Annotate','extents');
pks_F1 = pks(F(locs) > F1_range(1) & F(locs) < F1_range(2));
locs_F1 = locs(F(locs) > F1_range(1) & F(locs) < F1_range(2));
pks_F2 = pks(F(locs) > F2_range(1) & F(locs) < F2_range(2));
locs_F2 = locs(F(locs) > F2_range(1) & F(locs) < F2_range(2));
pks_F3 = pks(F(locs) > F3_range(1) & F(locs) < F3_range(2));
locs_F3 = locs(F(locs) > F3_range(1) & F(locs) < F3_range(2));
% Lấy formant với đỉnh cao nhất trong từng dải tần số
[~, I_F1] = max(pks_F1);
F1 = F(locs_F1(I_F1));
[~, I_F2] = max(pks_F2);
F2 = F(locs_F2(I_F2));
[~, I_F3] = max(pks_F3);
F3 = F(locs_F3(I_F3));
% Đánh dấu các formant trên phổ
hold on;
plot([0, max(T)], [F1, F1], 'r--', 'LineWidth', 2);
plot([0, max(T)], [F2, F2], 'g--', 'LineWidth', 2);
plot([0, max(T)], [F3, F3], 'b--', 'LineWidth', 2);
hold off;
% Thêm nhãn cho hình vẽ
legend('Spectrogram', 'Formant F1', 'Formant F2', 'Formant F3');
