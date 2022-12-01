function [C, Ceq] = nlc(x,S)

%% Parameters

j =1i;
n = S.bus.n;        % number of buses
ng = S.gen.ng;      % number of generators

theta = [0; x(1:n-1)];
v = x(n:2*n-1);

Vbus = v.*exp(j*theta);

S.Sbus = Vbus.*conj(S.Ybus*Vbus);

Ps = -S.bus.loadMW/100;
Ps(S.gen.number) = x(2*n:2*n+ng-1);

Qs = -S.bus.loadMVAR/100;
Qs(S.gen.number) = x(2*n+ng:length(x));

Peq = Ps - real(S.Sbus);
Qeq = Qs - imag(S.Sbus);

Ceq = [Peq; Qeq];

Vfrom = Vbus(S.branch.from);
Vto = Vbus(S.branch.to);

Ift = (Vfrom - Vto)./(S.branch.R + j*S.branch.X);
Itf = (Vto - Vfrom)./(S.branch.R + j*S.branch.X);

Ifrom = Ift + Vfrom.*(j*S.branch.B/2);
Ito = Itf + Vto.*(j*S.branch.B/2);

Sfrom = Vfrom.*conj(Ifrom);
Sto = Vto.*conj(Ito);

rate = S.branch.lineMVA1/100;

C = [abs(Sfrom)-rate; abs(Sto)-rate];

end
