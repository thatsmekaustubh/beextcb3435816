clc
clear all
a = imread('A1.bmp');
figure, imshow(a);
b = rgb2ycbcr(a);
c = b(:,:,1);
% imview(c)
c = roicolor(c,0,100);
% imview(c)
c =~ c;
[lab,num]=bwlabel(c,8);
sizeblob = zeros(1,num);
for i=1:num,
    sizeblob(i) = length(find(lab==i));
end
    [maxno largestBlobNo] = max(sizeblob);
    outim = zeros(size(c),'uint8');
    outim(find(lab==largestBlobNo)) = 1;
    last=255*outim;
    im_thresh = last;
figure, imshow(last);
    
    [r c] = size(last);
    recon = zeros(r,c);
    
    for i = 1:r
        for j = 1:c
            
            if last(i,j) == 255
                recon(i,j) = b(i,j,1);
                
            end
        end
    end
recon = uint8(recon);
figure, imshow(recon);
e_rec = edge(recon,'canny');
figure, imshow(e_rec);
im_edge = e_rec;