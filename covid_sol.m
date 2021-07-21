function y=covid_sol(time,param,y0)
parameters;
T=length(time);

delta_h = param(6);

[t,y2] = ode15s(@covid_ode,1:0.1:T,y0,[],param);
y1=interp1(t,y2,time,'spline');
E=y1(:,2); I_n=y1(:,4); I_h=y1(:,5);

P=p.*gamma1.*E;
Q=delta_n.*I_n+delta_h.*I_h;

L=length(time);
New_cases=zeros(L,1);
New_deaths=zeros(L,1);
Cumulative_cases=zeros(L,1);
Cumulative_deaths=zeros(L,1);
New_cases(1)= I_n(1); 
New_deaths(1)= delta_n*I_n(1)+delta_h*I_h(1);
Cumulative_cases(1)=New_cases(1);
Cumulative_deaths(1)=New_deaths(1);
 for i=1:(L-1)
     New_cases(i+1)=trapz(P(i:i+1));
     Cumulative_cases(i+1)=Cumulative_cases(i)+New_cases(i+1);
     New_deaths(i+1)=trapz(Q(i:i+1));
     Cumulative_deaths(i+1)=Cumulative_deaths(i)+New_deaths(i+1);
end
y=[New_deaths; Cumulative_deaths];
