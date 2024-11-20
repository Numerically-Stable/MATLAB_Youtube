function [a, b] = bracket_root_bisection1(f, a, b)
% single step bisection search for bracekting a root
% takes a bracket containing a root as input 
% gives a reduced(half) bracket containing root as output


fa = f(a);
fb = f(b);

% Checking for sign, if same sign, no root exists
if fa*fb > 0
    error('Root not bracketed in the interval');
end

% else continuing
c = (a+b)/2;
fc = f(c);

if fc == 0
    % Found the root exactly
    a = c;
    b = c;
    return;
elseif fa*fc < 0
    % Root is in the interval [a,c]
    b = c;
    fb = fc;
else
    % Root is in the interval [c,b]
    a = c;
    fa = fc;
end




end
