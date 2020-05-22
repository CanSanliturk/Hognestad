function [plasticStrain] = CalculatePlasticStrain(epsImax, eps0)

syms x;

helper = epsImax / eps0;
plasticStrain = eps0 * ((0.166 * helper * helper) + (0.132 * helper));

end