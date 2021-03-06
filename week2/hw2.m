I = imread('lena.gif');
Id = im2double(I);

LP1 = [1.0/9.0, 1.0/9.0, 1.0/9.0; 1.0/9.0, 1.0/9.0, 1.0/9.0; 1.0/9.0, 1.0/9.0, 1.0/9.0];
LP2 = [1/25, 1/25, 1/25, 1/25, 1/25; 1/25, 1/25, 1/25, 1/25, 1/25; 1/25, 1/25, 1/25, 1/25, 1/25; 1/25, 1/25, 1/25, 1/25, 1/25; 1/25, 1/25, 1/25, 1/25, 1/25];

Ilow1 = imfilter(Id, LP1, 'replicate');
Ilow2 = imfilter(Id, LP2, 'replicate');

sum = 0;
for x = 1:256
  for y = 1:256
    sum = sum + (Id(x,y) - Ilow1(x,y))^2;
  end;
end;
MSE1  = sum / (256.0 * 256.0);
PSNR1 = 10 * log10(1 / MSE1)

sum = 0;
for x = 1:256
  for y = 1:256
    sum = sum + (Id(x,y) - Ilow2(x,y))^2;
  end;
end;

MSE2 = sum / (256.0 * 256.0);
PSNR2 = 10 * log10(1 / MSE2)
