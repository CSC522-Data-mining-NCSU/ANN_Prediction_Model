
% This script assumes these variables are defined:
%
%   X_train - input data.
%   Y_train - target data.
clear
clc
load('data.mat')
%load('newData.mat')

%normalize data
maxX=max(Xtrain(:,1));
minX=min(Xtrain(:,1));
Xtrain(:,1) = (Xtrain(:,1) - minX)/(maxX-minX);

maxX=max(Xtrain(:,2));
minX=min(Xtrain(:,2));
Xtrain(:,2) = (Xtrain(:,2) - minX)/(maxX-minX);


maxX=max(Xtrain(:,3));
minX=min(Xtrain(:,3));
Xtrain(:,3) = (Xtrain(:,3) - minX)/(maxX-minX);


maxX=max(Xtrain(:,4));
minX=min(Xtrain(:,4));
Xtrain(:,4) = (Xtrain(:,4) - minX)/(maxX-minX);



mdl = fitcknn(Xtrain,Ytrain,'NumNeighbors',7,'Standardize',1);
yPreTrain = predict(mdl,Xtrain);
%%Error rate
error_rate_train = 1 - sum(yPreTrain == Ytrain)/length(Ytrain);



%%RMSE for training data
rmse_train = (yPreTrain-Ytrain);
rmse_train = rmse_train.*rmse_train;
rmse_train = sum(rmse_train)/length(rmse_train);
rmse_train = sqrt(rmse_train);

%%plot confusion matrix
cyPreTrain=yPreTrain;
cyPreTrain(:,1)=(yPreTrain==1);
cyPreTrain(:,2)=(yPreTrain==2);
cyPreTrain(:,3)=(yPreTrain==3);
cyPreTrain(:,4)=(yPreTrain==4);
cyPreTrain(:,5)=(yPreTrain==5);
cyPreTrain=cyPreTrain';
cYtrain=Ytrain;
cYtrain(:,1)=(Ytrain==1);
cYtrain(:,2)=(Ytrain==2);
cYtrain(:,3)=(Ytrain==3);
cYtrain(:,4)=(Ytrain==4);
cYtrain(:,5)=(Ytrain==5);
cYtrain=cYtrain';
figure,plotconfusion(cYtrain,cyPreTrain);



%normalize data
maxX=max(Xtest(:,1));
minX=min(Xtest(:,1));
Xtest(:,1) = (Xtest(:,1) - minX)/(maxX-minX);

maxX=max(Xtest(:,2));
minX=min(Xtest(:,2));
Xtest(:,2) = (Xtest(:,2) - minX)/(maxX-minX);


maxX=max(Xtest(:,3));
minX=min(Xtest(:,3));
Xtest(:,3) = (Xtest(:,3) - minX)/(maxX-minX);


maxX=max(Xtest(:,4));
minX=min(Xtest(:,4));
Xtest(:,4) = (Xtest(:,4) - minX)/(maxX-minX);


%%RMSE for testing data
yPredict = predict(mdl,Xtest);


%%Error rate
error_rate_test = 1 - sum(yPredict == Ytest)/length(Ytest);




rmse_test = (yPredict-Ytest);
rmse_test = rmse_test.*rmse_test;
rmse_test = sum(rmse_test)/length(rmse_test);
rmse_test = sqrt(rmse_test);



%%plot confusion matrix
cyPredict=yPredict;
cyPredict(:,1)=(yPredict==1);
cyPredict(:,2)=(yPredict==2);
cyPredict(:,3)=(yPredict==3);
cyPredict(:,4)=(yPredict==4);
cyPredict(:,5)=(yPredict==5);
cyPredict = cyPredict';
cYtest=Ytest;
cYtest(:,1)=(Ytest==1);
cYtest(:,2)=(Ytest==2);
cYtest(:,3)=(Ytest==3);
cYtest(:,4)=(Ytest==4);
cYtest(:,5)=(Ytest==5);
cYtest = cYtest';
figure,plotconfusion(cYtest,cyPredict);
