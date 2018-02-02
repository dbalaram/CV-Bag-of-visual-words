function [conf] = evaluateRecognitionSystem()
% Evaluates the recognition system for all test-images and returns the confusion matrix

	load('vision.mat');
	load('traintest.mat');
    count =0;
    conf =zeros([8,8]);
	% TODO Implement your code here
    
    for i = 1:size(test_imagenames,1)
        filepath = (strcat(['/Users/dhanashreebalaram/Downloads/release/data/'],test_imagenames{i}));
        guessedImage = guessImage( filepath );
        
        if (strcmp(guessedImage,mapping(test_labels(i)))) == 1
            %conf(test_labels(i),test_labels(i)) = conf(test_labels(i),test_labels(i)) + 1;
            count = count+1; 
        end
        for index = 1:8
            if(strcmp(mapping(1,index),guessedImage)) == 1
                conf(test_labels(i),index) = conf(test_labels(i),index) + 1;
            end
        end
                
        
    end
    accuracy = (count/size(test_labels,1)) *100;
    disp('Accuracy ');
    disp(accuracy);
end