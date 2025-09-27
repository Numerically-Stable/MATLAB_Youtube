function root = newtons_method(x0, f, f_prime, tolerance, epsilon, max_iterations)
% NEWTONS_METHOD  Newton–Raphson root-finding algorithm
% Source: Wikipedia
%   root = newtons_method(x0, f, f_prime, tolerance, epsilon, max_iterations)
%
%   Inputs:
%       x0              - Initial guess for the root
%       f               - Function handle whose root we want to find
%       f_prime         - Derivative of the function (function handle)
%       tolerance       - Stop if successive estimates differ by less than this
%       epsilon         - Avoid division if derivative magnitude < epsilon
%       max_iterations  - Maximum allowed number of iterations
%
%   Output:
%       root            - Approximate root (or NaN if not converged)

root = NaN;  % Default return value if not converged

for k = 1:max_iterations
    y = f(x0);
    yprime = f_prime(x0);

    % Avoid division by very small derivative
    if abs(yprime) < epsilon
        fprintf('Derivative too small. Stopping at iteration %d.\n', k);
        return
    end

    % Newton update
    x1 = x0 - y / yprime;

    % Check for convergence
    if abs(x1 - x0) <= tolerance
        root = x1;
        fprintf('Iter %d \n x = %d .\n', k,x1);
        fprintf('Converged after %d iterations.\n', k);
        return
    end

    % Prepare for next iteration
    x0 = x1;

    % Display current step values
    fprintf('Iter %d \n x = %d \n', k,x0);
end

fprintf('Did not converge within %d iterations.\n', max_iterations);

end
