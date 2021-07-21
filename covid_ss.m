function ss = covid_ss(param,data)
parameters
load chennai_data.mat
time = data.xdata;
cum_deaths = data.ldata;
deaths = data.wdata;

observe=[deaths; cum_deaths];


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
ss=observe-ymodel;