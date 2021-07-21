clear all
clc
load chennai_result.mat
time=data.xdata;
parameters;
param=k0;
% initial states
S0=0.7*N1;
E0=param(9);
I_u0=500;
I_n0=189;
I_h0=10;
R0=1000;
V0=1e-7;
y0=[S0,E0,I_u0,I_n0,I_h0,R0,V0];
ymodel = covid_sol(time,param,y0);

figure(1)
plot(time, ymodel(1:92))
hold on
plot(data.xdata, data.wdata,'ro')

figure(2)
plot(time, ymodel(93:end))
hold on
plot(data.xdata, data.ldata,'ro')