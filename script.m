
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
 %% Test lda
  % Initialization
clear ; close all; clc
P3 = load('P3.mat');
d = 2;
D = [1,2;2,3;3,2;4,4;5,4;6,7;7,6;9,7];
scatter(D(:,1),D(:,2),[],"blue","filled");
axis([0 8 0 8]);
[Y,V] = lda(D,D,D,1);
  %% Question 2 a+b
 % Initialization
clear;close all; clc
P3 = load('P3.mat');
[Y2,V] = lda(P3.class1,P3.class2,P3.class3,2);
hold on;
figure(1);

scatter(Y2(1,:),Y2(2,:),[],"blue","filled");
scatter(Y2(3,:),Y2(4,:),[],"magenta","filled");
scatter(Y2(5,:),Y2(6,:),[],"black","filled");
hold off;
fprintf('Projecting to 2 dimention\n');
mypause;
[Y1,V] = lda(P3.class1,P3.class2,P3.class3,1);
[r,c] = size(P3.class1);
figure(2);
fprintf('Projecting to 1 dimention\n');
mypause;
hold on;
scatter(Y1(1,:),zeros(1,r),[],"blue","filled");
scatter(Y1(2,:),zeros(1,r),[],"magenta","filled");
scatter(Y1(3,:),zeros(1,r),[],"black","filled");
hold off;
fprintf('Clearly the projection to 2 dimention is well separateable!\n');
%% Question 2.c
% calculating mu and sigma for each class
c1 = Y2(1:2,:)';
c2 = Y2(3:4,:)';
c3 = Y2(5:6,:)';
muClass1 = mean(c1);
sigmaClass1 = std(c1);
muClass2 = mean(c2);
sigmaClass2 = std(c2);
muClass3 = mean(c3);
sigmaClass3 = std(c3);





 
 
 
 
 
 
 



