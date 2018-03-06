function A = URA (num)
% for the goal to get the num elements of one-dimensional URA arrays
A=zeros(1,num);
A(1,1)=1;
for i=2:num
    k=0;
    for j=1:(num-1)
        if (i-1)== rem(j*j,num)
            k=k+1;
        end
    end
    if k>0
        A(1,i)=1;
    end
end
end