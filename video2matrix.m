clear all;
clc;
pkg load video;

dir = "../videos/";
name = "Commerce_Mall";
frame_step = 1;
pixel_step = 2;
height_begin = 200;
height_end = 399;
width_begin = 400;
width_end = 799;
h = height_begin:pixel_step:height_end;
w = width_begin:pixel_step:width_end;
h_length = length(h);
w_length = length(w);

filename = strcat(dir,name,".mp4");
if(!exist(filename,"file"))
  warning("'%s' doesn't exist",filename);
else
  disp("Read video");
  video = VideoReader(filename);
  id = [];
  X = [];
  for(frame=1:frame_step:video.NumberOfFrames)
    img = readFrame(video);
    img = im2double(img);
    img = mean(img,3);
    img = img(h,w);
    X = [X,img(:)];
    if(isempty(id))
    id = imagesc(img);
    else
      set(id,"cdata",img)
    endif
    drawnow;
    pause(1/video.FrameRate);
  endfor
  disp("Saving X matrix...");
  filename = strcat(name,".mat");
  save(filename,"X","h_length","w_length");
  disp("X matrix saved");
endif