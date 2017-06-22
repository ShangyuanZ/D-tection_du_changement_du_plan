clc;
close all;
clear all;

%get the video frame 
tic
vidObj = VideoReader('bigfish.avi');
implay(read(vidObj, [50 150]));

vidHeight = vidObj.Height;
vidWidth = vidObj.Width;
info = get(vidObj);

s = struct('cdata',zeros(vidHeight,vidWidth,3,'uint8'));

for k = 50:150 %hasFrame(vidObj)
    s(k).cdata = read(vidObj,k);
end
toc

%SIFT for two image continuous
tic
A = [];
for  k = 50:149
    Ia = single(rgb2gray(s(k).cdata)) ;
    Ib = single(rgb2gray(s(k+1).cdata)) ;

    [fa, da] = vl_sift(Ia) ;
    [fb, db] = vl_sift(Ib) ;
    [matches, scores] = vl_ubcmatch(da, db,2) ;

    [m,n] = size(matches);
    A = [A n];
end
toc

plot(A)

%get the moment of change
moyen = mean(A);

change = [] ;
[m n] = size(A);

for i = 1 : n
    if (A(i) < moyen/5)
      change = [change i];
end
end

time = [change/info.FrameRate];

[m n] = size(change);

Data = [1:n ; time; change] ;


%open a file to record the moment of change of camera

fileID = fopen('detection.txt','w') ;

formatSpec = 'Number of change: %d\nTime: %f\nNumber of frame: %d \n\n';
fprintf(fileID ,formatSpec,Data) ;

