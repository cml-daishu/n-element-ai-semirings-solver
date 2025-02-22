function flag = is_bijective(phi)
% To check whether a phi is a bijective mapping, 
% it is only necessary to ensure that each element appears exactly once.  
n = length(phi);
flag = 1;
for i = 1:n
    if sum(phi==i)~=1
        flag = 0;
        return
    end
end