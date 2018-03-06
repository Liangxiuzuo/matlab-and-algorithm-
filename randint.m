function  a=randint(n,m)

guodujuzhen1=rand(n,m);
for i=1:n
    for j=1:m
        if guodujuzhen1(i,j)<=0.5
            guodujuzhen1(i,j)=0;
        else
            guodujuzhen1(i,j)=1;
        end
    end
end
a=guodujuzhen1;



end