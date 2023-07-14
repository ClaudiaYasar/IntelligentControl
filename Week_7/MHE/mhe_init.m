function msg = mhe_init()

s = 'http://byu.apmonitor.com';
b = 'mhe';

apm(s,b,'clear all');

% load model and data file
apm_load(s,b,'model.apm');
csv_load(s,b,'mhe.csv'); % data for the moving horizon estimator

% configure MV / CV  -parameter and state variables-
apm_info(s,b,'FV','U');
apm_info(s,b,'FV','tau');
apm_info(s,b,'FV','a1');
apm_info(s,b,'FV','a2');
apm_info(s,b,'MV','Q1');
apm_info(s,b,'MV','Q2');
apm_info(s,b,'SV','TH1');
apm_info(s,b,'SV','TH2');
apm_info(s,b,'CV','TC1');
apm_info(s,b,'CV','TC2');

% tune FVs
apm_option(s,b,'U.dmax',1.0);
apm_option(s,b,'U.lower',5);
apm_option(s,b,'U.upper',15);

apm_option(s,b,'tau.dmax',1.0);
apm_option(s,b,'tau.lower',4.0);
apm_option(s,b,'tau.upper',8.0);

apm_option(s,b,'a1.dmax',0.001);
apm_option(s,b,'a1.lower',0.003);
apm_option(s,b,'a1.upper',0.03);

apm_option(s,b,'a2.dmax',0.001);
apm_option(s,b,'a2.lower',0.002);
apm_option(s,b,'a2.upper',0.02);

% turn on FVs as degrees of freedom, later
apm_option(s,b,'U.status',0);
apm_option(s,b,'tau.status',0);
apm_option(s,b,'a1.status',0);
apm_option(s,b,'a2.status',0);

apm_option(s,b,'U.fstatus',0);
apm_option(s,b,'tau.fstatus',0);
apm_option(s,b,'a1.fstatus',0);
apm_option(s,b,'a2.fstatus',0);

% read Q, don't let optimize use MV
apm_option(s,b,'Q1.status',0);
apm_option(s,b,'Q1.fstatus',1);  % measured

apm_option(s,b,'Q2.status',0);
apm_option(s,b,'Q2.fstatus',1); % measured

% include CV in objective function
apm_option(s,b,'TC1.status',1);
apm_option(s,b,'TC1.fstatus',1);
%apm_option(s,b,'TC1.meas_gap',0.5);

apm_option(s,b,'TC2.status',1);
apm_option(s,b,'TC2.fstatus',1);
%apm_option(s,b,'TC2.meas_gap',0.5);

% web-viewer option, update every second
apm_option(s,b,'apm.web_plot_freq',3);  % 3 is how frequently it updates

% dynamic estimation -estimation options-
apm_option(s,b,'apm.imode',5);  % Moving Horizon
apm_option(s,b,'apm.ev_type',2); %sqrt error
apm_option(s,b,'apm.nodes',3); % 3 nodes per time step
apm_option(s,b,'apm.solver',3);  % apm solver
apm_option(s,b,'apm.coldstart',1);  % apm cold start

msg = 'initialization complete';

end