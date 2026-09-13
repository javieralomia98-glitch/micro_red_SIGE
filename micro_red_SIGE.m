
%% PROYECTO SIGE: Sistema Inteligente de Gestion Energetica
% Modelo de una micro-red regional durante 24 horas.
% Estudiante: [Escriba su nombre]
% Curso: MATLAB - UNAD

clc;
clear;
close all;

%% Definicion del vector de tiempo
% Cada posicion representa una hora del dia.
horas = 1:24;

%% Generacion solar (kW)
% La produccion solar es cero durante la noche.
% El pico maximo de 25 kW se alcanza a las 12:00.

generacion_solar = [ ...
    0 0 0 0 0 ...       % Horas 1 a 5
    3 6 10 15 20 24 ... % Horas 6 a 11
    25 ...               % Hora 12: pico solar
    24 20 15 10 6 3 ... % Horas 13 a 18
    0 0 0 0 0 0];        % Horas 19 a 24

%% Generacion eolica de 4 aerogeneradores (kW)
% Se simulan variaciones irregulares del viento.
% La potencia total no supera los 15 kW.

generacion_eolica = [ ...
    8 10 7 12 9 6 ...
    11 13 8 10 14 9 ...
    12 7 11 15 10 8 ...
    13 9 6 12 10 7];

%% Generacion hibrida total (kW)
% Se suman los vectores solar y eolico.
% Cada posicion representa la misma hora del dia.

generacion_total = generacion_solar + generacion_eolica;

%% Demanda electrica de la comunidad (kW)
% Horas 1 a 5 y 22 a 24: consumo nocturno entre 2 y 4 kW.
% Horas 6 a 17: consumo diurno entre 6 y 10 kW.
% Horas 18 a 21: pico de demanda de 15 kW.

demanda_comunidad = [ ...
    3 2 4 3 2 ...        % Horas 1 a 5
    6 7 8 9 8 10 9 8 ... % Horas 6 a 13
    7 8 9 10 ...         % Horas 14 a 17
    15 15 15 15 ...      % Horas 18 a 21
    4 3 2];              % Horas 22 a 24

%% Calculo del balance energetico
% Un valor positivo indica excedente de generacion.
% Un valor negativo indica que la demanda supera la generacion.

balance_energetico = generacion_total - demanda_comunidad;

%% Visualizacion grafica
% Se representan la generacion total y la demanda
% en una misma ventana con diferentes colores.

figure;

plot(horas, generacion_total, '-ob', ...
    'LineWidth', 2, 'MarkerSize', 5);
hold on;

plot(horas, demanda_comunidad, '-sr', ...
    'LineWidth', 2, 'MarkerSize', 5);

title('Comportamiento energetico de la micro-red regional');
xlabel('Tiempo en horas');
ylabel('Potencia en Kilovatios (kW)');

legend('Generacion Total', 'Demanda de la Comunidad', ...
    'Location', 'northwest');

grid on;
xticks(1:24);
xlim([1 24]);

hold off;

%% Grafica adicional del balance energetico
% Permite identificar las horas con excedente o deficit.

figure;

plot(horas, balance_energetico, '-^k', ...
    'LineWidth', 2, 'MarkerSize', 5);

title('Balance energetico de la micro-red');
xlabel('Tiempo en horas');
ylabel('Balance de Potencia (kW)');

grid on;
xticks(1:24);
xlim([1 24]);
yline(0, '--r', 'Referencia cero');

%% 9. Resultados en la ventana de comandos
% Se muestran los vectores utilizados en la simulacion.

disp('Vector de generacion solar (kW):');
disp(generacion_solar);

disp('Vector de generacion eolica (kW):');
disp(generacion_eolica);

disp('Vector de generacion total (kW):');
disp(generacion_total);

disp('Vector de demanda de la comunidad (kW):');
disp(demanda_comunidad);

disp('Vector de balance energetico (kW):');
disp(balance_energetico);