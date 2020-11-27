
clear all;close;clc;
load fisheriris 
%KFOLD FOR F�SHER�R�S SVM ALGOR�THM

X=meas;
Y=species;




y=numel(unique(Y));%metrik hesaplamas� �c�n kulland�m
presicion=zeros(1,5); %her k deger� �c�n opres�c�on ve  recall de�er�m farkl� gelecek bunlar� d�z�de tutuyorum.
recall=zeros(1,5);

temp = templateSVM('KernelFunction', 'linear');
model = fitcecoc(X,Y, 'Learner', temp);          %svm model�m
k=5;
for k=5:1:10
    cv = crossval(model,'Kfold',k);
    predicted=kfoldPredict(cv); %
    kfold_loss = kfoldLoss(cv); %foldlar�n ortalama lossunu al�yorum
    fprintf('Avg cross validation loss at k=%d, %.2f%%\n\n',k, kfold_loss*100);
   % fprintf('Presicion and Recall values for k = %d\n\n',k);
    result_of_matrice= confusionmat(Y, predicted); %Buradan skorlar�m� �ekece�im 
    [Metric_Table] = metrics(result_of_matrice,y);
    presicion(k-4)=Metric_Table{{'Average'},'Precision'};
    recall(k-4)= Metric_Table{{'Average'},'Recall'};

end
subplot(1,2,1)
plot([5:10],presicion,'m-o')
xlabel('K Values');ylabel('presicion')  %pres�c�on ve recal� plot ett�m 
grid minor
subplot(1,2,2)
plot([5:10],recall,'r-o')
xlabel('K Values');ylabel('recall')
grid minor
title('Presicion and Recall for SVM')
%%
%KFOLD FOR F�SHER�R�S KNN ALGOR�THM
clear all;close;clc;
load fisheriris 


X=meas;
Y=species;


y=numel(unique(Y));
presicion=zeros(1,5);
recall=zeros(1,5);
model = ClassificationKNN.fit(X,Y,'NumNeighbors',13,'Distance','minkowski');
   
 k=5;   

for k=5:1:10
    cv = crossval(model,'Kfold',k);
    predicted=kfoldPredict(cv); %
    kfold_loss = kfoldLoss(cv); %foldlar�n ortalama lossunu al�yorum
    fprintf('Avg cross validation loss at k=%d, %.2f%%\n\n',k, kfold_loss*100);
    result_of_matrice= confusionmat(Y, predicted); %Buradan skorlar�m� �ekece�im 
    [Metric_Table] = metrics(result_of_matrice,y);
    presicion(k-4)=Metric_Table{{'Average'},'Precision'};
    recall(k-4)= Metric_Table{{'Average'},'Recall'};
end
subplot(1,2,1)
plot([5:10],presicion,'m-o')
xlabel('K Values');ylabel('presicion')
grid minor
subplot(1,2,2)
plot([5:10],recall,'r-o')
xlabel('K Values');ylabel('recall')
grid minor
title('Presicion and Recall for KNN')
%%
%%KFOLD FOR F�SHER�R�S DES�C�ON TREE ALGOR�THM
clear all;close;clc;
load fisheriris 

X=meas;
Y=species;
y=numel(unique(Y));
presicion=zeros(1,5);
recall=zeros(1,5);
temp = templateSVM('KernelFunction', 'linear');
model = fitcecoc(X,Y, 'Learner', temp);
k=5; 
for k=5:1:10
    cv = crossval(model,'Kfold',k);
    predicted=kfoldPredict(cv); %
    kfold_loss = kfoldLoss(cv); %foldlar�n ortalama lossunu al�yorum
    fprintf('Avg cross validation loss at k=%d, %.2f%%\n\n',k, kfold_loss*100);
    result_of_matrice= confusionmat(Y, predicted); %Buradan skorlar�m� �ekece�im 
    [Metric_Table] = metrics(result_of_matrice,y);
    presicion(k-4)=Metric_Table{{'Average'},'Precision'};
    recall(k-4)= Metric_Table{{'Average'},'Recall'};
end
subplot(1,2,1)
plot([5:10],presicion,'m-o')
xlabel('K Values');ylabel('presicion')
grid minor
subplot(1,2,2)
plot([5:10],recall,'r-o')
xlabel('K Values');ylabel('recall')
grid minor
title('Presicion and Recall for Desicion Tree')
%%





%%KFOLD FOR Ionesphere SVM ALGOR�THM
clear all; close; clc;
load ionosphere.mat

X=X;
Y=Y;
y=numel(unique(Y));
presicion=zeros(1,5);
recall=zeros(1,5);
temp = templateSVM('KernelFunction', 'linear');
model = fitcecoc(X, Y, 'Learner', temp);
k=5; 

for k=5:1:10
    cv=crossval(model,'Kfold',k);
    predicted=kfoldPredict(cv);
    kfold_loss =kfoldLoss(cv);
    fprintf('Avg cross validation loss at k=%d, %.2f%%\n\n',k, kfold_loss*100);
    result_of_matrice= confusionmat(Y, predicted); %Buradan skorlar�m� �ekece�im 
    [Metric_Table] = metrics(result_of_matrice,y);
    presicion(k-4)=Metric_Table{{'Average'},'Precision'};
    recall(k-4)= Metric_Table{{'Average'},'Recall'};
end
subplot(1,2,1)
plot([5:10],presicion,'m-o')
xlabel('K Values');ylabel('presicion')
grid minor
subplot(1,2,2)
plot([5:10],recall,'r-o')
xlabel('K Values');ylabel('recall')
grid minor
title('Presicion and Recall for Desicion Tree')

%%
%%%%KFOLD FOR Ionesphere KNN ALGOR�THM

clear all;close;clc;
load ionosphere

y=numel(unique(Y));
presicion=zeros(1,5);
recall=zeros(1,5);

model = ClassificationKNN.fit(X,Y,'NumNeighbors',13,'Distance','minkowski'); %modelim
k=5;

for  k=5:1:10
    cv=crossval(model,'Kfold',k);
    predicted=kfoldPredict(cv); %Predict response for observations not used for training
    loss_value=kfoldLoss(cv);
    fprintf('Avg cross validation loss at k=%d, %.2f%%\n\n',k, loss_value*100);
    result_of_matrice= confusionma
    
 t(Y, predicted); %Buradan skorlar�m� �ekece�im 
    [Metric_Table] = metrics(result_of_matrice,y);
    presicion(k-4)=Metric_Table{{'Average'},'Precision'};
    recall(k-4)= Metric_Table{{'Average'},'Recall'};
end
    
subplot(1,2,1)
plot([5:10],presicion,'m-o')
xlabel('K Values');ylabel('presicion')
grid minor
subplot(1,2,2)
plot([5:10],recall,'r-o')
xlabel('K Values');ylabel('recall')
grid minor
title('Presicion and Recall for Desicion Tree')
   
%%
%%%%%KFOLD FOR Ionesphere Desicion Tree ALGOR�THM
clear all;close;clc;
load ionosphere

X=X;
Y=Y;

y=numel(unique(Y));
presicion=zeros(1,5);
recall=zeros(1,5);
k=5;
model=fitctree(X,Y);

for k=5:1:10
    cv=crossval(model,'Kfold',k);
    predicted=kfoldPredict(cv);
    loss_value=kfoldLoss(cv);
    fprintf('Avg cross validation loss at k=%d, %.2f%%\n\n',k, loss_value*100);
    result_of_matrice= confusionmat(Y, predicted); %Buradan skorlar�m� �ekece�im 
    [Metric_Table] = metrics(result_of_matrice,y);
    presicion(k-4)=Metric_Table{{'Average'},'Precision'};
    recall(k-4)= Metric_Table{{'Average'},'Recall'};
end

subplot(1,2,1)
plot([5:10],presicion,'m-o')
xlabel('K Values');ylabel('presicion')
grid minor
subplot(1,2,2)
plot([5:10],recall,'r-o')
xlabel('K Values');ylabel('recall')
grid minor
title('Presicion and Recall for Desicion Tree' )



    





