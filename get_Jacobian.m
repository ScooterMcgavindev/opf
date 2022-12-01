function [dSdt, dSdv] = get_Jacobian(S,Vbus,Ibus)
j=1i;

dSdt=-j*diag(Vbus)*conj(S.Ybus)*diag(conj(Vbus))+j*diag(conj(Ibus))*diag(Vbus);

dSdv=diag(Vbus)*conj(S.Ybus)*diag(conj(Vbus)./abs(Vbus))+diag(conj(Ibus))*diag(Vbus./abs(Vbus));
end