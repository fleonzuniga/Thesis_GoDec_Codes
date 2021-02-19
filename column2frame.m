function id = column2frame(A,Size,sp1,sp2,sp3,str,idx,id)
  subplot(sp1,sp2,sp3);
  if(idx==1)
    id = imagesc(reshape(A,Size));
  else
    set(id,"cdata",reshape(A,Size));
  endif
  colormap(gray);
  axis image;
  axis off;
  title(str);
endfunction