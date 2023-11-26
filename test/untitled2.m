% Bước 1: Đọc file âm thanh
filename = 'C:\Users\Admin\Downloads\testmathlab\HuanLuyen16k\35MMQ\e.wav';
[y, Fs] = audioread(filename);

% Bước 2: Áp dụng Hanning window lên tín hiệu
y_hanning = y .* hann(length(y));

% Bước 3: Tính ảnh phổ của tín hiệu âm thanh
N = length(y_hanning);
Y = fft(y_hanning);
P2 = abs(Y/N);
P1 = P2(1:N/2+1);
f = Fs*(0:(N/2))/N;

% Bước 4: Vẽ đồ thị ảnh phổ
figure;
plot(f, P1);
title('Spectrum of the Audio Signal');
xlabel('Frequency (Hz)');
ylabel('Amplitude');

% Sử dụng findpeaks để tìm các đỉnh tần số
[peaks, locs] = findpeaks(P1, f, 'MinPeakHeight', 0.0045);
num_peaks = length(peaks);

% Hiển thị các tần số cơ bản và vẽ đoạn thẳng ngang tượng trưng
disp('Các tần số cơ bản:');
for i = 1:num_peaks
    fprintf('f%d = %.2f Hz\n', i, locs(i));
    % Nếu là f1, f2 hoặc f3, vẽ đoạn thẳng ngang
    if i == 1 || i == 2 || i == 3
        line([0, Fs/2], [locs(i), locs(i)], 'Color', 'r', 'LineStyle', '--');
    end
end
