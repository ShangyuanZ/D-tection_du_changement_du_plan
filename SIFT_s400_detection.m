

%SIFT for two image continuous
tic
A = [];
parfor  k = 1:399
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
tic
moyen = mean(A);

change = [] ;
[m n] = size(A);

for i = 1 : n
    if (A(i) < moyen/6)
      change = [change i];
end
end

time = [change/23.9760];

[m n] = size(change);

Data = [1:n ; time; change] ;


%open a file to record the moment of change of camera

fileID = fopen('detection.txt','w') ;

formatSpec = 'Number of change: %d\nTime: %f\nNumber of frame: %d \n\n';
fprintf(fileID ,formatSpec,Data) ;
toc