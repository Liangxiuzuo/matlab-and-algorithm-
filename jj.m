function a=jj(code)%用于测试卷积的SNR
% code=[
% %     1 1 1 1 1 1 1 1 1 0 0 0 1 1 1 0 0 0 0 0 0 
% % 5 4 6 4 5 4 5
% % 2 2 2 1 2 1 1
% 0 0 0 0 0 0 0 0 0 0 0;%be careful  the first number is 1!!!!!!
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 0 1 0 0 0 1 1 1 0 1;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 0 1 0 0 0 1 1 1 0 1;
% 1 0 1 0 0 0 1 1 1 0 1;
% 1 0 1 0 0 0 1 1 1 0 1;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 0 1 0 0 0 1 1 1 0 1;
% ];
% [column,row]=size(code);
% for i=1:column
%     for j=1:row
%         if code(i,j)==0
%             code(i,j)=0.3;
%         
%         end
%     end
% end
% uncode=[
% %     9 8 7 7 8 8 8;
% %     10 9 9 9 10 9 10;
% %      5 4 6 4 5 4 5
% %     2 2 2 1 2 1 1
% %    2 1.5 2 1 1.5 1.5 1.5
% %     4 3 4 2 3 3 3 
% 0 0 0 0 0 0 0 0 0 0 0;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 0 1 0 0 0 1 1 1 0 1;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 0 1 0 0 0 1 1 1 0 1;
% 1 0 1 0 0 0 1 1 1 0 1;
% 1 0 1 0 0 0 1 1 1 0 1;
% 1 1 0 1 1 1 0 0 0 1 0;
% 1 0 1 0 0 0 1 1 1 0 1;
% ];
% % for i=1:7
% %     uncode(1,i)=uncode(1,i)/1;
% % end
% for i=1:11
%     for j=1:11
%         
%           if uncode(i,j)==0
%             uncode(i,j)=0.3;
%         
%         end
%     end
% end
line = size(code,1) ;row=size(code,2);
uncode=ones(line,row);
for i=1:line
    for j=1:row
        if code(i,j)==0
            uncode(i,j)=-1;
        end
    end
end
 testjj=zeros(line,row);
 for i=1:line
    for j=1:row
        for k=1:line
            for l=1:row
                               testjj(i,j)=testjj(i,j)+uncode(k,l)*code(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1);
%                                testjj(i,j)=testjj(i,j)+abs(activatef(uncode(k,l)/code(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1)));
%                                testjj(i,j)=testjj(i,j)+abs(log(uncode(k,l)/code(rem((i+k)-2,line)+1,rem((j+l)-2,row)+1)));

            end
        end
    end
 end
snrbase=snr(testjj);
% figure;
% bar3c(testjj),title(['SNRBASE = ' num2str(snrbase)]);colorbar;

a=snrbase;
end