% Computes filter bank and dictionary, and saves it in dictionary.m??at 

function computeDictionary()

	load('/Users/dhanashreebalaram/Downloads/release/data/traintest.mat'); 

	interval= 1;
	train_imagenames = train_imagenames(1:interval:end);
	[filterBank,dictionary] = getFilterBankAndDictionary(strcat(['/Users/dhanashreebalaram/Downloads/release/data/'],train_imagenames));
    
	save('dictionary.mat','filterBank','dictionary'); 

end
