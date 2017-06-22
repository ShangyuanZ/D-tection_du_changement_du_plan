% Data = [1:n ; time; change] ;
Data2 = [1:n ; time; time + 0.5; 1:n ;change] ;
fileID = fopen('soustitre.srt','w') ;

formatSpec = '%d\n00:00:%6.3f --> 00:00:%6.3f\number of change: %d\nnumber of frame: %d \n\n';

fprintf(fileID ,formatSpec,Data2) ;

