% Zdefiniowanie przedzialu czasu: od 0 do 5 z krokiem 0.1
tspan = 0:0.1:5;

% Definicja ukladu rownan rozniczkowych
dydt = @(t, y) [y(2); -y(2) + 4*y(1) + sin(10*t)];

% Macierz stanow poczatkowych
Y0_macierz = [ -2, -1, 0,  1,  2 ; 
                0,  0, 0,  0,  0 ];

% Tylko warunki zerowe
figure(1);
y0_zero = [0; 0];
[t_z, y_z] = ode45(dydt, tspan, y0_zero);
x_z = y_z(:, 1);

plot(t_z, x_z, 'b', 'LineWidth', 2);
grid on;
title('Figura 1: Odpowiedz dla zerowych warunkow poczatkowych');
xlabel('Czas t');
ylabel('x(t)');
legend('x(0)=0, x''(0)=0');

% Dla roznych warunkow poczatkowych
figure(2);
hold on;
grid on;

for i = 1:size(Y0_macierz, 2)
    y0_temp = Y0_macierz(:, i);
    [t, y] = ode45(dydt, tspan, y0_temp);
    x = y(:, 1);
    
    etykieta = sprintf('x(0)=%d, x''(0)=%d', y0_temp(1), y0_temp(2));
    plot(t, x, 'LineWidth', 1.5, 'DisplayName', etykieta);
end

title('Figura 2: Odpowiedzi dla niezerowych warunkow poczatkowych');
xlabel('Czas t');
ylabel('x(t)');
legend('show', 'Location', 'best');
hold off;