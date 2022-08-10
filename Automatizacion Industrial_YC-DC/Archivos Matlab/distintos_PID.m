%% Ayuda
%{
¿Que hace este archivo?
Genera graficos comparativos de distintos PID a partir de archivos
guardados en la carpeta Ejemplos. 

Alerta: Para comenzar borra toda la memoria de
matlab.
 
¿Como se utiliza?
Al correr este script preguntará si quiere guardar la imagen generada.
Luego deberá elegir el sistema que quiere comparar (PIT01, PIT02, FT01), y
el escalon que desea visualizar, al terminar de correr el programa, se
abrirá el gráfico y se guardará la imagen si así se deseó en
Ejemplos/imagenes.
%}
%% Código 
clc;
clear;
str1 = sprintf('¿Desea guardar la imagen que se genere? \n 1= Si \n 2= No');
disp (str1)
prompt = 'Usted elige : ';
guardar=input(prompt);
if guardar >2
    disp('Error, intente de nuevo')
else
    str2 = sprintf('¿Que variable desea visualizar\n 1= PIT01 \n 2= PIT02 \n 3= FT01');
    disp (str2)
    prompt2 = 'Usted elige : ';
    var=input(prompt2);
    if var >3
        disp('Error, intente de nuevo')
    else
        if var== 1
            str3 = sprintf('¿Que escalón desea visualizar  \n 1= 250 a 300 mbar \n 2= 200 a 280 mbar \n 3= 300 a 250 mbar');
            disp (str3)
            prompt3 = 'Usted elige : ';
            var1=input(prompt3);
            seccion=1;
            if var1 ==1
                m=600; vel1= 250; vel2=300; variable=2; SP=13; x0=527 ; x1=1000; ylA='presión [mbar]'; yp= 'southeast';
                txt3 = ['P\_04',' P= 5.309',' I= 0.284'];
                txt4 = ['P\_06',' P= 3.054',' I= 0.396'];
                [P3]=table2array(readtable('Ejemplos/P_04.csv'));
                [P4]=table2array(readtable('Ejemplos/P_06.csv'));
                name= 'Ejemplos/imagenes/PIT1a.png';
            elseif var1 ==2
                [P4]=table2array(readtable('Ejemplos/P_05.csv'));
                [P3]=table2array(readtable('Ejemplos/P_07.csv'));
                m=270; vel1= 200; vel2=280; variable=2; SP=13; x0=180 ; x1=500; ylA='presión [mbar]'; yp= 'southeast';
                txt4 = ['P\_05',' P= 5.309',' I= 0.284'];
                txt3 = ['P\_07',' P= 3.054',' I= 0.396'];
                name= 'Ejemplos/imagenes/PIT1b.png';              
            elseif var1 ==3
                [P4]=table2array(readtable('Ejemplos/P_05.csv'));
                [P3]=table2array(readtable('Ejemplos/P_07.csv'));
                m=280; vel1= 300; vel2=250; variable=2; SP=13; x0=180 ; x1=500; ylA= 'presión [mbar]'; yp='northeast';
                txt4 = ['P\_05',' P= 5.309',' I= 0.284'];
                txt3 = ['P\_07',' P= 3.054',' I= 0.396'];
                name= 'Ejemplos/imagenes/PIT1c.png';
                
            elseif var1 >3
                disp('Error, intente de nuevo')
            end
        elseif var==2
            str3 = sprintf('¿Que escalón desea visualizar  \n 1= 200 a 280 mbar \n 2= 300 a 250 mbar');
            disp (str3)
            prompt3 = 'Usted elige : ';
            var2=input(prompt3);
            seccion=1;
            if var2 ==1
                [P3]=table2array(readtable('Ejemplos/P_13.csv'));
                [P4]=table2array(readtable('Ejemplos/P_15.csv'));
                m=210; vel1= 200; vel2=280; variable=3; SP=14; x0=175 ; x1=400; ylA= 'presión [mbar]'; yp= 'southeast';
                txt3 = ['P\_13',' P= 5.453',' I= 0.3486'];
                txt4 = ['P\_15',' P= 3.696',' I= 0.471'];
                name= 'Ejemplos/imagenes/PIT2a.png';
            elseif var2 ==2
                [P3]=table2array(readtable('Ejemplos/P_13.csv'));
                [P4]=table2array(readtable('Ejemplos/P_15.csv'));
                m=270; vel1= 300; vel2=250; variable=3; SP=14; x0=100 ; x1=500; ylA= 'presión [mbar]'; yp= 'northeast';
                txt3 = ['P\_13',' P= 5.453',' I= 0.3486'];
                txt4 = ['P\_15',' P= 3.696',' I= 0.471'];
                name= 'Ejemplos/imagenes/PIT2b.png';
            elseif var2 >2
                disp('Error, intente de nuevo')
            end
        elseif var==3
            str3 = sprintf('¿Que escalón desea visualizar  \n 1= 5.6 a 7.8 l/min \n 2= 4 a 5.6 l/min \n 3= 9 a 5.6 l/min \n 4= 5.6 a 3 l/min');
            disp (str3)
            prompt3 = 'Usted elige : ';
            var3=input(prompt3);
            if var3 ==1
                [P3]=table2array(readtable('Ejemplos/P_10.csv'));
                [P4]=table2array(readtable('Ejemplos/P_11.csv'));
                m=270; vel1= 5.6; vel2=7.8; variable=4; SP=12; x0=200 ; x1=520; ylA=  'caudal [l/min]'; yp= 'southeast';
                txt3 = ['P\_10',' P= 104.3',' I= 0.7192'];
                txt4 = ['P\_11',' P= 115.6',' I= 0.6718'];
                name= 'Ejemplos/imagenes/FT1a.png';
                seccion=1;
            elseif var3 ==2
                [P3]=table2array(readtable('Ejemplos/P_10.csv'));
                [P4]=table2array(readtable('Ejemplos/P_11.csv'));
                m=240; vel1= 4; vel2=5.6;variable=4; SP=12; x0=150 ; x1=480; ylA= 'caudal [l/min]'; yp= 'southeast';
                txt3 = ['P\_10',' P= 104.3',' I= 0.7192'];
                txt4 = ['P\_11',' P= 115.6',' I= 0.6718'];
                name= 'Ejemplos/imagenes/FT1b.png';
                seccion=1;
            elseif var3 ==3
                [P3]=table2array(readtable('Ejemplos/P_10.csv')); 
                [P4]=table2array(readtable('Ejemplos/P_11.csv'));
                m=240; vel1= 9; vel2=5.6;variable=4; SP=12; ylA= 'caudal [l/min]'; yp= 'northeast'; x0=100 ; x1=450;
                txt3 = ['P\_10',' P= 104.3',' I= 0.7192'];
                txt4 = ['P\_11',' P= 115.6',' I= 0.6718'];
                name= 'Ejemplos/imagenes/FT1c.png';
                seccion=0;
            elseif var3 ==4
                [P3]=table2array(readtable('Ejemplos/P_10.csv')); 
                [P4]=table2array(readtable('Ejemplos/P_11.csv'));
                m=210; vel1= 5.6; vel2=3;variable=4; SP=12; ylA= 'caudal [l/min]'; yp= 'northeast'; x0=150 ; x1=350;
                txt3 = ['P\_10',' P= 104.3',' I= 0.7192'];
                txt4 = ['P\_11',' P= 115.6',' I= 0.6718'];
                name= 'Ejemplos/imagenes/FT1d.png';
                seccion=0;
            elseif var3 >4
                disp('Error, intente de nuevo')
            end
        end
    end
end

ca3=0;cb3=0;con3=0; 
if seccion==1
    if (vel1==vel1 && vel2==vel2)
        for i=1:size(P3)
            ref3= P3(i,SP);
            if  ref3==vel1
                if ca3<m
                    v3=P3(i,variable);
                    ca3=ca3+1;
                    con3=con3+1;
                    K(con3,3)=v3;
                    K(con3,2)=ref3;
                    K(con3,1)=con3;
                end
            end
            if  ref3==vel2
                if cb3<m
                    v3=P3(i,variable);
                    cb3=cb3+1;
                    con3=con3+1;
                    K(con3,3)=v3;
                    K(con3,2)=ref3;
                    K(con3,1)=con3;
                end
            end
        end
    end
else
    if (vel1==9 && vel2==5.6) || (vel1==5.6 && vel2==3)  
        J3=find(P3(:,SP)==9);
        for i=J3:size(P3)
            ref3= P3(i,SP);
            if  ref3==vel1
                if ca3<m
                    v3=P3(i,variable);
                    ca3=ca3+1;
                    con3=con3+1;
                    K(con3,3)=v3;
                    K(con3,2)=ref3;
                    K(con3,1)=con3;
                end
            end
            if  ref3==vel2
                if cb3<m
                    v3=P3(i,variable);
                    cb3=cb3+1;
                    con3=con3+1;
                    K(con3,3)=v3;
                    K(con3,2)=ref3;
                    K(con3,1)=con3;
                end
            end
        end
    end
end

ca4=0;cb4=0;con4=0;
if  seccion==1
    if (vel1==vel1 && vel2==vel2) 
        for i=1:size(P4)
            ref4= P4(i,SP);
            if  ref4==vel1
                if ca4<m
                    v4=P4(i,variable);
                    ca4=ca4+1;
                    con4=con4+1;
                    K(con4,4)=v4-0.2;
                end
            end
            if  ref4==vel2
                if cb4<m
                    v4=P4(i,variable);
                    cb4=cb4+1;
                    con4=con4+1;
                    K(con4,4)=v4;
                end
            end
        end
    end
else
    if (vel1==9 && vel2==5.6) || (vel1==5.6 && vel2==3)
        J4=find(P4(:,SP)==9);
        for i=J4:size(P4)
            ref4= P4(i,SP);
            if  ref4==vel1
                if ca4<m
                    v4=P4(i,variable);
                    ca4=ca4+1;
                    con4=con4+1;
                    K(con4,4)=v4;
                end
            end
            if  ref4==vel2
                if cb4<m
                    v4=P4(i,variable);
                    cb4=cb4+1;
                    con4=con4+1;
                    K(con4,4)=v4;
                end
            end
        end
    end
end
%% Grafico
figure(1)
plot(K(:,1),K(:,2),'k',K(:,1),K(:,3),'b',K(:,1),K(:,4),'m');
xlabel('muestras')
ylabel(ylA)
xlim ([x0,x1]);
legend({'referencia',txt3,txt4},'Location',yp)
if (guardar == 1)
    saveas(gcf, name);
end
%% Referencia de columnas
% % AA=J(:,1); %%TT001
% % BB=J(:,2); %%PRESION 1
% % CC=J(:,3); %%PRESION 2
% % DD=J(:,4); %%CAUDAL
% % EE=J(:,5); %%REF_VELOCIDAD
% % FF=J(:,6); %%VELOCIDAD_ACTUAL
% % GG=J(:,7); %%FREC MOTOR
% % HH=J(:,8); %%PID_SEL
% % II=J(:,9); %%MANUAL-AUTO
% % JJ=J(:,10); %%ACCION DE CONTROL
% % KK=J(:,11); %%Valor_Manual_PID
% % LL=J(:,12); %%SETPOINT_CAUDAL
% % MM=J(:,13); %%Setpoint_Presion_1
% % NN=J(:,14); %%Setpoint_Presion_2
% % TT=J(:,15); %%TIEMPO