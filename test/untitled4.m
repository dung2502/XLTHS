
for i=1:12
subplot( 3, 4, i ); % 3 rows and 4 columns
[y,fs]=audioread( 'C:\Users\Admin\Downloads\testmathlab\HuanLuyen16k\35MMQ\e.wav' );
newfs=10000; % highest frequency = 5000 Hz
y=resample(y,newfs,fs);
spax(y,newfs);
title( wavfiles(i,:) )
end