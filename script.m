
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
 name = {'10','50','100','200','300','400'};
 x = (1:6);
 b = bar(x,plotData);
 set(gca,'xticklabel',name);
 legend(b(:),["Training","Test"]);
 
  %% Question 2 a+b
% Initialization
clear;close all; clc
P3 = load('P3.mat');
[Y2,V] = lda(P3.class1,P3.class2,P3.class3,2);
hold on;
figure(1);
[r,c] = size(P3.class1);
scatter(Y2(1,1:r),Y2(2,1:r),[],"blue","filled");
scatter(Y2(1,r+1:2*r),Y2(2,r+1:2*r),[],"magenta","filled");
scatter(Y2(1,2*r+1:3*r),Y2(2,2*r+1:3*r),[],"black","filled");
hold off;
fprintf('Projecting to 2 dimention\n');
mypause;
[Y1,V] = lda(P3.class1,P3.class2,P3.class3,1);
figure(2);
hold on;
subplot(3,1,1);
scatter(Y1(1,1:r),zeros(1,r),[],"blue","filled");
subplot(3,1,2);
scatter(Y1(1,r+1:2*r),zeros(1,r),[],"magenta","filled");
subplot(3,1,3);
scatter(Y1(1,2*r+1:3*r),zeros(1,r),[],"black","filled");
hold off;
fprintf('Projecting to 1 dimention\n');
mypause;
fprintf('Clearly the projection to 2 dimention is well separateable!\n');

%% Question 2.c two dimenstions
% calculating mu and sigma for each class
c1 = Y2(:,1:r)';
c2 = Y2(:,r+1:2*r)';
c3 = Y2(:,2*r+1:3*r)';

confMat2 = zeros(3,2);   %true positive,false positive
C = [c1,c2,c3];
scores = zeros(1,3);
sample = [2.6810 5.5635];
for i=1:3
    t1 = C(:,1:2);
    t2 = C(:,3:4);
    t3 = C(:,5:6);
    for j=1:50
        CVsample = t1(1,:);
        t1Mu = mean(t1);
        t2Mu = mean(t2);
        t3Mu = mean(t3);
        
        t1CovMat = cov(t1(:,1),t1(:,2));
        t2CovMat = cov(t2(:,1),t2(:,2));
        t3CovMat = cov(t2(:,1),t2(:,2));
    
        scores(1) = mvnpdf(CVsample,t1Mu,t1CovMat);
        scores(2) = mvnpdf(CVsample,t2Mu,t2CovMat);
        scores(3) = mvnpdf(CVsample,t2Mu,t3CovMat);
        [M,I] = max(scores);
        if(I==1)
            confMat2(i,1) = confMat2(i,1) + 1;
        else
            confMat2(i,2) = confMat2(i,2) + 1;
        end
        t1 = circshift(t1,-1);
    end
end
showBar(confMat2,'MDA: 2 dimentions');
%% Question 2.c one dimenstions
close all;
c1 = Y1(1:r)';
c2 = Y1(r+1:2*r)';
c3 = Y1(2*r+1:3*r)';

confMat1 = zeros(3,2);
C = [c1,c2,c3];
scores = zeros(1,3);

for i=1:3
    t1 = C(:,1);
    t2 = C(:,2);
    t3 = C(:,3);
    C = circshift(C,-1,2);
    for j=1:50
        CVsample = t1(1,1);
        pd11 = fitdist(t1(2:end,1),'Normal');
        pd21 = fitdist(t2(:,1),'Normal');
        pd31 = fitdist(t3(:,1),'Normal');
        
        scores(1) = normpdf(CVsample(1,1),pd11.mu,pd11.sigma);
        scores(2) = normpdf(CVsample(1,1),pd21.mu,pd21.sigma);
        scores(3) = normpdf(CVsample(1,1),pd31.mu,pd31.sigma);
        [M,I] = max(scores);
        if(I==1)
            confMat1(i,1) = confMat1(i,1) + 1;
        else
            confMat1(i,2) = confMat1(i,2) + 1;
        end
        t1 = circshift(t1,-1);
    end
end
showBar(confMat1,'MDA: 1 dimention');
%% 2.d MSE
confMatMSE = zeros(3,2);
c1 = P3.class1;
c2 = P3.class2;
c3 = P3.class3;

[r,c] = size(c1);
c1 = [ones(r,1) c1];
c2 = [ones(r,1) c2];
c3 = [ones(r,1) c3];

Y = [c1;c2;c3];

l1 = [1 0 0];
l2 = [0 1 0];
l3 = [0 0 1];
B = [repmat(l1,r,1);repmat(l2,r,1);repmat(l3,r,1)];
for i=1:150
    CVsample = Y(1,:);
    rowGroundTruth = B(1,:);
    groundTruth = find(rowGroundTruth(1,:));
    B(1,:) = [];
    Y(1,:) = [];
    A = pinv(Y)*B;
    score = CVsample*A;
    
    if( find(max(score) == score) == groundTruth)  
            confMatMSE(groundTruth,1) = confMatMSE(groundTruth,1) + 1;
    else
            confMatMSE(groundTruth,2) = confMatMSE(groundTruth,2) + 1;
    end
    B(3*r,:) = rowGroundTruth;
    Y(3*r,:) = CVsample;
end
showBar(confMatMSE,'MSE with original Data');

%% 2.d MSE  after MDA
% Initialization
clear;close all; clc
P3 = load('P3.mat');
[Y2,V] = lda(P3.class1,P3.class2,P3.class3,2);

confMatMSE = zeros(3,2);
c1 = Y2(:,1:50)';
c2 = Y2(:,51:100)';
c3 = Y2(:,101:150)';

[r,c] = size(c1);
c1 = [ones(r,1) c1];
c2 = [ones(r,1) c2];
c3 = [ones(r,1) c3];

Y = [c1;c2;c3];

l1 = [1 0 0];
l2 = [0 1 0];
l3 = [0 0 1];
B = [repmat(l1,r,1);repmat(l2,r,1);repmat(l3,r,1)];
for i=1:150
    CVsample = Y(1,:);
    rowGroundTruth = B(1,:);
    groundTruth = find(rowGroundTruth(1,:));
    B(1,:) = [];
    Y(1,:) = [];
    A = pinv(Y)*B;
    score = CVsample*A;
    
    if( find(max(score) == score) == groundTruth)  
            confMatMSE(groundTruth,1) = confMatMSE(groundTruth,1) + 1;
    else
            confMatMSE(groundTruth,2) = confMatMSE(groundTruth,2) + 1;
    end
    B(3*r,:) = rowGroundTruth;
    Y(3*r,:) = CVsample;
end
showBar(confMatMSE,'MSE on MDA');







 
 
 
 
 
 
 



