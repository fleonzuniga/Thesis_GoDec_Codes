clear all;
clc;
pkg load video;
name = "Commerce_Mall";
filename = strcat(name,".mp4");
if(!exist(filename,"file"))
  warning("'%s' doesn't exist",filename);
else
  disp("Read video");
  video = VideoReader(filename);
  height = video.Height;
  width = video.Width;
  id = [];
  X = [];
  while(!isempty(img=readFrame(video)))
    img = im2double(img);
    img = mean(img,3);
    step = 1;
    img = img(...
      200:step:400-1,...
      400:step:800-1);
    X = [X,img(:)];
    if(isempty(id))
      id = imagesc(img);
    else
      set(id,"cdata",img)
    endif
    drawnow;
    pause(1/video.FrameRate);
  endwhile
  disp("Saving X matrix...");
  filename = strcat(name,".mat");
  save filename X;
  disp("X matrix saved");
endif