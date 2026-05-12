clear all; close all; clc;

L = 10;          % Szerokosc jeziora 
c = 1;           % Predkosc propagacji
T_max = 30;      % Czas symulacji 
dx = 0.1;        % Krok przestrzenny
dt = 0.001;       % Krok czasowy  

x = 0:dx:L;
n = length(x);
r = (c * dt) / dx; % Wspolczynnik stabilnosci 

% Tworzenie tafli jeziora 
aktualny = zeros(1, n);
idx_3 = round(1/dx) + 1;
idx_4 = round(5/dx) + 1;
zakres = linspace(0, 2*pi, idx_4 - idx_3 + 1);
aktualny(idx_3:idx_4) = -0.5 + 0.5 * cos(zakres);

przeszly = aktualny; 
przyszly = zeros(1, n);

figure('Name', 'Zadanie 3: Idealne odbicie fali');
h_plot = plot(x, aktualny, 'LineWidth', 2);
axis([0 L -1.2 1.2]); grid on;
xlabel('Pozycja x'); ylabel('Wysokosc h');

t_steps = T_max / dt;

for k = 1:t_steps
    przyszly(1) = 2*r^2 * aktualny(2) + 2*(1-r^2) * aktualny(1) - przeszly(1);
    
    for i = 2:n-1
        przyszly(i) = r^2 * (aktualny(i-1) + aktualny(i+1)) + ...
                      2 * (1 - r^2) * aktualny(i) - przeszly(i);
    end
    
    przyszly(n) = 2*r^2 * aktualny(n-1) + 2*(1-r^2) * aktualny(n) - przeszly(n);
    
    przeszly = aktualny;
    aktualny = przyszly;
    
    if mod(k, 20) == 0
        set(h_plot, 'YData', aktualny);
        title(['Symulacja jeziora - Czas: ', num2str(k * dt, '%.2f')]);
        drawnow;
    end
end
