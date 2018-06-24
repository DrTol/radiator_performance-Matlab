# Radiator Return Temperature Calculator
This Matlab tool calculates the radiator return temperature as based on the performance/rating measures making use of various mean temperature difference approaches.  

## Table of Contents
- [Features](README.md#features)
- [How2Use](README.md#how2use)
- [License](README.md#license)
- [Acknowledgement](README.md#acknowledgement)
- [How2Cite](README.md#how2cite)
- [References](README.md#references)

## Features
The main idea here is to develop simple and reliable emprical models for residential radiator units so to be used in system level modelling (i.e. at district heating simulations). Hence, this Matlab models estimate the radiator behaviour in terms of return temperature at different operational conditions (e.g. changing heat demand rate at different degrees of supply temperature).

- Four different Matlab functions are given, each basing on different approaches for the radiator excess temperature such as either Logarithmic Mean Temperature Difference (LMTD) - implicit, Geometric Mean Temperature Difference (GTMD) - explicit, or Arithmetic Mean Temperature Difference (AMTD) - explicit.
- Error evaluation are involved for GMTD and AMTD approaches, as error criteria formulated with the approach factor. 
- In order to avoid deviations at low flow conditions, Schlapmann factors are included in the AMTD method.

## How2Use
An example script is given: [ExampleRadiatorReturnTemperature.m](https://github.com/DrTol/radiator_performance-Matlab/blob/master/ExampleRadiatorReturnTemperature.m), which illustrates how to use the Matlab functions developed [Tr_LMTD.m](https://github.com/DrTol/radiator_performance-Matlab/blob/master/Tr_LMTD.m), [Tr_GMTD.m](https://github.com/DrTol/radiator_performance-Matlab/blob/master/Tr_GMTD.m), [Tr_AMTD.m](https://github.com/DrTol/radiator_performance-Matlab/blob/master/Tr_AMTD.m), and [Tr_AMTD_Schlapmann.m](https://github.com/DrTol/radiator_performance-Matlab/blob/master/Tr_AMTD_Schlapmann.m). Please clone or download the whole repository and run this example script! 

## License
You are free to use, modify and distribute the code as long as authorship is properly acknowledged. The same applies for the original works 'XSteam.m' by Holmgren M. 

## Acknowledgement 
We would like to acknowledge all of the open-source minds in general for their willing of share (as apps or comments/answers in forums), which has encouraged our department to publish our Matlab tools developed during the PhD study here in GitHub.

This Matlab tool makes use of other original open-source project: 
- [XSteam by Holmgren M.](https://nl.mathworks.com/matlabcentral/fileexchange/9817-x-steam--thermodynamic-properties-of-water-and-steam) | Author Description: XSteam provides accurate steam and water properties from 0 - 1000 bar and from 0 - 2000 deg C according to the standard IAPWS IF-97. For accuracy of the functions in different regions see IF-97 (www.iapws.org).

## How2Cite:
1. Tol, Hİ. radiator_performance-Matlab. DOI: 10.5281/zenodo.1297065. GitHub Repository 2018; https://github.com/DrTol/radiator_performance-Matlab
2. Tol, Hİ. District heating in areas with low energy houses - Detailed analysis of district heating systems based on low temperature operation and use of renewable energy. PhD Supervisors: Svendsen S. & Nielsen SB. Technical University of Denmark 2015; 204 p. ISBN: 9788778773685.

## References
- Phetteplace GE. Optimal design of piping systems for district heating. Hanover, N.H.: U.S. Army Cold Regions Research and Engineering Laboratory; 1995.
- Bøhm B. Energy-economy of Danish district heating systems: A technical and economic analysis. Lyngby, Denmark: Laboratory of Heating and Air Conditioning, Technical University of Denmark; 1988.
- Benonysson A. Dynamic modelling and operational optimization of district heating systems. Lyngby, Denmark: Laboratory of Heating and Air Conditioning, Technical University of Denmark; 1991.
- Heat Emission from Radiators and Heating Panels, link: https://www.engineeringtoolbox.com/heat-emission-radiators-d_272.html
- British Standards Institution. BS EN 442-2:2014: Radiators and convectors - Part 2: Test methods and rating 2014:82.
- Soumerai H. Practical thermodynamic tools for heat exchanger design engineers. New York: Wiley-Interscience; 1987.
- Radson. Kv-calculator_-_03-2012(1).xls 2012:2.
- Schlapmann D. Heat output and surface temperature of room heat emitters [Warmeleitung und oberflachentemperatureen von raumheizkorpern] (German). Heiz Luft Haustechnik 1976;27:317–21.
- Kilkis İB. Equipment oversizing issues with hydronic heating systems. ASHRAE J 1998;40:25–30.
