tic
[image, descrips, locs] = sift2(rgb2gray(s(1).cdata));
toc
% [image, descrips, locs] = sift('scene.pgm');
% showkeys(image, locs);
tic
num = match2(rgb2gray(s(1).cdata), rgb2gray(s(2).cdata));
toc