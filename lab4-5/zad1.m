% Definicja równania różniczkowego dx/dt = 3e^(-t)
dxdt = @(t, x) 3 * exp(-t);

% Zdefiniowanie przedziału czasu: od 0 do 5 z krokiem 0.1
tspan = 0:0.1:5;

%% Rozwiązanie dla wartości początkowej x(0) = 0
x0 = 0; 

[t, x] = ode45(dxdt, tspan, x0);

figure(1);
plot(t, x, 'b-', 'LineWidth', 2);
grid on;
xlabel('Czas t');
ylabel('Wartość x(t)');
title('Odpowiedź układu dla x(0) = 0');
legend('x(t)');

%% Modyfikacja dla zdefiniowanego wektora stanów początkowych

% wektor stanów początkowych
x0_wektor = [-2, -1, 0, 1, 2];

figure(2);
hold on; 
grid on;
xlabel('Czas t');
ylabel('Wartość x(t)');
title('Odpowiedzi układu dla wektora stanów początkowych');

% Pętla iterująca po wszystkich warunkach początkowych
for i = 1:length(x0_wektor)
    [t, x_temp] = ode45(dxdt, tspan, x0_wektor(i));
    
    plot(t, x_temp, 'LineWidth', 1.5, 'DisplayName', ['x(0) = ', num2str(x0_wektor(i))]);
end

legend('show', 'Location', 'best');
hold off;