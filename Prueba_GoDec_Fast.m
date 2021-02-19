function [L,S,E] = Prueba_GoDec_Fast(X,k,c0,q,epsilon)
  [m,n] = size(X);
  L = X;
  S = zeros(m,n);
  t = 1;
  E = 1;
  while true
    t = t + 1;
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculo de matriz de rango reducido L %%%%%%%%%%
    L_ = Calculo_L_Fast(X-S,L,k,q);
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculo de la matriz esparcida S %%%%%%%%%%%%%%%
    % S = Calculo_S_Naive(X-L,c0); %%%%%%%%%%%%%%%%%%%
    A = L-L_+S;
    S = zeros(size(A));
    [~,idx] = sort(abs(A(:)),'descend');
    S(idx(1:c0)) = A(idx(1:c0));
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Calculo del error %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    E(t) = norm(X-L-S,'fro');%^2/norm(X,'fro')^2;
    if abs(E(t)-E(t-1)) < epsilon
      break;
    endif
    L = L_
  endwhile
endfunction
