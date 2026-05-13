close all;clear all;
A = 7;
B = 5;
t_sim = 100;
step_out = 5;
step_PID = 5;
step_in = 5;

[model] = sim("schemat.slx", t_sim);

%% Nieliniowosc na wejsciu
figure();

hold on;
grid on;
xlabel('Time (s)');
ylabel('Output');
title('Simulation Results');
plot(model.tout,model.basic,"LineWidth",1.5);
plot(model.tout,model.backlash,"LineWidth",1.5);
plot(model.tout,model.deadzone,"LineWidth",1.5);
plot(model.tout,model.ratelimiter,'--',"LineWidth",1.5);
plot(model.tout,model.relay,'--',"LineWidth",1.5);
plot(model.tout,model.saturation,'--',"LineWidth",1.5);

legend("basic", "backlash", "deadzone", "ratelimiter", "relay", "saturation");

%% Nieliniowosc na wyjsciu

figure();
hold on;
grid on;
xlabel('Time (s)');
ylabel('Output');
title('Simulation Results');
plot(model.tout,model.basic,"LineWidth",1.5);
plot(model.tout,model.outSaturation,"LineWidth",1.5);
plot(model.tout,model.dynamicSaturation,"LineWidth",1.5);


legend("basic", "saturation", "dynamicSaturation");

%% PID

figure();
hold on;
grid on;
xlabel('Time (s)');
ylabel('Output');
title('Simulation Results');
plot(model.tout,model.PID,"LineWidth",1.5);
plot(model.tout,model.PIDBacklash,"LineWidth",1.5);
