% inputs
a = -3 ;       % Left bracket
b = 1 ;        % Right bracket
tol = 1e-3 ;   % Tolerance
f = @(x) x^3 ; % function

iter = 0;
while abs(a-b)/2 > tol
    iter = iter + 1;
    [a, b] = bracket_root_bisection1(f, a, b);
    

    if abs(a-b)/2 <= tol
        root = (a+b)/2;
    end
end
