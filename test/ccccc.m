path='/Users/dinhgiabao/Desktop/XLTinHieu/mid-term1/TinHieuKiemThu/studio_F2.wav';
[x,t,Fs]=normalizedAmplitude(path);
uv=x(floor(1.02*Fs):floor(1.05*Fs));
v=x(floor(1.95*Fs):floor(1.98*Fs));
uv1=ACF(uv);
v1= ACF(v);
figure('Name','Autocorrect');
subplot(2,2,1); plot(uv); xlabel('Sample');ylabel('Amplitude'); title('Unvoice');
subplot(2,2,2); plot(uv1); xlabel('Sample'); ylabel('Autocorrect');
subplot(2,2,3); plot(v); xlabel('Sample');ylabel('Amplitude'); title('Voice');
subplot(2,2,4); plot(v1); xlabel('Sample'); ylabel('Autocorrect');