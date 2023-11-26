% Read audio data
[y, fs] = audioread('C:\Users\Admin\Downloads\testmathlab\HuanLuyen16k\35MMQ\e.wav');

% Calculate time vector
t = linspace(0, length(y)/fs, length(y));

% Plot the time waveform
subplot(311);
plot(t, y);

% Calculate spectrogram parameters
segmentlen = 100;
noverlap = 90;
NFFT = 128;

% Compute spectrogram
subplot(312);
[S, F, T, P] = spectrogram(y, segmentlen, noverlap, NFFT, fs, 'yaxis');

% Extract LPC coefficients
dt = 1/fs;
I0 = round(0.001/dt);
Iend = round(0.06/dt);
x = y(I0:Iend);
x1 = x .* hamming(length(x));
preemph = [1 0.63];
x1 = filter(1, preemph, x1);
A = lpc(x1, 16);

% Extract formant frequencies
rts = roots(A);
rts = rts(imag(rts) >= 0);
angz = atan2(imag(rts), real(rts));
[frqs, indices] = sort(angz .* (fs/(2*pi)));
bw = -1/2*(fs/(2*pi)) * log(abs(rts(indices)));

% Find formants within the specified frequency range
formants = [];
nn = 1;
for kk = 1:length(frqs)
    if (frqs(kk) > 90 && bw(kk) < 400)
        formants(nn) = frqs(kk);
        nn = nn + 1;
    end
end

% Convert formants to indices in frequency axis
formant_indices = round(formants * NFFT / fs);

% Add horizontal lines to mark formants in the spectrogram
hold on;
for i = 1:length(formant_indices)
    plot(T, formant_indices(i) * ones(size(T)), 'r-');
end

title('Signal Spectrogram with Formant Markers');
