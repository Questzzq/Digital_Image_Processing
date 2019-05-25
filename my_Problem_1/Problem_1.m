% clear
clc;
clear;

% Upload the figures
fig_1 = imread('zqf.png');
[width_1, length_1] = size(fig_1);
row_fig_2 = imread('zzq.png');

% Turn the gbr to gray
fig_2 = rgb2gray(row_fig_2);

% Keep zqf.png's size == zzq.png's size
[width_2, length_2] = size(fig_2);
if width_1 > width_2
    width_1 = width_2;
end
if length_1 > length_2
    length_1 = length_2
end

% the function imresize ==> image reset size
fig_1 = imresize(fig_1, [width_1, length_1]);  
fig_2 = imresize(fig_2,[width_1, length_1]);

% Convert the image to double precision
fig_1 = im2double(fig_1);

% F1 and F2 save the result of Fourier transform of fig_1 and fig_2
F1 = fft2(fig_1);     
F1 = fftshift(F1);   

mag_1 = log(abs(F1) + 1);      
phase1 = angle(F1);    
F1 = abs(F1);    
T1 = log(F1 + 1);    
figure();
subplot(2, 4, 1), imshow(fig_1), title('The initial gray figure');
subplot(2, 4, 2), imshow(T1, []), title('Image spectrum');
subplot(2, 4, 3), imshow(mag_1, []), title('Image amplitude spectrum');
subplot(2, 4, 4), imshow(phase1, []), title('Image phase spectrum');

fig_2 = im2double(fig_2);
F2 = fft2(fig_2);    
F2 = fftshift(F2);  
r2 = real(F2);          
i2 = imag(F2);          
mag_2 = log(abs(F2) + 1);      
phase2 = angle(F2);    
F2 = abs(F2);    
T2 = log(F2 + 1);   
subplot(2, 4, 5), imshow(fig_2), title('');
subplot(2, 4, 6), imshow(T2, []), title('');
subplot(2, 4, 7), imshow(mag_2, []), title('');
subplot(2, 4, 8), imshow(phase2, []), title('');

phase_exp_1 = i.*phase1;
phase_exp_2 = i.*phase2;
phase_me_1 = abs(F1).*(exp(phase_exp_2));
phase_me_2 = abs(F2).*(exp(phase_exp_1));
ifft_1 = real(ifft2(ifftshift(phase_me_1)));
ifft_2 = real(ifft2(ifftshift(phase_me_2)));
figure();
subplot(1, 2, 1), imshow(ifft_1, []), title('ZZQ');
subplot(1, 2, 2), imshow(ifft_2, []), title('ZQF');
