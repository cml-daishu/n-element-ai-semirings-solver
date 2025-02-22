function [flag,phi] = is_isomorphic_ring(A1,C1,A2,C2,bijective_mapping_list)
% Traverse the mappings in the bijective_mapping_list 
% and check one by one whether they are isomorphic mappings. 
flag = 0;
n = length(A1);
for k = 1:factorial(n)
    phi = bijective_mapping_list{k};
        if is_isomorphic_mapping(phi,A1,C1,A2,C2)
            flag = 1;
            return
        end
end