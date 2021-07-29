function [J, gradient] = costFn(angle, X, target)
m = length(target);
J = 0;
gradient = zeros(size(angle));

J=1./m*sum((-target'.*log(1./(1+exp(-angle'*X'))))-((1-target)'.*log(1-1./(1+exp(-angle'*X')))));



gradient=1./m*(1./(1+exp(-angle'*X')) -target')*X;


end