clc;
clear all;
close all;

%% Add training and test directories to path

addpath('./data1');

%% Input Image
vid=videoinput('winvideo',1,'YUY2_320x240');
preview(vid);
pause(10);
img1 = getsnapshot(vid);
img1 = ycbcr2rgb(img1);
closepreview(vid)
% img1 = imread('Y4.bmp');
%% Define variables
cAlpha = [{'A'},{'B'},{'C'},{'D'},{'G'},{'H'},{'O'},{'U'},{'V'},{'W'},{'Y'}];%No of alphabet used for data1
nTrainingSamples = 2;%No of training Images we are using.
nRows = 100;%No of rows for the images
nColumns = 100;%No of columns for the images
ImgMat = zeros(size(cAlpha,2),nTrainingSamples);%Initialize image matrix

%% Perform preprocessing of images and compare them
ll = 1;
l2 = 1;
for ii = 1:size(cAlpha,2)
    for jj = 1:nTrainingSamples 
        sFilename = strcat(cAlpha(ii),int2str(jj),'.bmp');%Form filename 
        ColorImg = imread(char(sFilename));%RGB 24 bit image
        [FinalImg prob] = preprocessing(img1,ColorImg,nRows,nColumns);%Find skin thresholded regions
        ImgMat(l2,ll) = prob;%Store image as column matrix in ImgMat
        ll = ll + 1;%Move on to next column
    end
    Imgmean(l2,1) = mean(ImgMat(l2,:));
    ll = 1;
    l2 = l2+1;
end
ImgMat;
Imgmean
[m n] = max(ImgMat);
[max count] = max(Imgmean);
ind_max = n(1);
ave_max=count


%% Display Input and Matched Output

    f = figure();
    set(gca, 'fontsize', 10);            
    set(f,'name','Output')
    subplot (1,3,1)
    imshow(img1);
    title('Input image','fontsize', 10)
    subplot (1,3,3)
    RecongImg = strcat(cAlpha(ave_max),'1.bmp');
    imshow(char(RecongImg)); 
    title(strcat('Recognise gesture is ,',cAlpha(ave_max)),'fontsize', 10);
    spech = strcat('Recognise gesture is ,',cAlpha(ave_max));
    tts(spech);


    

