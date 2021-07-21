function ydot = covid_ode(t,y,param)
parameters;

S = y(1);
E = y(2);
I_u = y(3);
I_n = y(4);
I_h = y(5);
R = y(6);
V = y(7);

beta1 = param(1);
beta2 = param(2);
eta_u = param(3);
eta_n = param(4);
sigma_h = param(5);
delta_h = param(6);
alpha_u = param(7);
alpha_n = param(8);

N=S+E+I_u+I_n+I_h+R;

dotS=pi1-((beta1*S*(I_u + nu1*I_n))/(N)) - (beta2*S*V) - mu1*S + theta1*R;
dotE=((beta1*S*(I_u + nu1*I_n))/(N)) + (beta2*S*V) -(gamma1+mu1)*E;
dotI_u=(1-p)*gamma1*E - (eta_u+sigma_u+mu1)*I_u;
dotI_n=p*gamma1*E - (eta_n+sigma_n+mu1+delta_n)*I_n;
dotI_h=eta_u*I_u + eta_n*I_n - (sigma_h+delta_h+mu1)*I_h;
dotR=sigma_u*I_u + sigma_n*I_n + sigma_h*I_h - (theta1+mu1)*R;
dotV=alpha_u*I_u+alpha_n*I_n - mu_c*V;
ydot=[dotS;dotE;dotI_u;dotI_n;dotI_h;dotR;dotV];
end