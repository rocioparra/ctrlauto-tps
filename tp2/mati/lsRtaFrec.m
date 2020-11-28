%TP respuesta en frecuencia
clear all;
close all;
s=tf('s');

%Problema 5


% G=2 * exp(-0.5*s)/((s/5 +1)*(s/0.25 +1)); %Planta
% Pmp=2/((s/5 +1)*(s/0.25 +1)); %minFase
% Pap=exp(-0.5*s); %pasa todo
% 
% 
% T=100e-3;
% d=(1-s*T/4)/(1+s*T/4); %aproximacion de pade
% 
% k=0.9%*db2mag(1.48);%0.9;
% c=(k/s)* (1/Pmp)* (1/(1+s/100));% controlador
% 
% L=Pap*Pmp*c*d;
% 
% 
% 
% figure();bodeplot(Pap,Pmp*c);
% title('Pap y Pmp*c');
% grid on;
% 
% figure();bodeplot(d);
% title('Pade');
% grid on;
% 
% figure();step(L/(1+L))
% title(' step T(s)');
% grid on;
% 
% figure();bode(L/(1+L))
% title('T(s)');
% grid on;
% 
% w0 = 0.923; % Frecuencia de cruce aproximada
% alpha = w0/(tan(w0*T/2));
% 
% L=Pap*Pmp*c;
% Td = c2d(L/(1+L),T,'tustin');
% opts = c2dOptions('PrewarpFrequency',alpha);
% Td = c2d(L/(1+L),T,opts);
% figure;
% step(Td);
% hold on;
% step(L/(1+L));
% title('Step Response - T(z)');







%Problema 6

% Pmp = ((1000+s)^2)/((1+s)^2) ;
% 
% Pap= (((1+s)^2)/((1-s)^2)) *  (((1000-s)^2)/((1000+s)^2));
% 
% k=1*db2mag(41.6);
% c=(1/Pmp)*(k/s);
% 
%  T=1e-3;
%  d=(1-s*T/4)/(1+s*T/4); %aproximacion de pade
% 
% figure();bode(Pap,Pmp*c);
% title('Pap y Pmp*c');
% 
% figure();bode(d);
% title('Pade');
% 
% L=Pap*Pmp*c*d;
% figure();bode(L/(1+L));
% title('T(s)');
% 
% figure();bode(L);
% title('P * C');
% 
% figure();step(L/(1+L));
% title('Step');
% figure();rlocus(L/k);
% 
% w0 = 123; % Frecuencia de cruce aproximada
% alpha = w0/(tan(w0*T/2));
% L=Pap*Pmp*c;
% Td = c2d(L/(1+L),T,'tustin');
% opts = c2dOptions('PrewarpFrequency',alpha);
% Td = c2d(L/(1+L),T,opts);
% figure;
% step(Td);
% hold on;
% step(L/(1+L));
% title('Step Response - T(z)');




%Problema 7

% Pmp=0.5 *(1/(s^2)) * (1/((s/80)+1));
% 
% T=10e-3;
% Pap=(1-s*T/4)/(1+s*T/4);
% 
% k=1; %*db2mag(29.3);
% c=((s+2)^2)*((s/80)+1)*(k/s)*(1/0.5)*(1/((s/200)+1))*(1/((s/300)+1));
% 
% figure();bode(Pap*Pmp*c);
% L=Pap*Pmp*c;
% title('Pap*Pmp*c');
% grid on;
% figure();bode(L/(1+L));
% title('L/(1+L)');
% 
% figure();bode(L);
% title('L');
% 
% figure();step(L/(1+L));
% title('Step');
% 
% figure();rlocus(L/k);
% 
% Respuesta al escalon discreta
% 
% w0 = 28.9; % Frecuencia de cruce aproximada
% alpha = w0/(tan(w0*T/2));
% opts = c2dOptions('PrewarpFrequency',alpha);
% Cd = c2d(c,T,'tutstin',opts);







% % Problema 8
% Pmp= (1/((s/80)+1));
% Pin=(1/((s^2)+16));
% T=10e-3;
% Pap=(1-s*T/4)/(1+s*T/4);
% 
% k=15.8*db2mag(5.3-10.1);
% dist=0.4;
% c=(1/Pmp)*(k/s)*((s+2)^2)*(1/((s/200)+1))*(1/((s/300)+1));
% L=Pap*Pmp*c*Pin;
% 
% figure();rlocus(L/k);
% 
% figure();bode(Pap*Pin*Pmp*c);
% title('P*c');
% grid on;
% 
% figure();step(L/(1+L));
% title('Step');
% grid on;
% % 
% % 
% w0 = 15.5; % Frecuencia de cruce aproximada
% alpha = w0/(tan(w0*T/2));
% opts = c2dOptions('PrewarpFrequency',alpha);
% Cd = c2d(c,T,'tutstin',opts);

%Problema 9
Pmp= (1/((s+4)^2))*(1/((s/80)+1));

T=5e-3;
Pap=((s+4)/(s-4))*((1-s*T/4)/(1+s*T/4));
Pap2=((s+4)/(s-4));
k=1*db2mag(36.5+0.635);

c=(1/Pmp)*(k/s)*(1/((s/600)+1))*(1/((s/600)+1))*(((s/(44*0.7))+1)/((s/44)+1));
L=Pap*Pmp*c;
figure();rlocus(L/k);
figure();margin(Pap*Pmp*c);grid on;

figure();step(L/(1+L));

w0 = 95.6; % Frecuencia de cruce aproximada
alpha = w0/(tan(w0*T/2));
opts = c2dOptions('PrewarpFrequency',alpha);
Cd = c2d(c,T,'tutstin',opts);


