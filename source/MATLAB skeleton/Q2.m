% Question 2 
clear all; close all; clc; 

% The dataset (Diabetes dataset) contains a set for training/validation (X,Y) and a set purely
% to test the peformance (X_test,Y_test). The set X contains a matrix of
% inputs and Y are the corresponding outputs. 

X = csvread('X.csv');
Y = csvread('Y.csv');

X_test = csvread('X_test.csv'); 
Y_test = csvread('Y_test.csv'); 


%% Question 2.2

lambda = 0.5; 

% Train the model 
theta_MAE=train_MAE_lasso(X,Y,lambda);

% Evaluate the peformance
training_MAE = get_MAE(X,Y,theta_MAE) 
test_MAE = get_MAE(X_test,Y_test,theta_MAE)  


%% Question 2.3 

% Split the data (X,Y) 
Lambda = logspace(-1,-5,50); 
trainsize = 0.75; 
[X_train, X_val, Y_train, Y_val] = train_test_split(X, Y, trainsize);

% initialize the optimal costs and decision variables 
val_MAE = zeros(size(Lambda,2),1); 
...

% peform the cross-validation
for i=1:size(Lambda,2)
...
    theta_MAE_opt = ... 
end


% Evaluate the peformance
training_MAE = get_MAE(X_train,Y_train,theta_MAE_opt) 
test_MAE = get_MAE(X_test,Y_test,theta_MAE_opt)  

% plot the results 
figCrosVal=figure;
loglog(Lambda, val_MAE,'-ko') 
set(gca,'FontSize',10) 
grid on
xlabel('$\lambda$','interpreter','latex','FontSize',25);
ylabel('validation cost','interpreter','latex','FontSize',25);

%% Declare functions 

function opt_theta=train_MAE_lasso(X_train,Y_train,lambda)
N = size(X_train,1);
ones_N = ones(N,1); 
% Add a column of ones to X to remove any bias (see the project page 1) 
X_train = [X_train ones_N]; 

% Declare the decision variables 
...

% Declare the constraints
...

% Declare the objective
... 

% Select any solver of your choice 
ops = sdpsettings('solver','linprog','verbose',0);
sol = optimize(con,obj,ops); 
opt_theta = value(theta); 
end

function c=get_MAE(X,Y,theta)
% This function should return the cost for some theta evaluated on some data X,Y
...
end

function [X_train, X_val, Y_train, Y_val] = train_test_split(X, Y, trainsize)
% You may implement any splitting method 
...
end
