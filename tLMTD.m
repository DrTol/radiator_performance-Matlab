function [DeltaT_LM]=tLMTD(Ts,Tr,Ti)

DeltaT_LM=(Ts-Tr)/log((Ts-Ti)/(Tr-Ti));

end