function Tr = Tr_GMTD(q,Ts,Ti,qo,Tso,Tro,Tio,n)
%%  Calculates the return temperature from the radiator unit
%   emprical equation based on GMTD
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


%% Calculation for original condition

GMTDo=tGMTD(Tso,Tro,Tio);

%% Calculate Tr

Tr=Ti+((Ts-Ti)^(-1)*GMTDo^2*(q/qo)^(2/n));

if Tr>=Ts
    Tr=NaN;
    return
end

%% Evaluation of error (AF: Approach Factor)
AF=(Tr-Ti)/(Ts-Ti);

if AF>=0.33
    fprintf('User Warning: Approach factor is %f - Error less than 0.05',AF);
else
    fprintf('User Warning: Approach factor is %f - Error larger than 0.05',AF);
end

end

