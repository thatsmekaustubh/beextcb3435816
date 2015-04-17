
function [NormImage prob] = preprocessing(imgs,img1,nRows,nColumns)

b1 = rgb2ycbcr(imgs);
c1 = b1(:,:,1);
c1 = roicolor(c1,0,50);

c1 =~ c1;
[lab1,num1]=bwlabel(c1,8);
sizeblob1 = zeros(1,num1);
for i=1:num1,
    sizeblob1(i) = length(find(lab1==i));
end
    [maxno1 largestBlobNo1] = max(sizeblob1);
    outim1 = zeros(size(c1),'uint8');
    outim1(find(lab1==largestBlobNo1)) = 1;
    last1=255*outim1;
    a1=last1;
[f1 c1]=find(a1);
lmaxc1=max(c1);lminc1=min(c1);
lmaxf1=max(f1);lminf1=min(f1);
imgn1=a1(lminf1:lmaxf1,lminc1:lmaxc1);%Crops image
im_thresh1 = imgn1;
[r1 c1] = size(last1);
    recon1 = zeros(r1,c1);
    
    for i = 1:r1
        for j = 1:c1
            
            if last1(i,j) == 255
                recon1(i,j) = b1(i,j,1);
                
            end
        end
    end
recon1 = uint8(recon1);
% figure, imshow(recon1);
e_rec1 = edge(recon1,'canny');
% figure, imshow(e_rec1);
im_edge1 = e_rec1;

b2 = rgb2ycbcr(img1);
c2 = b2(:,:,1);
c2 = roicolor(c2,0,50);

c2 =~ c2;
[lab2,num2]=bwlabel(c2,8);
sizeblob2 = zeros(1,num2);
for i=1:num2,
    sizeblob2(i) = length(find(lab2==i));
end
    [maxno2 largestBlobNo2] = max(sizeblob2);
    outim2 = zeros(size(c2),'uint8');
    outim2(find(lab2==largestBlobNo2)) = 1;
    last2=255*outim2;
  a2=last2;
[f2 c2]=find(a2);
lmaxc2=max(c2);lminc2=min(c2);
lmaxf2=max(f2);lminf2=min(f2);
imgn2=a2(lminf2:lmaxf2,lminc2:lmaxc2);%Crops image
im_thresh2 = imgn2;

[r2 c2] = size(last2);
    recon2 = zeros(r2,c2);
    
    for i = 1:r2
        for j = 1:c2
            
            if last2(i,j) == 255
                recon2(i,j) = b2(i,j,1);
                
            end
        end
    end
recon2 = uint8(recon2);
% figure, imshow(recon2);
e_rec2 = edge(recon2,'canny');
% figure, imshow(e_rec2);
im_edge2 = e_rec2;

im_thresh11 = imresize(im_thresh1,[100 100]);
im_thresh22 = imresize(im_thresh2,[100 100]);
% prob = corr2(im_edge1,im_edge2);
prob = corr2(im_thresh11,im_thresh22);

%Resize skin region to entire image
NormImage = [];
% NormImage = reshape(ThresImage,nRows*nColumns,1);%Reshape to column vector