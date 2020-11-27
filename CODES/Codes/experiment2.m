clear all; close; clc;

load fisheriris


%SPL�TT�NG F�SHER�R�S DATASET
X = meas(:,:);
Y = species;

P = 0.80;
[m,n] = size(X);
idx = randperm(m);
Training_X = X(idx(1:round(P*m)),:);
Training_Y= Y(idx(1:round(P*m)),:);
Testing_X = X(idx(round(P*m)+1:end),:);
Testing_Y = Y(idx(round(P*m)+1:end),:);



%US�NG SVM for F�SHER�R�S DATASET

%clas_value = unique(Training_Y);%sinifllar�m
y=numel(unique(Training_Y));

temp = templateSVM('KernelFunction', 'linear');
model = fitcecoc(Training_X, Training_Y, 'Learner', temp);
y_pred = predict(model, Testing_X);

result_of_matrice= confusionmat(Testing_Y, y_pred); %Buradan skorlar�m� �ekece�im 
 
[Metric_Table] = metrics(result_of_matrice,y);
disp('Metrics: ')
disp(Metric_Table)

%%
%US�NG KNN for F�SHER�R�S DATASET

clear all; close; clc;

load fisheriris


X = meas(:,:);
Y = species;

[m,n] = size(X);
P = 0.80;
idx = randperm(m);
Training_X = X(idx(1:round(P*m)),:);
Training_Y= Y(idx(1:round(P*m)),:);
Testing_X = X(idx(round(P*m)+1:end),:);
Testing_Y = Y(idx(round(P*m)+1:end),:);
y=numel(unique(Training_Y));


model = ClassificationKNN.fit(Training_X,Training_Y,'NumNeighbors',13,'Distance','minkowski');
% make a prediction based on the model
predicted = predict(model, Testing_X);

result_of_matrice= confusionmat(Testing_Y, predicted); %Buradan skorlar�m� �ekece�im 
 
[Metric] = metrics(result_of_matrice,y);
disp('Metrics: ')
disp(Metric)


%%
%US�NG Desicion TREES for F�SHER�R�S DATASET

clear all; close; clc;

load fisheriris


X = meas(:,:);
Y = species;

[m,n] = size(X);
P = 0.80;
idx = randperm(m);
Training_X = X(idx(1:round(P*m)),:);
Training_Y= Y(idx(1:round(P*m)),:);
Testing_X = X(idx(round(P*m)+1:end),:);
Testing_Y = Y(idx(round(P*m)+1:end),:);
y=numel(unique(Training_Y));


model = fitctree(Training_X,Training_Y);        %Fit the dataset using decision tree 
predict = predict(model,Testing_X);
result_of_matrice= confusionmat(Testing_Y, predict); %Buradan skorlar�m� �ekece�im 
 
[Metric] = metrics(result_of_matrice,y);
disp('Metrics: ')
disp(Metric)


%%
%SVM FOR IONOSPHERE DATASET
clear all; close; clc;
load ionosphere.mat

[m n]=size(X);
P = 0.80;
idx = transpose(randperm(m));
Training_X =X(idx(1:round(P*m)),:);
Training_Y= Y(idx(1:round(P*m)),:);
Testing_X =X(idx(round(P*m)+1:end),:);
Testing_Y = Y(idx(round(P*m)+1:end),:);

y=numel(unique(Training_Y));

temp = templateSVM('KernelFunction', 'linear');
model = fitcecoc(Training_X, Training_Y, 'Learner', temp);
y_pred = predict(model, Testing_X);

result_of_matrice= confusionmat(Testing_Y, y_pred); %Buradan skorlar�m� �ekece�im 
 
[Metric_Table] = metrics(result_of_matrice,y);
disp('Metrics: ')
disp(Metric_Table)
%%
%KNN for IONOSPHERE DATASET

y=numel(unique(Training_Y));
[m n]=size(X);
P = 0.80;


model = ClassificationKNN.fit(Training_X,Training_Y,'NumNeighbors',13,'Distance','minkowski');
predict=predict(model,Testing_X);
result_of_matrice= confusionmat(Testing_Y,predict); %Buradan skorlar�m� �ekece�im 
 
[Metric_Table] = metrics(result_of_matrice,y);
disp('Metrics: ')
disp(Metric_Table)
%%
%DES�C�ON TREE for IONOSPHERE DATASET

clear all; close; clc;
load ionosphere.mat

[m n]=size(X);
P = 0.80;
idx = transpose(randperm(m));
Training_X =X(idx(1:round(P*m)),:);
Training_Y= Y(idx(1:round(P*m)),:);
Testing_X =X(idx(round(P*m)+1:end),:);
Testing_Y = Y(idx(round(P*m)+1:end),:);

y=numel(unique(Training_Y));
model2 = fitctree(Training_X,Training_Y);        %Fit the dataset using decision tree 
predicted = predict(model2,Testing_X);
result_of_matrice= confusionmat(Testing_Y, predicted); %Buradan skorlar�m� �ekece�im 
 
[Metric] = metrics(result_of_matrice,y);
disp('Metrics: ')
disp(Metric)


