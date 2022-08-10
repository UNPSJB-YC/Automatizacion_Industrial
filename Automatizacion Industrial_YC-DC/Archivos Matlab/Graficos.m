
%% Ayuda
%{
¿Que hace este archivo?
El siguiente programa sirve para generar gráficos a partir de los archivos
que se encuentran dentro de la carpeta Ejemplos, o archivos generados con
Levanto_datos .
Dependiendo de que variable haya estado controlada en ese archivo, mostrará
el valor de referencia para dicho sistema.
Alerta: Para comenzar borra toda la memoria de
matlab.
 
¿Como se utiliza?
Colocar en "name" la carpeta y el nombre del archivo que se desea
procesar.
Dar correr el programa, se abrirá los gráficos y se guardarán en la carpeta
Ejemplos/imagenes/.
%}
clc;
clear;
name='Ejemplos/P_13.csv'; %archivo a evaluar

%% Referencias
Z=csvread(name);
A=Z(:,1); %%TT001
B=Z(:,2); %%PIT01
C=Z(:,3); %%PIT02
D=Z(:,4); %%FT01
E=Z(:,5); %%REF_VELOCIDAD
F=Z(:,6); %%VELOCIDAD_ACTUAL
G=Z(:,7); %%FREC_MOTOR
H=Z(:,8); %%PID_SEL
I=Z(:,9); %%MANUAL_AUTO
J=Z(:,10); %%ACCION_DE_CONTROL
K=Z(:,11); %%VALOR_MANUAL_PID
L=Z(:,12); %%SETPOINT_FT01
M=Z(:,13); %%SETPOINT_PIT01
N=Z(:,14); %%SETPOINT_PIT02
T=Z(:,15); %%TIEMPO

 %% Graficos
figure(1) %PIT01
if H(:,1)== 0
    plot(T,B,T,M)
    legend({'PIT01','REF PIT01'},'Location','southeast')
else
    plot(T,B)
    legend({'PIT01'},'Location','southeast')
end
title('PRESION PIT01')
xlabel('tiempo [seg]')
ylabel('PIT01 - [mbar]')
saveas(gcf, 'Ejemplos/imagenes/ejPIT01.png')
%---------------
figure(2) %PIT02
if H(:,1)== 1
    plot(T,C,T,N) 
    legend({'PIT02','REF PIT02'},'Location','southeast')
else
    plot(T,C)
    legend({'PIT02'},'Location','southeast')
end
title('PRESION PIT02')
xlabel('tiempo [seg]')
ylabel('PIT02 - [mbar]')
saveas(gcf, 'Ejemplos/imagenes/ejPIT02.png')
%---------------
figure(3) %FT01
if H(:,1)== 2
    plot(T,D,T,L) 
    legend({'FT01','REF FT01'},'Location','southeast')
else
    plot(T,D) 
    legend({'FT01'},'Location','southeast')
end
title('CAUDAL FT01')
xlabel('tiempo [seg]')
ylabel('FT01 - [l/min]')
saveas(gcf, 'Ejemplos/imagenes/ejFT01.png')
%---------------