function outarray=uniformcode(inarray)
[line,column]=size(inarray);
outarray=zeros(line,column);
maxarraypeak=max(max(inarray));
for i=1:line
    for j=1:column
        outarray(i,j)=inarray(i,j)/maxarraypeak;
    end
end






end