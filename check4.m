img = getsnapshot(obj);
imwrite(img,'test.jpg')

It=imread('test.jpg');
%ss=size(Itt);
%ss=ss(1,2);
%for i=1:(ss-100)
%    It(:,i)=Itt(:,i);
%end
imshow(It);
Itgray = rgb2gray(It); 
Itbw = im2bw(Itgray,graythresh(Itgray));
Itedge = edge(uint8(Itbw));
set = strel('square',2); Iedge2 = imdilate(Itedge, set);
Itfill= imfill(Iedge2,'holes'); imshow(Itfill) 


[Itlabel numt] = bwlabel(Itfill);
disp(numt); Itprops = regionprops(Itlabel); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
s= Itprops;x=1;L=s(1).Area;
for i=1:numt-1
    if(s(i+1).Area)>L
     x=i+1;
    L=s(i+1).Area;
    end

end
numt
Itprops(x)=[];
numt=numt-1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Itbox = [Itprops.BoundingBox]; Itbox = reshape(Itbox,[4 numt]); imshow(It)

hold on; for cntt = 1:numt rectangle('position',Itbox(:,cntt),'edgecolor','r'); end
Itc = [Itprops.Centroid];
Itc = reshape(Itc,[2 numt]);
Itc = Itc';
Itc(:,3) = (mean(Itc.^2,2)).^(1/2);
Itc(:,4) = 1:numt;


% Extra lines compare to example2 to extract all the components into an
% cell array
Itc2 = sortrows(Itc,1);
a=Itc2(:,1);
r=size(a);
w=r(1,1)-1;
a=a'
%%%%%%%%%
t=0;
for i=1:(w-1)
    if ((a(1,i+1)-a(1,i))>60)
        t=t+1;
    end
end

e=zeros(t);
z=e(1,:);
j=1;
for i=1:(w-1)
   % for j=1:t
    if((a(1,i+1)-a(1,i))>60)
        z(1,j)=i
        j=j+1;
    end
end
%%%%%%%%
%%%%%%%%%
for cnt = 1:(numt/10)
    Itc2((cnt-1)*10+1:cnt*10,:) = sortrows(Itc2((cnt-1)*10+1:cnt*10,:),4);
end

Itc3 = Itc2(:,1:2);
ind = Itc2(:,4);
for cnt = 1:numt
    imgt{cnt} = imcrop(Itbw,Itbox(:,ind(cnt)));
end



%%imgt = edu_imgpreprocess(It);

for cntt = 1:numt
    bw2t = edu_imgcrop(imgt{cntt});
    charvect = edu_imgresize(bw2t);
    outt(:,cntt) = charvect;
end
[a1,b1]=max(sim(net,outt));
disp(b1-1);
ca=b1-1;
%%%%%%%%%%%%%%%
for i=1:w-1
    c(:,i)=ca(:,i);
end
%%%%%%%%%%%%%%%
pi=zeros(1,t-1);
for u=1:t-1
    pi(:,u)=z(1,(u+1))-z(1,(u));
    
end
oo=zeros(1,t-1);

for i=1:t-1
    for j=(pi(1,i)-2):-1:0
        oo(:,i)=oo(:,i)+(c(1,(z(1,i)+pi(1,i)-j-1)))*(10^j);
    end
    
end
%%%%%%%%
n1=0;
for i=(z(1,1)-2):-1:0
    n1= n1+(c(1,z(1,1)-i-1))*(10^i);
end
dd=w-z(1,t);
n2=0;

for i=0:dd-2
    n2=n2+(c(1,w-i-1))*(10^i);
end

fprintf('value of power supply is=')
disp(n1);
%%fprintf('value of last resistance is=')
%%disp(n2);
for i=1:t-1
fprintf('value of resistance is=')
disp(oo(1,i));
end
fprintf('value of last resistance is=')
disp(n2);
g=0;
for i=1:t-1
    g=g+oo(1,i);
end
fprintf('value of equivalant resister is=')
disp(g+n2);
fprintf('value of current is=')
disp(n1/(g+n2));% fprintf('A');