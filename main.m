clear;
clc;
%% Set the order to be solved.
n = 4;

%% step1 Calculate the n-element additive semilattices
% Here, only n - element additive semilattices are considered.
% Considering that the elements on the diagonal are fixed and the symmetry.
% There are at most n^(n*(n-1)/2) possibilities.

% Pre - allocate space to speed up the process.
addition_table_set = cell(300,1);
addition_table_number = 0;
for k = 0:n^(n*(n-1)/2)-1
    addition_table = generate_addition_table(k,n);
    if is_associative(addition_table)
        addition_table_number = addition_table_number+1;
        addition_table_set{addition_table_number,1} = addition_table;
    end
end
% Extract the valid part and discard the unused space.
addition_table_set = addition_table_set(1:addition_table_number,1);
% So far, all n-element additive semilattices have been obtained in the addition_table_set.

%% step2 Calculate the n-element multiplicative semigroup.
% There are a total of n*n positions that need to be filled with numbers from 1 to n. 
% Starting with an all - zero matrix, we try to fill in the number k column - by - column (which is the default order in MATLAB).
% If the associative law is no longer satisfied at this point, we do not record it in the mul_table_set. 
% In this way, we can solve for all n - element multiplicative semigroups in a tree - like order.
mul_table_set = cell(1);
mul_table_set{1} = zeros(n,n);
number = 1;
for deep = 1:n^2
    next_mul_table_set = cell(10000,1);
    next_number = 0;
    for i = 1:number
        A = mul_table_set{i};
        for k = 1:n
            newA = A;
            newA(deep) = k;
            if is_associative(newA)
                next_number = next_number+1;
                next_mul_table_set{next_number} = newA;
            end
        end
    end
    mul_table_set = next_mul_table_set(1:next_number);
    number = next_number;
end
% So far, all n-element multiplicative semigroup have been obtained in the mul_table_set.

%% step3 Combine them into n - element ai-semirings.
% n_element_ai_semirings_set is a cell(x, 2). 
% There are x n - element AI - semirings. 
% The column index 1 represents the addition table (abbreviated as A).
% And the column index 2 represents the multiplication table (abbreviated as C).
% Only the combinations of A and C that satisfy the distributive law will be recorded in the n_element_ai_semirings_set.
n_element_ai_semirings_set = cell(20000,2);
number = 0;
for i = 1:length(addition_table_set)
    for j = 1:length(mul_table_set)
        A = addition_table_set{i,1};
        C = mul_table_set{j,1};
        if is_distributive(A,C)
            number = number + 1;
            n_element_ai_semirings_set{number,1} = A;
            n_element_ai_semirings_set{number,2} = C;
        end
    end
end
n_element_ai_semirings_set = n_element_ai_semirings_set(1:number,:);
% So far, all possible n - element ai-semirings without excluding isomorphisms have been obtained 
% and recorded in the variable n_element_ai_semirings_set.

%% step4 Remove isomorphisms.
% This step will take the most time. Please wait a moment.
n_element_ai_semirings_set = remove_isomorphisms(n_element_ai_semirings_set);
