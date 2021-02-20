clear all;
clc;
display("Loading matrix");
tic;
load "hall1-200.mat"; X = XO; Size = [144,176];
toc;
display("Matrix loaded");
display("Process GoDec");
tic;
[L,S,E] = GoDec_Fast(X,k=2,c0=1e+5,q=0,epsilon=1e-3);
toc;
display("Show matrices");
G = X - L - S;
figure;
[~,frames] = size(X);
X_id = L_id = S_id = G_id = 0;
for(i=1:frames)
  X_id = column2frame(X(:,i),Size,2,2,1,"Original",i,X_id);
  L_id = column2frame(L(:,i),Size,2,2,2,"Low Rank",i,L_id);
  S_id = column2frame(S(:,i),Size,2,2,3,"Sparse",i,S_id);
  G_id = column2frame(G(:,i),Size,2,2,4,"Noise",i,G_id);
  pause(1/30);
endfor
display("Fin");