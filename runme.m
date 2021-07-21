clear all
clc
load chennai_data.mat 
% load chennai_result.mat
parameters;
options = optimset('MaxFunEvals',10000, 'TolX', 1e-11,'MaxIter',1000);
k00 = [0.3, 0.00001, 0.0001, 0.01, 0.5, 0.001, 0.001, 0.1, 500]';
% k00=k0;


lb= [1e-5 1e-7 1e-7 1e-2 1e-2 1e-4 1e-9 1e-7 100];
ub= [0.5 0.1 0.1 1 1 0.1 0.01 1 15000];
         
[k0,ss0] = lsqnonlin(@covid_ss,k00,lb,ub,options,data); 
mse = ss0/(length(data.xdata)-10);
save('chennai_result.mat','k0','data')
