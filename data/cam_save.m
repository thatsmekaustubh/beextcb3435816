clc;
clear all;
Close all;
imaqreset;
vid=videoinput('winvideo',1,'YUY2_640x480');
preview(vid)
pause(7)
a=getsnapshot(vid);
a = ycbcr2rgb(a);
%g=a(:,:,1);%to select red matrix write 1, green -2 , b
imwrite(a,'YOU4.bmp');
imview(a)
stop(vid);
close all