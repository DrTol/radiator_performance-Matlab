%% Example_RadiatorReturnTemperature
%   Example Script: shows how to use the Matlab functions
%   prepared by Tol, Hakan ibrahim

%% Radiator Emprical Exponent
n=1.3;

%% Design Parameter of a Radiator Unit (9 kW at 90|70|20 degC)
qo=1;   % [kW]      Heat demand 
Tso=90; % [degC]    Supply temperature 
Tro=70; % [degC]    Return temperature 
Tio=20; % [degC]    Indoor temperature

%% Calculation starts
%  Example 1
%   for an actual condition: 0.5 kW heat demand Ts = 90 degC & Ti = 20 degC

% Based on LMTD
Tr_L = Tr_LMTD(0.5,90,20,qo,Tso,Tro,Tio,n);

% Based on GMTD
Tr_G = Tr_GMTD(0.5,90,20,qo,Tso,Tro,Tio,n);

% Based on AMTD
Tr_A = Tr_AMTD(0.5,90,20,qo,Tso,Tro,Tio,n);

% Based on AMTD with Schlapmann factors
Tr_As = Tr_AMTD_Schlapmann(0.5,90,20,qo,Tso,Tro,Tio,n);

Exp1=[Tr_L Tr_G Tr_A Tr_As]';

%  Example 2
%   for an actual condition: 0.3 kW heat demand Ts = 50 degC & Ti = 20 degC

% Based on LMTD
Tr_L = Tr_LMTD(0.3,50,20,qo,Tso,Tro,Tio,n);

% Based on GMTD
Tr_G = Tr_GMTD(0.3,50,20,qo,Tso,Tro,Tio,n);

% Based on AMTD
Tr_A = Tr_AMTD(0.3,50,20,qo,Tso,Tro,Tio,n);

% Based on AMTD with Schlapmann factors
Tr_As = Tr_AMTD_Schlapmann(0.3,50,20,qo,Tso,Tro,Tio,n);

Exp2=[Tr_L Tr_G Tr_A Tr_As]';

Description={'Tr_LMTD','Tr_GMTD','Tr_AMTD','Tr_AMTD & Schlapmann'}';

T=table(Description,Exp1,Exp2)
