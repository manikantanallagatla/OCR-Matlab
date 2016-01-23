
A=imresize(imread('letters_numbers\A.bmp'),[42,24]);B=imresize(imread('letters_numbers\B.bmp'),[42,24]);
C=imresize(imread('letters_numbers\C.bmp'),[42,24]);D=imresize(imread('letters_numbers\D.bmp'),[42,24]);
E=imresize(imread('letters_numbers\E.bmp'),[42,24]);F=imresize(imread('letters_numbers\F.bmp'),[42,24]);
G=imresize(imread('letters_numbers\G.bmp'),[42,24]);H=imresize(imread('letters_numbers\H.bmp'),[42,24]);
I=imresize(imread('letters_numbers\I.bmp'),[42,24]);J=imresize(imread('letters_numbers\J.bmp'),[42,24]);
K=imresize(imread('letters_numbers\K.bmp'),[42,24]);L=imresize(imread('letters_numbers\L.bmp'),[42,24]);
M=imresize(imread('letters_numbers\M.bmp'),[42,24]);N=imresize(imread('letters_numbers\N.bmp'),[42,24]);
O=imresize(imread('letters_numbers\O.bmp'),[42,24]);P=imresize(imread('letters_numbers\P.bmp'),[42,24]);
Q=imresize(imread('letters_numbers\Q.bmp'),[42,24]);R=imresize(imread('letters_numbers\R.bmp'),[42,24]);
S=imresize(imread('letters_numbers\S.bmp'),[42,24]);T=imresize(imread('letters_numbers\T.bmp'),[42,24]);
U=imresize(imread('letters_numbers\U.bmp'),[42,24]);V=imresize(imread('letters_numbers\V.bmp'),[42,24]);
W=imresize(imread('letters_numbers\W.bmp'),[42,24]);X=imresize(imread('letters_numbers\X.bmp'),[42,24]);
Y=imresize(imread('letters_numbers\Y.bmp'),[42,24]);Z=imresize(imread('letters_numbers\Z.bmp'),[42,24]);

letter=[A B C D E F G H I J K L M...
    N O P Q R S T U V W X Y Z];


templates=mat2cell(letter,42,[24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24 24 24 ...
    24 24 24 24 24]);
save ('templates','templates')
clear all
