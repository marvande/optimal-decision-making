% Question 7
clear all; close all; clc; 

% The dataset (Diabetes dataset) contains a set for training/validation (X,Y) and a set purely
% to test the peformance (X_test,Y_test). The set X contains a matrix of
% inputs and Y are the corresponding outputs.  

X = csvread('X.csv');
Y = csvread('Y.csv');

X_test = csvread('X_test.csv'); 
Y_test = csvread('Y_test.csv'); 


%% Question 7.2 


Lambda = logspace(-1,-5,50);
trainsize = ... 

val_robust_MAE = zeros(size(Lambda,2),1); 
...

for i=1:size(Lambda,2)
   [thetai_robust,betai] = train_robust_MAE_lasso(X,Y,Lambda(i),trainsize);
   
   % find the zero indices of betai and construct the validation sets
   % (try to interpret the dual variables to see why we work with beta
   % here)
   zbetai = find(~betai); 
   X_val = X(zbetai,:);
   Y_val = Y(zbetai,:); 
   % find the non-zero indices of betai and construct the training sets 
   obetai = find(~~betai); 
   X_train = X(obetai,:);
   Y_train = Y(obetai,:); 
...
    theta_robust_opt = ... 
end

% plot the (cross-validation) results 
figCrosVal=figure;
loglog(Lambda, val_robust_MAE,'-ko') 
set(gca,'FontSize',10) 
grid on
xlabel('$\lambda$','interpreter','latex','FontSize',25);
ylabel('validation cost','interpreter','latex','FontSize',25); 

% Evaluate the peformance
training_MAE = ...
test_MAE = get_MAE(X_test,Y_test,theta_robust_opt)  

%% Declare functions 

% Make sure you return both theta and beta 
function [opt_robust_theta, opt_beta]=train_robust_MAE_lasso(X_train,Y_train,lambda,trainsize)
...

% Declare the decision variables 
...

% Declare the constraints
...

% Declare the objective
...

ops = sdpsettings('solver','linprog','verbose',0);
sol = optimize(con,obj,ops); 
opt_robust_theta = value(theta); 
opt_beta = value(beta); 
end

function c=get_MAE(X,Y,theta)
% This function should return the cost 
...
end
