function [filterBank, dictionary] = getFilterBankAndDictionary(imPaths)
% Creates the filterBank and dictionary of visual words by clustering using kmeans.

% Inputs:
%   imPaths: Cell array of strings containing the full path to an image (or relative path wrt the working directory.
% Outputs:
%   filterBank: N filters created using createFilterBank()
%   dictionary: a dictionary of visual words from the filter responses using k-means.
    alpha = 50;
    K = 100;
    filterBank  = createFilterBank();
    TotalSize = size(imPaths,1);
    filterResponse = [];
    
   
    for i=1:TotalSize
        %filepath = sprintf('/Users/dhanashreebalaram/Downloads/release/data/%s',imPaths{i,1});
        Itemp = imread(imPaths{i,1});
        
        I = im2double(Itemp);
        M = size(I,1);
        N = size(I,2);
        rows = randi([1 M],1,alpha);
        columns = randi([1 N],1,alpha);
       [filterResponses2] = extractFilterResponses(I, filterBank);
       
        Imodified =[];
        for v = 1: size(rows,2)
            Imodified = [Imodified filterResponses2(rows(1,v),columns(1,v),1:60)];
        end
        Imod = reshape(Imodified,[alpha,3*20]);
        filterResponse = [filterResponse;Imod];

    end 
    
    disp(size(filterResponse));
    % TODO Implement your code here

     display('Going to k means.....');
     [~, dict] = kmeans(filterResponse,K,'EmptyAction','drop');
     display('Done with dictionary')
     dictionary = dict';

end

