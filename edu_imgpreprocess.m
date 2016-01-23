

function img = edu_imgpreprocess(I)

Igray = rgb2gray(I);

Ibw = im2bw(Igray,graythresh(Igray));

Iedge = edge(uint8(Ibw));

se = strel('square',3);

Iedge2 = imdilate(Iedge, se); 

Ifill= imfill(Iedge2,'holes');

[Ilabel num] = bwlabel(Ifill);%%mistake is here

Iprops = regionprops(Ilabel);

Ibox = [Iprops.BoundingBox];
Ibox = reshape(Ibox,[4 num]);

Ic = [Iprops.Centroid];
Ic = reshape(Ic,[2 num]);
Ic = Ic';
Ic(:,3) = (mean(Ic.^2,2)).^(1/2);
Ic(:,4) = 1:num;

% Extra lines compare to example2 to extract all the components into an
% cell array
Ic2 = sortrows(Ic,2);

for cnt = 1:(num/10)
    Ic2((cnt-1)*10+1:cnt*10,:) = sortrows(Ic2((cnt-1)*10+1:cnt*10,:),4);
end

Ic3 = Ic2(:,1:2);
ind = Ic2(:,4);

for cnt = 1:num
    img{cnt} = imcrop(Ibw,Ibox(:,ind(cnt)));
end

