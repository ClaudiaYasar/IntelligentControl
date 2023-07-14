
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Plot temperature Exp_2 measurement obtain FOPDT parameters to
%%%%%%%%%%%% step input
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc;clear all;
load ('Exp_2.mat')
figure(1)

plot(t,Temperature,'r-','LineWidth',2);
ylabel('Measured Temperature (Celsius)');
legend('Measured');
axis tight

dy=Temperature(end)-Temperature(1);
du=90;
Kp=dy/du;
dead_time=22-9;
y_tao=Temperature(1)+0.632*dy;
Tao=145.2-22;