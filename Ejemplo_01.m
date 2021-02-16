% Ejemplo GoDec 01
m = 25;
n = 20;
k = 7;
c0 = 10;
epsilon = 10^-5;
q = 3;

X = 10*rand(m,n);
[L1,S1,E1] = GoDec_Naive(X,k,c0,epsilon);
[L2,S2,E2] = GoDec_Fast(X,k,c0,q,epsilon);
[L3,S3,RMSE,E3] = Ref_GoDec_Fast(X,k,c0,q,epsilon);
E1
E2
E3
 
