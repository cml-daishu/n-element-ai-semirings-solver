function flag =  is_associative(operation_table)
% This function verifies each case according to the definition of the associative law.
% The numbers in an operation table should start from 1. 
% If a number in the table is 0, it means the value at that position is undetermined. 
% Here, to match the pruning algorithm used for generating the multiplication table, 
% we can perform a local associativity check on an incomplete operation table.
n = length(operation_table);
flag = 1;
for a = 1:n
    for b = 1:n
        if operation_table(a,b) ~= 0
            for c = 1:n
                if operation_table(b,c) ~= 0
                    if operation_table(operation_table(a,b),c) ~= 0 && operation_table(a,operation_table(b,c)) ~=0
                        if operation_table(operation_table(a,b),c) ~= operation_table(a,operation_table(b,c))
                            flag = 0;
                            return
                        end
                    end
                end
            end
        end
    end
end
                    