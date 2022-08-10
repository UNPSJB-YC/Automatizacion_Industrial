clc
clear
%{
Para obtener valores en tiempo real por un periódo determinado se creó este
script, dónde se coloca el tiempo a muestrear (tiempo_muestra) en segundos
y un nombre para que se genere automáticamente un archivo csv que luego
puede ser abierto con "Graficos.m" o "distintos_PID.m" o "metodo_string.m"
 Se debe tener configurado un cliente OPC.
%}
%% SIMULINK Y MUESTRA DE GRAFICOS
tiempo_muestra = 5;
nombre='Carpeta01/P_01.csv';

tiempo_muestra_c = string(tiempo_muestra);
open_system('LECTURA_DATOS_OPC_V3/Scope');
set_param(gcs,'SimulationMode','normal','StopTime',tiempo_muestra_c);
set_param(gcs,'SimulationCommand','start');
pause(tiempo_muestra+2);

A=ScopeData.signals.values(:,1);
B=ScopeData.signals.values(:,2);
C=ScopeData.signals.values(:,3);
D=ScopeData.signals.values(:,4);
E=ScopeData.signals.values(:,5);
F=ScopeData.signals.values(:,6);
G=ScopeData.signals.values(:,7);
H=ScopeData.signals.values(:,8);
I=ScopeData.signals.values(:,9);
J=ScopeData.signals.values(:,10);
K=ScopeData.signals.values(:,11);
L=ScopeData.signals.values(:,12);
M=ScopeData.signals.values(:,13);
N=ScopeData.signals.values(:,14);
T=ScopeData.time;
AA=ScopeData.signals.values;
AA(:,15)= T;

%figure(1)
plot(T,A,T,B,T,C,T,G)
csvwrite(nombre,AA)