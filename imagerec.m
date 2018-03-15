function a=imagerec(counts)%
%for the use of reconstructing image 
% it need uniform
code=[
%     1 1 1 1 1 1 1 1 1 0 0 0 1 1 1 0 0 0 0 0 0 
% 5 4 6 4 5 4 5
% 2 2 2 1 2 1 1
0 0 0 0 0 0 0 0 0 0 0;%be careful  the first number is 1!!!!!!
1 1 0 1 1 1 0 0 0 1 0;
1 0 1 0 0 0 1 1 1 0 1;
1 1 0 1 1 1 0 0 0 1 0;
1 1 0 1 1 1 0 0 0 1 0;
1 1 0 1 1 1 0 0 0 1 0;
1 0 1 0 0 0 1 1 1 0 1;
1 0 1 0 0 0 1 1 1 0 1;
1 0 1 0 0 0 1 1 1 0 1;
1 1 0 1 1 1 0 0 0 1 0;
1 0 1 0 0 0 1 1 1 0 1;
];
line = size(code,1) ;row=size(code,2);
uncode=ones(line,row);
for i=1:line
    for j=1:row

        if code(i,j)==0
            uncode(i,j)=-1;
        end
        if i==j
            uncode(i,j)=1;
        end
    end
end
 testjj=zeros(line,row);
 for i=1:line
    for j=1:row
        for k=1:line
            for l=1:row
                               testjj(i,j)=testjj(i,j)+uncode(k,l)*counts(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1);
%                                testjj(i,j)=testjj(i,j)+abs(activatef(uncode(k,l)/code(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1)));
%                                testjj(i,j)=testjj(i,j)+abs(log(uncode(k,l)/code(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1)));

            end
        end
    end
 end
 mintestjjvalue=min(min(testjj));
 for i=1:line
    for j=1:row
       if testjj(i,j)<0
           testjj(i,j)=0;
%            -mintestjjvalue;
       end
%                                testjj(i,j)=testjj(i,j)+uncode(k,l)*counts(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1);
%                                testjj(i,j)=testjj(i,j)+abs(activatef(uncode(k,l)/code(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1)));
%                                testjj(i,j)=testjj(i,j)+abs(log(uncode(k,l)/code(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1)));

          
    end
 end
% snrbase=snr(testjj);
% % figure;
% tcolor(testjj),title(['Elements are ' num2str(row) ' SNRBASE = ' num2str(snrbase) ]);colorbar;

a=testjj;
end