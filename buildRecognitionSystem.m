function buildRecognitionSystem()
% Creates vision.mat. Generates training features for all of the training images.

	load('dictionary.mat');
	load('/Users/dhanashreebalaram/Downloads/release/data/traintest.mat');
    
	% TODO create train_features
    train_features = []; 
    disp('Starting....')
    disp('Computing Dictionary...')
    %computeDictionary();
    for i = 1:size(train_imagenames,1)
        msg = sprintf('Iteration %d',i);
        disp(msg);
        img = imread(strcat(['/Users/dhanashreebalaram/Downloads/release/data/'],train_imagenames{i}));
        wordMap = getVisualWords(img, filterBank, dictionary);
        [h] = getImageFeaturesSPM(3, wordMap, size(dictionary,2));
        train_features = [train_features h];
    end
    %histInter = distanceToSet(wordHist, histograms);
	save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels');

end