% Definicja transmitancji G(s) = 7 / (5s^2 + s + 1)
A = 7;
B = 5;
num = [A];
den = [B 1 1];
G = tf(num, den);

% Automatyczny dobor nastaw PID
C = pidtune(G, 'PID');

disp('Wyznaczone nastawy:');
disp(['Kp = ', num2str(C.Kp)]);
disp(['Ki = ', num2str(C.Ki)]);
disp(['Kd = ', num2str(C.Kd)]);