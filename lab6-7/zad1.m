%% Rozwiazanie petlami
% Parametry symulacji
L = 10;          
c = 5;           
T_max = 30;      
dx = 0.1;        
dt = 0.005;      

x = 0:dx:L;
n = length(x);
r = (c * dt) / dx; 


aktualny = 0.5 - 0.5 * cos(2 * pi / L * x); 

przeszly = aktualny; 

przyszly = zeros(1, n);

figure;
h_plot = plot(x, aktualny, 'LineWidth', 2);
axis([0 L -1.5 1.5]);
grid on;
xlabel('Pozycja x');
ylabel('Wysokosc h');

t_steps = T_max / dt;

tic;
for k = 1:t_steps
    for i = 2:n-1
        przyszly(i) = r^2 * (aktualny(i-1) + aktualny(i+1)) + ...
                      2 * (1 - r^2) * aktualny(i) - przeszly(i);
    end
    
    przyszly(1) = 0;
    przyszly(n) = 0;
    
    przeszly = aktualny;
    aktualny = przyszly;
    
    if mod(k, 1) == 0
        set(h_plot, 'YData', aktualny);
        title(['Symulacja struny - czas: ', num2str(k * dt, '%.2f')]);
        drawnow;
    end
end
czas_petlowy = toc;
fprintf('Czas wykonania operacji petlowych: %.4f s\n', czas_petlowy);

%% Rozwiazanie wektorowe
L = 10;          
c = 5;           
T_max = 30;      
dx = 0.1;        
dt = 0.005;      

x = 0:dx:L;
n = length(x);
r = (c * dt) / dx; 


aktualny = 0.5 - 0.5 * cos(2 * pi / L * x); 
przeszly = aktualny; 
przyszly = zeros(1, n);

figure('Name', 'Zadanie 1: Rozwiazanie wektorowe');
h_plot = plot(x, aktualny, 'LineWidth', 2);
axis([0 L -1.5 1.5]); grid on;
xlabel('Pozycja x'); ylabel('Wysokosc h');

t_steps = T_max / dt;

tic;  
for k = 1:t_steps

    przyszly(2:n-1) = r^2 * (aktualny(1:n-2) + aktualny(3:n)) + ...
                      2 * (1 - r^2) * aktualny(2:n-1) - przeszly(2:n-1);
    
    przyszly(1) = 0;
    przyszly(n) = 0;
    
    przeszly = aktualny;
    aktualny = przyszly;
    
    if mod(k, 20) == 0
        set(h_plot, 'YData', aktualny);
        title(['Wektorowo - Czas: ', num2str(k * dt, '%.2f')]);
        drawnow;
    end
end
czas_wektorowy = toc;  

fprintf('Czas wykonania operacji wektorowych: %.4f s\n', czas_wektorowy);