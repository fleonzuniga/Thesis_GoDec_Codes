function L = Calculo_L_Naive(A,k)
  [U,S,V] = svd(A);
  L = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';
endfunction
