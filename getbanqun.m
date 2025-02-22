function n_banqun = getbanqun(n)
n_banqun = cell(1);
n_banqun{1} = zeros(n,n);
number = 1;
for deep = 1:n^2
    temp_banqun = cell(10000,1);
    number2 = 0;
    for i = 1:number
        A = n_banqun{i};
        for k = 1:n
            newA = A;
            newA(deep) = k;
            if is_jiehe(newA)
                number2 = number2+1;
                temp_banqun{number2} = newA;
            end
        end
    end
    n_banqun = temp_banqun(1:number2);
    number = number2;
end

