clc
clear all
close all

%% 1. Zapoznanie z EMD. Rozk�ad sumy sygna�u sinusoidalnego i tr�jk�tnego.
% 
% % U�ywaj�c funkcji p1 przeprowadzi� generacj� oraz rozk�ad sumy sygna�u sinusoidalnego i tr�jk�tnego.
% 
% %  p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR,TR2,TOL,ITER)
% 
% % parametry wej�ciowe:
% F_p = 2000; %  - cz�stotliwo�� pr�bkowania [Hz]
% T = 4; %  - czas trwania [s]
% F_sin = [20 80]; %  - cz�stotliwo�� sygna�u sinusoidalnego [Hz]
% A_sin = 1; %  - amplituda sygna�u sinusoidalnego
% F_trojkat = 2; %  - czestotliwosc sygna�u pi�okszta�tnego [Hz]
% A_trojkat = 10; %  - amplituda sygna�u pi�okszta�tnego
% W_skut_szum = 0; %  - mno�nik warto�ci skutecznej szumu bia�ego, domy�lnie =1
% TR = 0.05; %  - parametr dekompozycji emd TR
% TR2 = 0.7; %  - parametr dekompozycji emd TR2
% TOL = 0.01;%  - parametr dekompozycji emd TOL
% ITER = 10; %  - liczba iteracji funkcji emd
% 
% %parametry wyjsciowe
% 
% % IMF - % zbi�r IMF'�w,
% % G - sygna� zadany,
% % tp - wektor czasu.
% p1(F_p,T,F_sin(1),A_sin,F_trojkat,A_trojkat,W_skut_szum,TR,TR2,TOL,ITER);
% load('Rozk�ad_p1__1__2000Hz_4s_20Hz_1A_2Hz_10A_0A_0.05TR_0.7TR2_0.01TOL_10ITER.mat');
%  
% 
%  
%  p1(F_p,T,F_sin(2),A_sin,F_trojkat,A_trojkat,W_skut_szum,TR,TR2,TOL,ITER);
%  load('Rozk�ad_p1__1__2000Hz_4s_80Hz_1A_2Hz_10A_0A_0.05TR_0.7TR2_0.01TOL_10ITER.mat');
%  G_80=G;
% 
% 
% 
% %p1_sinA(F_p,t_s,F_sin,A_sin)
% 
% %Parametry wej�ciowe:
% % 1. F_p � cz�stotliwo�� pr�bkowania
% % 2. F_sin � cz�stotliwo�� sygna�u sinusoidalnego
% % 3. t_s � czas trwania sygna�u sinusoidalnego
% % 4. A_sin � amplituda sygna�u sinusoidalnego
% 
% 
% sinus_20=p1_sinF(F_p, T, F_sin(1), A_sin);
% sinus_80=p1_sinF(F_p, T, F_sin(2), A_sin);
% 
% 
% % sd = PRD(root, signal)
% 
% % Parametry:
% % - root - sygna� oryginalny.
% % - signal - por�wnywany sygna�.
% 
% figure;
% sd_20=PRD(sinus_20, IMF(1,:));
% figure;
% sd_80=PRD(sinus_80, IMF(2,:));
% 
% 
% % Parametry wej�ciowe:
% % 1. x � sygna� poddawany dekompozycji`
% % 2. imf � wynik dekompozycji
% %Przyk�ady wywo�ania:
% visu1(x,imf)
% 
%  figure
% visu1(G_20, IMF(1,:));
%  figure
% visu1(G_20, IMF(2,:));


%% 2. Badanie wp�ywu kryteri�w metody. Test liczby iteracji

% parametry wej�ciowe:
F_p = 5000; %  - cz�stotliwo�� pr�bkowania [Hz]
T = 2; %  - czas trwania [s]
F_sin = 25; %  - cz�stotliwo�� sygna�u sinusoidalnego [Hz]
A_sin = 1; %  - amplituda sygna�u sinusoidalnego
F_trojkat = 5; %  - czestotliwosc sygna�u pi�okszta�tnego [Hz]
A_trojkat = 8; %  - amplituda sygna�u pi�okszta�tnego
W_skut_szum = 0.8; %  - mno�nik warto�ci skutecznej szumu bia�ego, domy�lnie =1
TR = 0.05; %  - parametr dekompozycji emd TR
TR2 = 0.5; %  - parametr dekompozycji emd TR2
TOL = 0.01;%  - parametr dekompozycji emd TOL
ITER = 100; %  - liczba iteracji funkcji emd

 p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR,TR2,TOL,ITER);
 load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_0.05TR_0.5TR2_0.01TOL_100ITER.mat');
 G_25=G;
 
sinus_25=p1_sinF(F_p, T, F_sin, A_sin);
sd_25=PRD(sinus_25, IMF);
 visu1(G_25, IMF);
 
%%  Zbada� wp�yw warto�ci parametru TR dla:
 TR=[0,01 0,1 0,5 1] ;
 
%  p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR(1),TR2,TOL,ITER);
% load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_0TR_0.5TR2_0.01TOL_100ITER.mat');
%  G_TR_0_01=G;
%  
% sd__TR_0_01=PRD(sinus_25, IMF);
%  visu1(G_TR_0_01, IMF);
%  
%  %%
%   p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR(2),TR2,TOL,ITER);
%  load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_1TR_0.5TR2_0.01TOL_100ITER.mat');
%  G_TR_0_1=G;
%  
% sd__TR_0_1=PRD(sinus_25, IMF);
%  visu1(G_TR_0_1, IMF);
% %%  
%    p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR(3),TR2,TOL,ITER);
%  load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_0TR_0.5TR2_0.01TOL_100ITER.mat');
%  G_TR_0_5=G;
%  
% sd__TR_0_5=PRD(sinus_25, IMF);
%  visu1(G_TR_0_5, IMF);
%  %%  
%    p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR(4),TR2,TOL,ITER);
% load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_1TR_0.5TR2_0.01TOL_100ITER.mat');
%  G_TR_1=G;
%  
% sd__TR_1=PRD(sinus_25, IMF);
%  visu1(G_TR_1, IMF);
 
 %%  Zbada� wp�yw warto�ci parametru TOL dla:
 TOL=[0,005 0,01 0,05 0,09];
% 
%  p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR,TR2,TOL(1),ITER);
% load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_0.05TR_0.5TR2_0.01TOL_100ITER.mat');
%  G_TOL_0_005=G;
%  
% sd__TOL_0_005=PRD(sinus_25, IMF);
%  visu1(G_TOL_0_005, IMF);
 
 %%
  p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR,TR2,TOL(2),ITER);
 load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_0TR_0.5TR2_0TOL_100ITER.mat');
 G_TOL_0_01=G;
 
sd__TOL_0_01=PRD(sinus_25, IMF);
 visu1(G_TOL_0_01, IMF);
% %%  
%    p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR,TR2,TOL(3),ITER);
% %  load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_0TR_0.5TR2_0.01TOL_100ITER.mat');
%  G_TOL_0_05=G;
%  
% sd__TOL_0_05=PRD(sinus_25, IMF);
%  visu1(G_TOL_0_05, IMF);
%  %%  
%    p1(F_p,T,F_sin,A_sin,F_trojkat,A_trojkat,W_skut_szum,TR,TR2,TOL(4),ITER);
% % load('Rozk�ad_p1__1__5000Hz_2s_25Hz_1A_5Hz_8A_0.8A_1TR_0.5TR2_0.01TOL_100ITER.mat');
%  G_TOL_0_09=G;
%  
% sd__TOL_0_09=PRD(sinus_25, IMF);
%  visu1(G_TOL_0_09, IMF);
%  