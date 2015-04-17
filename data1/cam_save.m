clc;
clear all;
imaqreset;
vid=videoinput('winvideo',1,'YUY2_320x240');
preview(vid)
pause(10)
a=getsnapshot(vid);
a = ycbcr2rgb(a);
%g=a(:,:,1);%to select red matrix write 1, green -2 , b
imwrite(a,'B2.bmp');
imview(a)
stop(vid);
close all