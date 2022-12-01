function S = calcs(S)
j=1i;

%Build the vector Vbus
Vbus=S.bus.voltage.*exp(j*S.bus.angle);

%Create Vfrom and Vto using the indexes
Vfrom=Vbus(S.branch.from);
Vto=Vbus(S.branch.to);

%Two currents, one for each direction
Ift=(Vfrom-Vto)./(S.branch.R+j*S.branch.X);
Itf=(Vto-Vfrom)./(S.branch.R+j*S.branch.X);

Ifrom = Ift + Vfrom .* (j*S.branch.B/2);
Ito = Itf + Vto .* (j*S.branch.B/2);



S.branch.Ifrom=Ifrom;
S.branch.Ito=Ito;
S.branch.Sft=Vfrom.*conj(Ifrom);
S.branch.Stf=Vto.*conj(Ito);

[abs(S.branch.Ifrom) rad2deg(angle(S.branch.Ifrom))];
[abs(S.branch.Ito) rad2deg(angle(S.branch.Ito))];
end