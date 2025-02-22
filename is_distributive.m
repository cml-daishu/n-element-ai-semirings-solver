function flag = is_distributive(A,C)
% Verify them one by one according to the definition of the distributive law.
flag = 1;
n = length(A);
for i = 1:n
    for j = 1:n
        for k = 1:n
            if C(i,A(j,k))~=A(C(i,j),C(i,k)) || C(A(j,k),i)~=A(C(j,i),C(k,i))
                flag = 0;
                return
            end
        end
    end
end          