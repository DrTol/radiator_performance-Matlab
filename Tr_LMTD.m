function Tr = Tr_LMTD(q,Ts,Ti,qo,Tso,Tro,Tio,n)
%%  Calculates the return temperature from the radiator unit
%   emprical equation based on LMTD by Bøhm B. 
%   Ref: Phetteplace - Optimal Design of Piping Systems for District Heating
%   prepared by Hakan ibrahim Tol, PhD

%% INPUT&OUTPUT
%   Input
%   q   : Heat demand - actual condition            [kW]
%   Ts  : Supply temperature - actual condition     [degC]
%   Ti  : Set degree of indoor temperature - actual [degC]

%   qo  : Heat demand - design condition            [kW]
%   Tso : Supply temperature - design condition     [degC]
%   Tro : Return temperature - design condition     [degC]
%   Tio : Set degree of indoor temperature - design [degC]
%   n   : Emprical radiator constant                [-]

%   Output
%   Tr  : Radiator return temperature - actual      [degC]

%% Calculation of GMTD and LMTD for the design condition
%   LMTD: Logarithmic Mean Temperature Difference
%   GMTD: Geometric Mean Temperature Difference
    
GMTDo=tGMTD(Tso,Tro,Tio);                           % [degC]
LMTDo=tLMTD(Tso,Tro,Tio);                           % [degC]

%% Calculation (Iteration)

% Initial Estimate for Tr by use of GMTD
Tr_it1=Ti+((Ts-Ti)^(-1)*GMTDo^2*(q/qo)^(2/n));

if Tr_it1>=Ts
    Tr=NaN;
    return
end

% Iteration LMTD method

fTol=0.001;     % Termination Tolerance(Iteration)
err=10;        	% Initial fake ?teration error

while err>fTol
    Tr_it2 = Ti + ((Ts - Ti) / exp((q / qo) ^ (-1 / n) * (Ts - Tr_it1) / LMTDo));
    
    err = abs(Tr_it2 - Tr_it1);
    Tr_it1 = Tr_it2;
end

if Ts > Tr_it2
    Tr = Tr_it2;
else
    Tr= NaN;
    return
end

%% Mass Flow Rate at this operational condition
% Change the function as to [Tr,mFlow] = Tr_LMTD(q,Ts,Ti,qo,Tso,Tro,Tio,n)

mFlow=q/(XSteam('hl_t',Ts)-XSteam('hl_t',Tr));

end

