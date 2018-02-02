function [wordMap] = getVisualWords(img, filterBank, dictionary)
% Compute visual words mapping for the given image using the dictionary of visual words.
Fsize = 20;
% disp(size(img))
imgR = extractFilterResponses(img,filterBank);
 r = size(imgR,1);
 c = size(imgR,2);
im = reshape(imgR,[r*c,(3*Fsize)]);
% wM = [];
dist = pdist2(im,dictionary');
[minn, indx] =   min(dist,[],2) ;
wM = im(indx);
wordMap = reshape(wM,r,c);
%convert to uint before displaying
% Inputs:
% 	img: Input RGB image of dimension (h, w, 3)
% 	filterBank: a cell array of N filters
% Output:
%   wordMap: WordMap matrix of same size as the input image (h, w)

    % TODO Implement your code here

end
