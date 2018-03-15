function snr = snr( A )
%SNS 姝ゅ鏄剧ず鏈夊叧姝ゅ嚱鏁扮殑鎽樿
%   姝ゅ鏄剧ず璇︾粏璇存槑
%改造后的snr计算公式为（Nmax-~M）^Mnum/^$(Mij-~M)^2
[x0,y0]=size(A);
% if x0<16 && y0<16
%     disp('error,鐭╅樀蹇呴』澶т簬16X16');
% end
Nmax=max(max(A));
[x,y]=find(A==max(max(Nmax)));
sumv =0,noiseav=(sum(sum(A))-Nmax)/(x0*y0-1);

for i=1:x0
    for j=1:y0
        if i~=x|j~=y
            sumv=sumv+(A(i,j)-noiseav)^2;
        end
    end
end

snr=(Nmax-noiseav)*sqrt(x0*y0-1)/sqrt(sumv);
% 
% snr=Nmax;
% if x<=8
%     xmin=1;
%     xmax=x+7;
% else
%     if x0-x<=8
%         xmax=x0;
%         xmin=x-7;
%     else
%         xmin=x-7;
%         xmax=x+7;
%     end
% end
% 
% if y<=8
%     ymin=1;
%     ymax=x+7;
% else
%     if y0-y<=8
%         ymax=y0;
%         ymin=y-7;
%     else
%         ymin=y-7;
%         ymax=y+7;
%     end
% end
% Mnum=x0*y0-(xmax-xmin+1)*(ymax-ymin+1);
% M=(sum(sum(A))-sum(sum((A(xmin:xmax,ymin:ymax)))))/Mnum;
% for i=1:x0
%     for j=1:y0
%         Asum(i,j)=(A(i,j)-M)^2;
%     end
% end
% Mijsum=sum(sum(Asum))-sum(sum(Asum(xmin:xmax,ymin:ymax)));
% snr=(Nmax-M)*sqrt(Mnum)/sqrt(Mijsum);

end
