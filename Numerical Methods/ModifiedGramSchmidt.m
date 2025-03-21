function U = ModifiedGramSchmidt(V)
    [n, k] = size(V);
    U = zeros(n,k);
    U(:,1) = V(:,1) / norm(V(:,1));
    for i = 2:k
        V_k = V(:,i);
        for j = 1:i-1
            if j==1
                U_k = V_k - (U(:,j)'*V_k) * U(:,j);
            else
                U_k = U_k - (U(:,j)'*U_k) * U(:,j);
            end            
        end
        U(:,i) = U_k / norm(U_k);
    end
end