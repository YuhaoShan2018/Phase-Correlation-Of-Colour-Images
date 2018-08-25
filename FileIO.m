imagename = '';
decision  = '';
disp('Enter filename, including extension e.g "Lena.png" : ')
file1 = input(imagename,'s'); 
disp('Enter noise from 0.00-1: ')

variance = input(decision)
img0 = imread(file1);
img1 = imnoise(img0,'salt & pepper',variance);
img2 = imnoise(img0,'salt & pepper',variance);
       

disp('Saving file...') 
imwrite(img1, 'Image1.png');

img2c = circshift(circshift(img2, 128, 2), 64, 1);
imwrite(img2c, 'Image2.png');
disp('Script ran successfully.')
