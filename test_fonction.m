


C = fft(A) ; 
plot(C) ;











% B1 = abs([A 0] - [0 A]) ;
% 
% B2 = [B1(:, 2 : length(B1)) 0] + B1
% 
% plot(B1) ;




% tic
% z = single(rgb2gray(s(51).cdata));
% 
% z2 = single(rgb2gray(s(52).cdata));
% 
% z3 = xcorr(z(1,:), z2(1,:));
% toc




% tic
% A = [];
%  k = [50:53]
%     Ia = single(rgb2gray(s(k).cdata)) ;
%     Ib = single(rgb2gray(s(k+1).cdata)) ;
% 
%     [fa, da] = vl_sift(Ia) ;
%     [fb, db] = vl_sift(Ib) ;
%     [matches, scores] = vl_ubcmatch(da, db,2) ;
% 
%     [m,n] = size(matches);
%     A = [A n];
% toc
% single(rgb2gray(s(k).cdata))