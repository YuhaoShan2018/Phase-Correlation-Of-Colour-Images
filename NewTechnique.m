%mu = randv;
mu = unit(quaternion(1,1,1));
img1 = cast(imreadq('Image1.png'),'double')./256;
figure(1)
image(img1)
axis image

img2 = cast(imreadq('Image2.png'),'double')./256;
figure(2)
image(img2)
axis image

QFFT2 = qfft2(img1,mu,'R');
QFFT22 = qfft2(img2,mu,'R');

[f1,g1] = factorq(QFFT2,mu,'R');
[f2,g2] = factorq(QFFT22,mu,'R');

G1 = conj(g1);
G2 = g2;

multiple = G1.*G2;

IMG = iqfft2(multiple,mu,'R');

pcs = abs(IMG);

figure(3)
mesh(pcs)
axis tight
zlim([0 0.05])

disp('Mean value of phase correlation surface is:')
disp(mean(mean(pcs)))

[C, I] = max(pcs); % Find the maximum element in the phase correlation
[D, J] = max(C);   % surface, and its index value.

disp(['Peak value of phase correlation surface is:', D])
disp(D)

disp('Maximum value in phase correlation surface occurs at:')
disp([I(J), J])



