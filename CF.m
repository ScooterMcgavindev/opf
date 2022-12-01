function cost = CF(x,S)

n = S.bus.n;
ng = S.gen.ng;

Ps = x(2*n:2*n+ng-1)*100;

% Cgi = alpha_gi*Pgi^2 + beta_gi*Pgi + gamma_gi
% alpha_gi = S.gen.a
% beta_gi = S.gen.b
% gamma_gi = S.gen.c

cost = (S.gen.a)'*Ps.^2+S.gen.b'*Ps+ones(1,ng)*S.gen.c;

end
