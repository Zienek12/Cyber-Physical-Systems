clear; clc; close all;

A = [ 0, 1; -5, 0]; %Recznie zmieniane macierze stanu
tspan = [0 0.1]; % Przedzial czasu dla symulacji
%Utworzenie siatki punktow w przestrzeni stanow
[x1, x2] = meshgrid(-6: 0.5: 6, -6: 0.5: 6);
% Inicjalizacja macierzy składowych poziomej/pionwej wektorow
u = zeros(size(x1));
v = zeros(size(x1));

% Obliczanie pochodnych w kazdym punkcie siatki
for i = 1:numel(x1)
    dx = A * [x1(i); x2(i)];
    u(i) = dx(1);
    v(i) = dx(2);
end

figure;
quiver(x1,x2,u,v,'r');
hold on;
grid on;
xlabel('x1');
ylabel('x2');
title("Portret fazowy układu");

% Przygotowanie warunkow poczatkowych rozlozonych na okregu
katy = linspace(0, 2*pi, 12);
promien = 4;
stan_pocz = [promien*cos(katy)', promien*sin(katy)'];

% Rozwiazywanie rownan i nanoszenie trajktorii na wykres
for i = 1:size(stan_pocz, 1)
    [t,x] = ode45(@(t,x) A*x, tspan, stan_pocz(i, :));
    plot(x(:, 1), x(:,2), 'b', 'LineWidth', 1.5);
    plot(x(1,1), x(1,2), 'go');
end
hold off;