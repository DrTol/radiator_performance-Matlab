function [DeltaT_GM]=tGMTD(Ts,Tr,Ti)

DeltaT_GM=(Ts-Ti)^(1/2)*(Tr-Ti)^(1/2);

end