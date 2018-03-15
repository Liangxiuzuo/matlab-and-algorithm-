function a=mydisplacement(direction,b)
%for the 8 differant direction move of gamma source
[line,column]=size(b);
temparray=zeros(line,column);
if direction==2%left move
    for i=1:line
        for j=1:column
            temparray(i,j)=b(rem((i+1)-2,line)+1,rem((j+2)-2,column)+1);
        end
    end
end
if direction==3%right move
    for i=1:line
        for j=1:column
            temparray(i,j)=b(rem((i+1)-2,line)+1,rem((j+column)-2,column)+1);
        end
    end
end
if direction==4%up move
    for i=1:line
        for j=1:column
            temparray(i,j)=b(rem((i+line)-2,line)+1,rem((j+1)-2,column)+1);
        end
    end
end
if direction==5%down move
    for i=1:line
        for j=1:column
            temparray(i,j)=b(rem((i+2)-2,line)+1,rem((j+1)-2,column)+1);
        end
    end
end
if direction==6%left up move
    for i=1:line
        for j=1:column
            temparray(i,j)=b(rem((i+line)-2,line)+1,rem((j+2)-2,column)+1);
        end
    end
end
if direction==7%right up move
    for i=1:line
        for j=1:column
            temparray(i,j)=b(rem((i+line)-2,line)+1,rem((j+column)-2,column)+1);
        end
    end
end
if direction==8%left down move
    for i=1:line
        for j=1:column
            temparray(i,j)=b(rem((i+2)-2,line)+1,rem((j+2)-2,column)+1);
        end
    end
end
if direction==9%right down move
    for i=1:line
        for j=1:column
            temparray(i,j)=b(rem((i+2)-2,line)+1,rem((j+2)-2,column)+1);
        end
    end
end
a=temparray;



end