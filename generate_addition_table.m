function addition_table = generate_addition_table(k,n)
% addition_table is an n*n matrix, and the value of addition_table(a, b) represents the result of the operation a+b.
% The elements on the diagonal are fixed, and considering the symmetry, 
% we only need to fill in the upper triangular matrix of the operation table. 
% By expanding it into a one - dimensional vector in row - major order, 
% it can form a one - to - one correspondence with an n - ary number of n*(n-1)/2 bits. 
% Therefore, the corresponding addition table can be uniquely determined according to the value of k.
if k<n^(n*(n-1)/2)
    addition_table = zeros(n,n);
    i = 1;
    j = 2;
    while(k~=0)
        addition_table(i,j) = mod(k,n);
        k = (k-mod(k,n))/n;
        if j<n
            j = j+1;
        else
            i = i+1;
            j = i+1;
        end
    end
    addition_table = addition_table+addition_table';
    addition_table = addition_table+1;
    for i = 1:n
        addition_table(i,i) = i;
    end
else
    disp('error in function generate_addition_table : k is too large.')
end