function [coeffs] = Interpolate_with_poly(a, b, order, exact_func)

% Generate order + 1 equally spaced points in the interval [a, b]
x = linspace(a, b, order + 1)';

% Calculate y values by evaluating the exact function at the data points
y = exact_func(x);

% Construct the Vandermonde matrix for polynomial interpolation
K = zeros(order + 1, order + 1);
for i = 0:order
    K(:, i+1) = x.^i;
end

% Solve for the coefficients
coeffs = K \ y;

end
