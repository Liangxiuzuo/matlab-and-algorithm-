function bar3c(z)
% ��Ҫ���������3ά��״ͼ��
% ��򵥵�д�����£�
% figure(2);
% clc; clear all; close all;
% label1 = {'����', '����', '����', '������'};%��ǩ
% label2 = {'�ϸ���','��Ʒ��','��Ʒ��'};%��ǩ
% labelx=[2 4 6 8 10 12 14 16 18 20 22 24];
% Z = rand(3, 4);%3denote the y axis and 4 denotes the x axis
% z=[3049 1532 1060 823 675 567 556 542 531 517 518 490];
figure;
% var=zeros(1,12);
% for i=1:12
%     var(1,i)=z(1,i);
% end
hb = bar3(z,0.3);%0.3 denotes the width of column
% figure(1);
renderCDataByHeight(hb, false);
colorbar;
% set(gca, 'yticklabel', labelx);
% set(gca, 'yticklabel', label2);
% view([-28, 40])
%���ֱ�ע
for i = 1:size(z,1)
    for j = 1:size(z,2)
        text(i, j-0.5, z(i,j)+1, num2str(z(i,j)));
    end
end
pause(2);
% figure(2);
renderCDataByHeight(hb, false);
% pause(2);
% renderCDataByHeight(hb, false);
% colormap spring; 




function renderCDataByHeight(hb, interp)
% hbΪbar3���ص���ά��״ͼ���,
% ��hb�ĸ����Ӱ��߶���ȾCData���ԣ�
% interpָ���Ƿ񽥱�(Ĭ��Ϊfalse)
% interp==true:ÿ�����Ӵ��µ�����ɫ����
% interp==false:ÿ������һ����ɫ
% hb�о������������������,hb(j)Ϊ��j�����ݵľ��
if nargin == 1
    % interpĬ��ֵ
    interp=false;
end
if interp == true
    %ÿ�����Ӵ��µ�����ɫ����
    shading interp;
    for j = 1 : length(hb)
        % ��Zdata����ȥ���Cdata����
        zdata = get(hb(j), 'Zdata');
        set(hb(j), 'Cdata', zdata);
        % ���ñ�����ɫ
        set(hb, 'EdgeColor', [0.5 0.5 0.5]);
    end
else
    % ÿ������һ����ɫ
    for j = 1:length(hb)
        % ����hb(j)��Cdata����
        % ����CData��ֵcdata�����滻���ֵ
        % cdata����ZData�Ļ������޸Ķ���
        cdata = get(hb(j), 'ZData');
        % cdata��������6������������
        m = size(cdata,1)/6;
        % ���cdata
        for i = 1:m
            % ����cdata��(i,j)���ݶ�Ӧ��6��
            % ����6�е�ֵ�����(i,j)���ݵ�ֵ
            vij = cdata((i-1)*6+2,2);%����cdata(ZData)�л��(i,j)���ݵ�ֵ
            cdata((i-1)*6+1:(i-1)*6+6,:) = vij;%(i,j)���ݶ�Ӧ��6��������
        end
        set(hb(j), 'Cdata', cdata);%��cdata����Cdata����
    end
end
%another pwerful function to do this 
% M=rand(30,20);
% figure
% subplot(1,2,1)
% h=bar3(M);
% for n=1:numel(h)
%     cdata=get(h(n),'zdata');
%     set(h(n),'cdata',cdata,'facecolor','interp')
% end
% 
% subplot(1,2,2)
% h=bar3(M);
% for n=1:numel(h)
%     cdata=get(h(n),'zdata');
%     cdata=repmat(max(cdata,[],2),1,4);
%     set(h(n),'cdata',cdata,'facecolor','flat')
% end 



