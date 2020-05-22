clear;
clc;

syms epsln;
syms funcOne(epsln) funcTwo(epsln) Sigma(epsln);

% Defining constants
eps0 = 0.00265;

% Loading up to 35 MPa
for i = 0 : 35
eps1 = StrainForGivenStress(i, 40, 0.00265);
epsList(i+1) = eps1;
end
strainAfterLoading = epsList(length(epsList));
stressList = 0:35;

% Linear interpolation is done for unloading strain at 10 MPa 
% between strain at 35 MPa and residual strain since unloading process is
% linear.
epsIMax = max(epsList);
ResPlasticStrain = CalculatePlasticStrain(epsIMax, eps0);
epsAfterUnloading = strainAfterLoading - ((25 / 35) * (strainAfterLoading - ResPlasticStrain));
epsList(37) = epsAfterUnloading;
stressList(37) = 10;
% Linear loading up to 35 MPa, same stress values as in inital loading
stressList(38) = 35;
epsList(38) = strainAfterLoading;

% Residual strain is found above, which remains after totally unloading of
% 35 MPa
stressList(38) = 0;
epsList(38) = ResPlasticStrain;
plot(epsList, stressList);
