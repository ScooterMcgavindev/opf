% Y-Bus File

% Use 'sparse' to create an nxn matrix

function S = Ybus(S)
j=1i;

% Generate sparse matrix with diagonal shunt elements
S.Ybus=sparse(diag(S.bus.shuntG+j*S.bus.shuntB));

% Adding to diagonal elements in 'from' column
S.Ybus = S.Ybus+sparse(S.branch.from,S.branch.from,1./(S.branch.R+j*S.branch.X)+(j*S.branch.B)/2,S.bus.n,S.bus.n)

%From = S.branch.from;

% Adding to diagonal elements in 'to' col
S.Ybus= S.Ybus + sparse(S.branch.to,S.branch.to, 1./(S.branch.R+j*S.branch.X)+(j*S.branch.B)/2,S.bus.n,S.bus.n);

% Fills off diagonal elements (i,j)
S.Ybus=S.Ybus+sparse(S.branch.from,S.branch.to, -1./(S.branch.R+j*S.branch.X)+j*S.branch.B/2,S.bus.n,S.bus.n);
% Fills off diagonal elements (j,i)
S.Ybus=S.Ybus+sparse(S.branch.to,S.branch.from, -1./(S.branch.R+j*S.branch.X)+j*S.branch.B/2,S.bus.n,S.bus.n);


