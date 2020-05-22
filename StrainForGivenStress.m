function [strain] = StrainForGivenStress(sigma, fck, eps0)

syms x;

helper = double(solve((-x^2) + (2*x) - (sigma/fck) == 0, x));

strain = helper(1) * eps0;


end