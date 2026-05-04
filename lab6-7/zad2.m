L = 2;           
c = 1;            
T_max = 30;      
dx = 0.05;       
dt = 0.01;

x = 0:dx:L;
n = length(x);
r = (c * dt) / dx;

aktualny = zeros(1, n); 
przeszly = zeros(1, n);
przyszly = zeros(1, n);

figure;
h_plot = plot(x, aktualny, 'LineWidth', 2);
axis([0 L -2 2]); 
grid on;
xlabel('Pozycja x');
ylabel('Wysokosc h');

t_steps = T_max / dt;

for k = 1:t_steps
    t_now = k * dt;
    
    for i = 2:n-1
        przyszly(i) = r^2 * (aktualny(i-1) + aktualny(i+1)) + ...
                      2 * (1 - r^2) * aktualny(i) - przeszly(i);
    end
    
    % Lewy koniec
    przyszly(1) = sin(2 * t_now);
    
    % Prawy koniec
    przyszly(n) = sin(3 * t_now);
    
    % Przesuniecie w czasie
    przeszly = aktualny;
    aktualny = przyszly;
    
    if mod(k, 15) == 0
        set(h_plot, 'YData', aktualny);
        title(['Symulacja skakanki - czas: ', num2str(t_now, '%.2f')]);
        drawnow;
    end
end