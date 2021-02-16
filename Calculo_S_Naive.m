function S = Calculo_S_Naive(A,c0)
  S = zeros(size(A));
  [~,idx] = sort(abs(A(:)),'descend');
  S(idx(1:c0)) = A(idx(1:c0));
endfunction
