
%% Question 1

% Initialization
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
% evaluate
    A = [10,50,100,200,300,400];
    plotData = zeros(length(A),2);
    i = 1;
 for trainSize=A
     [trainErr,testErr] = evaluate(X(1:trainSize,:),y(1:trainSize),X(trainSize+1:end,:),y(trainSize+1:end));
     plotData(i,1) = trainErr;
     plotData(i,2) = testErr;
     i = i + 1;
     fprintf('for %d training samples: trainErr:%f testErr:%f\n',trainSize,trainErr,testErr);
 end
 bar(plotData);
 %% Question 2
 % Initialization
clear ; close all; clc
P3 = load('P3.mat');



 
 
 
 
 
 
 



