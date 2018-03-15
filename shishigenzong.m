function a=shishigenzong(counts)
[countsline,countscolumn]=size(counts);%base elements num is decided by countscolumn
framenum=countsline/countscolumn;
tempimage=zeros(countscolumn,countscolumn);
for frame=1:framenum
  recimage=imagerec(counts((frame-1)*countscolumn+1:frame*countscolumn,:));
  tempimage=tempimage+recimage;
  snrbase=snr(tempimage);
%   if frame==framenum
figure(frame);
tcolor(tempimage),title(['totaltime is ' num2str(frame) ' SNRBASE = ' num2str(snrbase) ]);colorbar;
%   end
print(frame,'-djpeg',['C:\Users\lxz\Desktop\matlab½Å±¾\movesource\totaltime' num2str(frame) '.jpeg' ]);
end

end