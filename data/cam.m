clc;
clear all;
imaqreset;
z=imaqhwinfo
y=imaqhwinfo('winvideo')
dev_info = imaqhwinfo('winvideo',1)
celldisp(dev_info.SupportedFormats)
