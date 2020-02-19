
%% Initialization
clear ; close all; clc
%  The first two columns contains the exam scores and the third column
%  contains the label.

data = load('housing.data');
%normalize data
normalizedData = normalizeFeatures(data);
X = normalizedData(:, 1:13);
y = data(:,14);
%y = normalizedData(:, 14);
% ============ Part 2: Compute Cost and Gradient ============
%  Setup the data matrix appropriately, and add ones for the intercept term
[m, n] = size(X);

% Add intercept term to x and X_test
X = [ones(m, 1) X];
%w = trainSamples(X,y);
 %% evaluate
 for trainSize=[10,50,100,200,300,400]
     [trainErr,testErr] = evaluate(X(1:trainSize,:),y(1:trainSize),X(trainSize+1:end,:),y(trainSize+1:end));
     fprintf('for %d training samples: trainErr:%f testErr:%f\n',trainSize,trainErr,testErr);
 end
 
 
 



