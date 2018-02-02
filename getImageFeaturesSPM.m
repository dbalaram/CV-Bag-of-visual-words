function [h] = getImageFeaturesSPM(layerNum, wordMap, dictionarySize)
% Compute histogram of visual words using SPM method
% Inputs:
%   layerNum: Number of layers (L+1)
%   wordMap: WordMap matrix of size (h, w)
%   dictionarySize: the number of visual words, dictionary size
% Output:
%   h: histogram of visual words of size {dictionarySize * (4^layerNum - 1)/3} (l1-normalized, ie. sum(h(:)) == 1)

    % TODO Implement your code here
    m = size(wordMap,1);
    n = size(wordMap,2);
%    disp('Size of wordmap');
%     disp(size(wordMap));

    %for layer 0
   
    w = 1/4;
    Hist = histcounts(wordMap,dictionarySize);
    H= (Hist*w)/sum(Hist);
    m1 = ceil(m/2);
    n1 = ceil(n/2);
    m2 = m -m1;
    n2 = n-n1;
    %for layer 1
    inp1 = mat2cell(wordMap,[m1 m2],[n1 n2]);
   %for layer 2
    m2 = ceil(m1/2);
    n2 = ceil(n1/2);
%     disp('Sizes')
%     disp(m2); disp(n2)
    inp2 = mat2cell(wordMap,[m2 m2 m2 (m-(3*m2))],[n2 n2 n2 n-(3*n2)]) ;
   %for histograms
  
   h2 = H;
    for i = 1:4
            h1 = histcounts(inp1{i},dictionarySize) ;
            h1 = (h1/sum(h1)) ;
            h2 = [h2 h1*(1/4)];
    end     
    h = h2;
    for i = 1:16
            h3 = histcounts(inp2{i},dictionarySize)  ;
            h3 = h3/sum(h3);
            h = [h h3*(1/2)];
    end     
    
s = h/(sum(h)) ;
h= s';

end