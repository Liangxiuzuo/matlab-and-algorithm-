function a=findhot(counts)
[countsline,countscolumn]=size(counts);%base elements num is decided by countscolumn
framenum=countsline/countscolumn;
for frame=1:framenum
    if frame==1
        recimagemostsnr=imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:));
        %snrrec=snr(recimage|(frame)|);
        recimagemostsnr=uniformcode(recimagemostsnr);
    end
    if frame>1
        
        for casenum=1:9
            if casenum==1
               rectemp1=recimagemostsnr+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
               rectemp1 =uniformcode(rectemp1);
               snrcase1=snr(rectemp1);%evey condition represent a snr
               snrcasetempmost=snrcase1;% suppose most snr is now 
               recimagemostsnrtemp=rectemp1;%suppose most-snr rec image is now
            end
            
            if casenum==2
               rectemp2=mydisplacement(2,recimagemostsnr)+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
                rectemp2 =uniformcode(rectemp2);
               snrcase2=snr(rectemp2);
               if snrcase2>snrcasetempmost
                   snrcasetempmost=snrcase2;
                   recimagemostsnrtemp=rectemp2;
               end
            end
            if casenum==3
               rectemp3=mydisplacement(3,recimagemostsnr)+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
                rectemp3 =uniformcode(rectemp3);
               snrcase3=snr(rectemp3);
               if snrcase3>snrcasetempmost
                   snrcasetempmost=snrcase3;
                   recimagemostsnrtemp=rectemp3;
               end               
            end

            if casenum==4
               rectemp4=mydisplacement(4,recimagemostsnr)+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
                rectemp4 =uniformcode(rectemp4);
               snrcase4=snr(rectemp4);
               if snrcase4>snrcasetempmost
                   snrcasetempmost=snrcase4;
                   recimagemostsnrtemp=rectemp4;
               end                 
            end
            if casenum==5
               rectemp5=mydisplacement(5,recimagemostsnr)+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
                rectemp5 =uniformcode(rectemp5);
               snrcase5=snr(rectemp5);
               if snrcase5>snrcasetempmost
                   snrcasetempmost=snrcase5;
                   recimagemostsnrtemp=rectemp5;
               end                 
            end
            if casenum==6
               rectemp6=mydisplacement(6,recimagemostsnr)+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
                rectemp6 =uniformcode(rectemp6);
               snrcase6=snr(rectemp6);
               if snrcase6>snrcasetempmost
                   snrcasetempmost=snrcase6;
                   recimagemostsnrtemp=rectemp6;
               end                 
            end            
            if casenum==7
               rectemp7=mydisplacement(7,recimagemostsnr)+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
                rectemp7 =uniformcode(rectemp7);
               snrcase7=snr(rectemp7);
               if snrcase7>snrcasetempmost
                   snrcasetempmost=snrcase7;
                   recimagemostsnrtemp=rectemp7;
               end                 
            end
            if casenum==8
               rectemp8=mydisplacement(8,recimagemostsnr)+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
                rectemp8 =uniformcode(rectemp8);
               snrcase8=snr(rectemp8);
               if snrcase8>snrcasetempmost
                   snrcasetempmost=snrcase8;
                   recimagemostsnrtemp=rectemp8;
               end                 
            end            
            if casenum==9
               rectemp9=mydisplacement(9,recimagemostsnr)+uniformcode(imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:)));
                rectemp9 =uniformcode(rectemp9);
               snrcase9=snr(rectemp9);
               if snrcase9>snrcasetempmost
                   snrcasetempmost=snrcase9;
                   recimagemostsnrtemp=rectemp9;
               end                 
            end   
        end
        recimagemostsnr=recimagemostsnrtemp;
        figure(frame),tcolor(recimagemostsnr);title( [' SNRBASE = ' num2str(snrcasetempmost) ]);colorbar;
%         print(frame,'-djpeg',['C:\Users\lxz\Desktop\matlab½Å±¾\movesource\move' num2str(frame) '.jpeg' ]);
    end
            
end
a=recimagemostsnr;
end