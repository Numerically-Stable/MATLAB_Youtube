function L2_error = plot_error_and_calculate_L2(a, b, coeffs, exact_func,plot_param)
    % Number of points for plotting and numerical integration
    n_points = 1000;
    x = linspace(a, b, n_points);
    
    % Calculate the exact function values
    f_exact = exact_func(x);
    
    % Calculate the polynomial approximation values
    f_bar = zeros(size(x));
    order = length(coeffs) - 1;
    for i = 0:order
        f_bar = f_bar + coeffs(i+1) * x.^i;
    end
    

    % Calculate the pointwise error
    error = f_exact - f_bar;
    
    if plot_param == 1
        % Plot the pointwise error
        figure;
        plot(x, error, 'r', 'LineWidth', 2);
        hold on
        plot(x,zeros(length(x)),'--k','LineWidth',2);
        xlabel('x');
        ylabel('e(x) = (f - f_{bar})');
        title('Error plot');
        hold off
    end
    % Calculate the L2-norm of the error
    L2_error = sqrt(trapz(x, error.^2));
end
