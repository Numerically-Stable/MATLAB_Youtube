function [coeffs] = Project_with_poly(a, b, order, exact_func)
    % Number of quadrature points for integration
    n_quad_points = 1000;  % Higher value improves integration accuracy
    x_quad = linspace(a, b, n_quad_points);  % Quadrature points
    dx = (b - a) / (n_quad_points - 1);  % Spacing between points
    
    % Evaluate the exact function at quadrature points
    u = exact_func(x_quad);
    
    % Initialize K and F
    K = zeros(order + 1, order + 1);
    F = zeros(order + 1, 1);
    
    % Basis functions phi_i(x) = x^i
    for i = 0:order
        for j = 0:order
            % Compute K(i+1, j+1) = int(phi_i * phi_j)
            K(i + 1, j + 1) = sum((x_quad.^i) .* (x_quad.^j) * dx);
        end
        
        % Compute F(i+1) = int(u * phi_i)
        F(i + 1) = sum(u .* (x_quad.^i) * dx);
    end

    % Solve the linear system K * coeffs = F
    coeffs = K \ F;
end