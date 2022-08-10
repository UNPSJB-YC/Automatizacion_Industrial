%% Ayuda
%{
¿Que hace este archivo?
Procesa datos históricos extraidos del .txt que fue generado con el sistema
SCADA.
Genera vectores y realiza gráficos de las variables elegidas.

El archivo tarda en compilar debido a la cantidad de muestras que tiene
cada .txt y se debe tener en cuenta que no todas las variables fueron
muestreadas con el mismo tiempo.

Alerta: Para comenzar borra toda la memoria de
matlab.

¿Como se utiliza?
Colocar el nombre del archivo .txt en la variable DATOS y dar "Correr" este
script.
Una vez que aparece la lista de variables que se encontró dentro del
archivo, usted puede elegir la cantidad que desee colocando en un vector
las variables requeridas. Ej: [1,2]
%}
clear; %no borrar
clc; %no borrar
%% Ejemplos de archivos
%{ Descomentar una linea por vez %}
%DATOS = importdata('EjHist/Ej_historico_1.txt','\t');
%DATOS = importdata('EjHist/Ej_historico_7.txt','\t');
DATOS = importdata('EjHist/Ej_historico_3.txt','\t');

%% Programacion

TAMANO=size(DATOS);
for i=8:TAMANO(1)-2
    DATOS1(i-7)=DATOS(i);
end

TAMANO1=size(DATOS1);
for i=1:TAMANO1(2)
    DATOS2{i,1}=strsplit(DATOS1{i});
end

Tiempos1(1)=1;
k1=1;
AUX=DATOS2{1}(1);
for i=1:TAMANO1(2)
    if strcmp(DATOS2{i}(1),AUX)==1
        Tiempos2(k1)=i;
        Tam=length(DATOS2{i});
    else
        if  length(DATOS2{i})==Tam
            AUX=DATOS2{i}(1);
            k1=k1+1;
            Tiempos1(k1)=i;
        end
    end
end

k=0;
for i=1:length(Tiempos1)
    AUX1 = genvarname(['TimeVAR',num2str(i)]);
    AUX1 = AUX1 +"(j-Tiempos1(i)+1)";
    AUX2 = genvarname(['VAR',num2str(i)]);
    AUX2 = AUX2 +"(j-Tiempos1(i)+1)";
    for j=Tiempos1(i):Tiempos2(i)
        AUX4=str2num(str2mat(strrep(DATOS2{j}(4),',','.')));
        eval([char(AUX2),'=AUX4;']);
        AUX5=char(DATOS2{j}(2))+" "+char(DATOS2{j}(3));
        AUX5 = datetime(AUX5,'InputFormat','dd/MM/yyyy HH:mm:ss');
        eval([char(AUX1),'=AUX5;']);
    end
    nombres(i)=DATOS2{Tiempos1(i)}(1);
end

str1 = sprintf('Que variable desea visualizar? - Coloque vector entre corchetes. Ej: [1,2] ');
disp (str1)
str="";
for i=1:length(Tiempos1)
    str= str+i + "= " + nombres(i)+ newline;
end

disp (str)
prompt = 'Usted elige : ';
x=input(prompt);

for j=1:length(x)
    for i=1:length(Tiempos1)
        if (x(j)==i)
            AUX3="VAR"+num2str(i);
            AUX6="TimeVAR"+num2str(i);
            if  exist(AUX3) == 1
                ylim auto
                figure(1)
                title('Variables del historico');
                plot(eval(AUX6),eval(AUX3));
                str2 = cellstr(nombres(x));
                legend(str2,'Location','southeast','Interpreter','latex')
                hold on;
            end
        end
    end
end
