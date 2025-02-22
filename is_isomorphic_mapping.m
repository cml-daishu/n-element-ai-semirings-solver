function flag = is_isomorphic_mapping(phi,A1,C1,A2,C2)
%Return whether the bijective mapping phi is an isomorphic mapping from (A1, C1) to (A2, C2).
flag = 1;
n = length(A1);
for a = 1:n
    for b = 1:n
        if phi(A1(a,b)) ~= A2(phi(a),phi(b)) || phi(C1(a,b)) ~= C2(phi(a),phi(b))
            flag = 0;
            return
        end
    end
end
