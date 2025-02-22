function new_n_element_rings_set = remove_isomorphisms(n_element_rings_set)
% This function can remove the isomorphic rings from a n_element_rings_set.
%% step1 Construct all the bijective mappings of n elements.
A = n_element_rings_set{1};
n = length(A);
bijective_mapping_list = {};
% First, correspond k(k<n^n-1) to a one-dimensional vector composed of an n - digit number in base . 
% The correspondence between the values in this vector and their indices is a mapping.
for k = 0:n^n-1
    kk = k;
    i = 1;
    phi = zeros(n,1);
    while (kk~=0)
        phi(i) = mod(kk,n);
        kk = (kk-mod(kk,n))/n;
        i = i+1;
    end
    phi = phi+1;
    % phi is a mapping. Here, check whether it is a bijective mapping.
    if is_bijective(phi)
        bijective_mapping_list{length(bijective_mapping_list)+1} = phi;
    end
end
new_n_element_rings_set(1,:) = n_element_rings_set(1,:);
for i = 2:length(n_element_rings_set)
    A1 = n_element_rings_set{i,1};
    C1 = n_element_rings_set{i,2};
    [k,~] = size(new_n_element_rings_set);
    flag = 0;
    for j = 1:k
        A2 = new_n_element_rings_set{j,1};
        C2 = new_n_element_rings_set{j,2};
        if is_isomorphic_ring(A1,C1,A2,C2,bijective_mapping_list)
            flag = 1;
            break
        end
    end
    if flag == 0
        new_n_element_rings_set{k+1,1} = A1;
        new_n_element_rings_set{k+1,2} = C1;
    end
end