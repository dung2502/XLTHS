% Đọc file âm thanh
[y, fs] = audioread('duongdan/amthanh.wav');

% Tạo phổ bằng hàm spectrogram
window = hamming(512);  % Cửa sổ hamming
noverlap = 256;         % Số mẫu chồng lên
nfft = 1024;            % Số điểm FFT
[S, F, T] = spectrogram(y, window, noverlap, nfft, fs);

% Hiển thị phổ
figure;
imagesc(T, F, 10*log10(abs(S)));  % Chuyển đổi sang đơn vị dB
axis xy;
xlabel('Thời gian (s)');
ylabel('Tần số (Hz)');
title('Phổ của âm thanh');

% Đánh dấu 3 tần số formant bằng đoạn thẳng nằm ngang
hold on;
formant1 = 500;  % Điều chỉnh giá trị này theo tần số formant thực tế
formant2 = 1500; % Điều chỉnh giá trị này theo tần số formant thực tế
formant3 = 2500; % Điều chỉnh giá trị này theo tần số formant thực tế

plot([0, max(T)], [formant1, formant1], 'r--', 'LineWidth', 2);
plot([0, max(T)], [formant2, formant2], 'g--', 'LineWidth', 2);
plot([0, max(T)], [formant3, formant3], 'b--', 'LineWidth', 2);

legend('Phổ âm thanh', 'Formant 1', 'Formant 2', 'Formant 3');
hold off;
