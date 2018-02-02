function [filterResponses] = extractFilterResponses(img, filterBank)
% Extract filter responses for the given image.
% Inputs: 
%   img:                a 3-channel RGB image with width W and height H
%   filterBank:         a cell array of N filters
% Outputs:
%   filterResponses:    a W x H x N*3 matrix of filter responses
filterResponse =[];
alpha = 50;
%converting to L,a,b space for filters
N = size(filterBank,1);
I = im2double(img);
m = size(img,1);
n = size(img,2);
if size(I,3) == 1
     I = repmat(img,[1,1],3);
end
img = RGB2Lab(I);
for i = 1:N
    h = filterBank{i};
    I1 = imfilter(img(:,:,1),h,'conv');
    I2 = imfilter(img(:,:,2),h,'conv');
    I3 = imfilter(img(:,:,3),h,'conv');
    I = cat(3,I1,I2,I3);
    filterResponse =[filterResponse, I];
          
end         
%           disp('The size of the final image is')
%           disp(size(finalimg))
filterResponses = reshape(filterResponse,[m,n,60]);
     
% TODO Implement your code here
%     F = reshape(filterResponses,size(filterResponses,1), size(filterResponses,2),3,20);
%     montage(F)

end


