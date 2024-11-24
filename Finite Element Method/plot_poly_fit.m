function plot_poly_fit(a,b,order,exact_func, coeffs)

% Check if the order is supported
if order < 1 || order > 10
    error('Supported polynomial orders are from 1 to 10.');
end

% Generate 100 points of x-axis in span for smooth plotting
x_plot = linspace(a, b, 100);

% Generate 100 exact function values in span for smooth plotting
y_exact = exact_func(x_plot) ;

% Initialize y values for the fitted polynomial
y_fit = zeros(size(x_plot));

% Calculate fitted y values based on the polynomial order
for i = 0:order
    y_fit = y_fit + coeffs(i+1) .* (x_plot .^ i);
end

% Plot the exact and fitted polynomial
plot(x_plot, y_exact, '-b', 'LineWidth', 2);
hold on
plot(x_plot, y_fit, '--r', 'LineWidth', 2);
xlabel('x');
ylabel('f(x)');
title(['Polynomial Fit of Order ' num2str(order)]);
legend('Exact','Fit')
hold off
end
