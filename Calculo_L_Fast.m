function L = Calculo_L_Fast(A,L,k,q)
  [~,n] = size(A);
  % matriz aleatoria gaussiana
  Y2 = randn(n,k);
  for i=1:q+1
    Y1 = L*Y2;
    Y2 = L'*Y1;
  endfor
  [Q,~] = qr(Y2);
  Qk = Q(:,1:k);
  L = (L*Qk)*Qk';
  % Linea 9 y 10 se puede reducir en: [Qk,~] = qr(Y2,0);
endfunction
