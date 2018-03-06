function a=searchmaxcode(code,times)
%for the purpose to find the max-snr code developed from random fix matrix number
% display the randerr : randerr(5,5,2) denotes that matrix(5,5) with 2
% num(1) in each row
% randerr(5,5,2)
% 
% ans =
% 
%      0     1     0     0     1
%      0     0     1     1     0
%      1     1     0     0     0
%      0     0     1     1     0
%      1     1     0     0     0
[line,row]=size(code);
snrbegin=jj(code);
snrtemp=0;
for timefor=1:times
    snrpre=snrbegin;%
%     i=randi([1 line]);%use random step
%     j=randi([1 row]);
     for i=1:line
        for j=1:row
             code(i,j)=invers01(code(i,j));

            snrtemp=jj(code);
            if snrtemp>snrbegin
                snrbegin=snrtemp;
            else
                  code(i,j)=invers01(code(i,j));
%                  if code(i,j)==0
%                 code(i,j)=1;
%                  else
%                 code(i,j)=0;
%                  end
            end
            if snrbegin>100%search Inf of PSF
                break;
            end
        end
     end
     if snrbegin==snrpre
         break;%if all the elements in the matrix toggled dosen't work more effective then break
     end
end

a=code;
               
        




end