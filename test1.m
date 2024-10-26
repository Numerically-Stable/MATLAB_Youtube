% inputs
a = -3 ;       % Left bracket
b = 1 ;        % Right bracket
f = @(x) x^3 ; % function



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



