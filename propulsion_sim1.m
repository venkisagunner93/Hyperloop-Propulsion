close all;
clear all;
gamma=1.4;
M_dot=5.416;
Mach_exit=6.425;
P0=4000;
R=287;
T0=300;
Pc=9653000;
i=0.1;
j=1;
k=1;
step=1;
while Pc >= 4000
    if step<=500
        Exit_velocity(j)=0;
        Chamber_pressure(j)=Pc;
        signal(k)=0;
        Time(j)=i;
    else
        signal(k)=500;
        Exit_velocity(j) = sqrt(((2*R*gamma*T0)/(gamma-1))*(1-(4000/Pc)^((gamma-1)/gamma)));
        Chamber_pressure(j)=Pc;
        Pc=Pc-(9649000*0.001/2.075);
        Time(j)=i;
    end
    i=i+0.1;
    j=j+1;
    k=k+1;
    step=step+1;
end

figure(1)

plot(Time,Exit_velocity,'r','LineWidth',2)
hold on
plot(Time,signal,'g','LineWidth',2)
set(gca,'color',[0 0 0],'xcolor','w','ycolor','w')
set(gcf,'color',[0.5 0.5 0.5])
title('Exit Velocity vs Time','FontSize',20,'color',[1 1 1])
xlabel('Time (ms)','FontSize',16,'color',[1 1 1])
ylabel('Exit Velocity (m/s)','FontSize',16,'color',[1 1 1])
legend('Exit Velocity','Valve Mode')
lgd = legend;
c = lgd.TextColor;
lgd.TextColor = 'white';

figure(2)
plot(Time,Chamber_pressure/10000,'b','LineWidth',2)
hold on
plot(Time,signal,'g','LineWidth',2)
set(gca,'color',[0 0 0],'xcolor','w','ycolor','w')
set(gcf,'color',[0.5 0.5 0.5])

title('Tank Pressure vs Time','FontSize',20,'color',[1 1 1])
xlabel('Time (ms)','FontSize',16,'color',[1 1 1])
ylabel('Tank Pressure (kPa)','FontSize',16,'color',[1 1 1])
legend({'Tank Pressure','Valve Mode'},'Box','on','EdgeColor',[1 1 1])
lgd = legend;
c = lgd.TextColor;
lgd.TextColor = 'white';
