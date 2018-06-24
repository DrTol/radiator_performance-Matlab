function Tr=Tr_AMTD_Schlapmann(q,Ts,Ti,qo,Tso,Tro,Tio,n)
%%  Calculates the return temperature from the radiator unit
%   emprical equation based on AMTD by Soumerai H. with Schlapmmann factors
%   Ref: Phetteplace - Optimal Design of Piping Systems for District Heating
%   Ref: McIntyre MA, McIntyre DA. Output of radiators at reduced flow rate
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

%% Calculation of AMTD for the design condition
%   AMTD: Arithmetic Mean Temperature Difference    [degC]

AMTDo=tAMTD(Tso,Tro,Tio);
mo=qo/(XSteam('hl_t',Tso)-XSteam('hl_t',Tro));

%% Calculation
% Need of iteration due to Schlapmann factor

% Initial value by use of AMTD method (no Schlapmann factors)
Tr=2*(Ti+(AMTDo*(q/qo)^(1/n)))-Ts;

if or(Tr<=20,Tr>=Ts)
    Tr=NaN;
    return
end

m=q/(XSteam('hl_t',Ts)-XSteam('hl_t',Tr));
m_r=m/mo;
err=10;
Counter=0;
% iteration for Schlapmann factors
while or(err<0.01,Counter==10000)
    f_flow=-2.498E-01*m_r^4+1.326E+00*m_r^3-2.519E+00*m_r^2+2.045E+00*m_r^1+4.210E-01*m_r^0;
    f_cp=-1.393E-01*m_r^4+8.627E-01*m_r^3-1.976E+00*m_r^2+1.989E+00*m_r^1+2.866E-01*m_r^0;

    Tr=2*(Ti+(AMTDo*(q/(qo*f_flow))^(1/(n*f_cp))))-Ts;
    m_ite=q/(XSteam('hl_t',Ts)-XSteam('hl_t',Tr));
    m_r_ite=m_ite/mo;

    err=abs(m_r_ite-m_r);
    Counter=Counter+1;
    m_r=m_r_ite;
end
end

