

%%�ONESPHERE VER�SET� ���N ROC CURVE 

clear all;close;clc;
load ionosphere;  %binary classification

[m,n] = size(X);
Per = 0.80;
idx = transpose(randperm(m));
Training_X2= X(idx(1:round(Per*m)),:);
Training_Y2= Y(idx(1:round(Per*m)),:);   %Spilitting data
Testing_X2 = X(idx(round(Per*m)+1:end),:);
Testing_Y2= Y(idx(round(Per*m)+1:end),:);


temp = templateSVM('KernelFunction', 'linear');
model = fitcecoc(Training_X2, Training_Y2, 'Learner', temp);
[y1, score] = predict(model, Testing_X2);


result_of_matrice= confusionmat(Testing_Y2, y1); %Buradan skorlar�m� �ekece�im 


 
model2= ClassificationKNN.fit(Training_X2,Training_Y2,'NumNeighbors',13,'Distance','minkowski');
[y2,score2]=predict(model2, Testing_X2);
model3=fitctree(Training_X2,Training_Y2);  %SVM KNN DSC UYGULADIM.
[y3,score3]=predict(model3, Testing_X2);



%[~,score] = resubPredict(model);
%score(:,1) iyi hava sonucununun predict olas�l�g� vard�r burada. 
[X,Y] = perfcurve(Testing_Y2,score(:,1),model.ClassNames{1}); %ROC %havan�n iyi olmas�na gore roc �iziyor
%[X_1, Y_1] = perfcurve(Testing_Y2, score(:,1), 'LowFlow', 'XCrit', 'prec', 'YCrit', 'reca');%METR�C ROC



[X1,Y1]=perfcurve(Testing_Y2,score2(:,1),model2.ClassNames{1});
%[X_2, Y_2] = perfcurve(Testing_Y2, score2(:, 1), 'LowFlow', 'XCrit', 'prec', 'YCrit', 'reca');%METR�C ROC

[X2,Y2]=perfcurve(Testing_Y2,score3(:,1),model3.ClassNames{1});
%[X_3, Y_3] = perfcurve(Testing_Y2, score2(:, 1), 'LowFlow', 'XCrit', 'prec', 'YCrit', 'reca');%METR�C ROC

plot(X,Y);title('ROC CURVE FOR IONESPHERE DATASET');xlabel('False Pozitif ');ylabel('True Pozitif');
hold on
plot(X1,Y1);
plot(X2,Y2);
legend('SVM','KNN','DSC');


%plotting presicion recall roc curve

%plot(X_1,Y_1);title('ROC CURVE FOR IONESPHERE DATASET');xlabel('PRES�C�ON ');ylabel('RECALL');
% hold on
% plot(X_2,Y_2);
% plot(X_3,Y_3);
% legend('SVM','KNN','DSC');


%%
%%F�SHER�R�S DATASET� ���N ROC CURVE

clear all;close;clc;
load fisheriris;  %3 class

X = meas;
Y = species;

P = 0.80;
[m,n] = size(X);
idx = randperm(m);
Training_X = X(idx(1:round(P*m)),:);   %Randomizing Data
Training_Y= Y(idx(1:round(P*m)),:);
Testing_X = X(idx(round(P*m)+1:end),:);
Testing_Y = Y(idx(round(P*m)+1:end),:);

% VERS�COLOR CLASSINI BAZ ALINARAK ROC ��ZD�RD�M

%A�IKLAMA : Burada Multiclass classification oldu�u i�in d�rek b�r s�n�f�
%poz�t�f b�r s�n�f� negat�f olarak alam�yorum bu y�zden bir s�n�f� pozitif
%al�rken di�er ikisini pozitif almam gerekiyor.


temp = templateSVM('KernelFunction', 'linear');   %Aplied Svm
model = fitcecoc(Training_X, Training_Y, 'Learner', temp);
[y_pred1,score1] = predict(model, Testing_X);
diffscore = score1(:,1) - max(score1(:,2),score1(:,3));   
[X1,Y1] = perfcurve(Testing_Y,diffscore,model.ClassNames{1}); %SVM TPR FPR ROC


%KNN ROC




model2= ClassificationKNN.fit(Training_X,Training_Y,'NumNeighbors',13,'Distance','minkowski'); %KNN
[y_pred2,score2] = predict(model, Testing_X); 
diffscore2 = score2(:,1) - max(score2(:,2),score2(:,3)); %negatif durum lusturmak i�in ola�l�klar� c�kard�m
[X2,Y2] = perfcurve(Testing_Y,diffscore2,model.ClassNames{2}); %KNN ROC


%Score s�n�flar�n gelme olas�l�g�n� ver�r.ilk setosa o setonda gelme
%olas�l�d�r.


%DES�C�ON TREE ROC




model3=fitctree(Training_X,Training_Y);  
[y_pred3,score3] = predict(model, Testing_X);    %Desicion Tree
diffscore3 = score3(:,1) - max(score3(:,2),score3(:,3)); %ikisinin maks�ndan yenir bir row olu�turuyor.
[X3,Y3] = perfcurve(Testing_Y,diffscore3,model.ClassNames{2});
% 

%Plotting 
plot(X1,Y1);xlabel('False Positive Rate');ylabel('True Positive Rate');title('Fisheriris Dataset ROC Curves');
hold on
plot(X2,Y2);
plot(X3,Y3);
legend('SVM', 'KNN','DSC');

