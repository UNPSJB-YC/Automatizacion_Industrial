%% Ejemplo 
%{
https://rua.ua.es/dspace/bitstream/10045/18965/1/Identificacion%20experimental%20de%20sistemas.pdf
pág7
%} 
clc;
clear;
%% DATOS DE LA PLANTA - Modificar
Dy=202-114.5; %
Du=700; % 
tu=68.9-68; %
ta=72.8-68.9; %
TS=68-67;%
%% ESTIMACIÓN DE LA PLANTA
% No modificar
tu1=tu;
kS= Dy/Du;
f=tu1/ta;
if (0.052<f)&&(f<=0.162)
    n=2;
    tS1=ta/2.7;
    tS2=tu1/0.28;
elseif (0.162<f)&&(f<=0.27)
    n=3;
    tS1=ta/3.7;
    tS2=tu1/0.8;
elseif (0.27<f)&&(f<=0.365)
    n=4;    
    tS1=ta/4.46;
    tS2=tu1/1.42;
elseif (0.365<f)&&(f<=0.455)
    n=5;
    tS1=ta/5.12;
    tS2=tu1/2.1;
else
    print('error');
end
%% Datos a mostrar
s=tf('s');
kS %ganancia
tS1 %tau 1  
tS2 %tau 2  
TS %retardo
S1=(kS/(tS1*s+1)^n)*exp(-TS*s); %prueba con tau 1
S2=(kS/(tS2*s+1)^n)*exp(-TS*s); %prueba con tau 2
S1_apro=pade(S1,1); %aproxima el retardo como un cero
S2_apro=pade(S2,1); 
[nS1,dS1] = tfdata(S1,'v');%num y den para utilizar en Simulink falta colocar el retardo
[nS2,dS2] = tfdata(S2_apro,'v'); %num y den para utilizar en Simulink con el retardo aproximado
