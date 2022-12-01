% Optimal Power Flow Function
% OPF = PF + ED

function S = opf(S)

ng = S.gen.ng;      % ng = number of generators
n = S.bus.n;        % n = number of buses

%% Linear Constraints

% Generator Limits
Pmin = S.gen.Pmin./100;
Pmax = S.gen.Pmax./100;

Qmin = S.gen.Qmin./100;
Qmax = S.gen.Qmax./100;

% Voltage Limits
Vmin = ones(n,1)*.9;
Vmax = ones(n,1)*1.1;

% Angle (Theta) Limits
Theta_min = ones(n-1,1)*-pi/9;
Theta_max = ones(n-1,1)*pi/9;

% Linear Constraint Bounds
lb = [Theta_min; Vmin; Pmin; Qmin];     % Lower bound
ub = [Theta_max; Vmax; Pmax; Qmax];     % Upper bound

x0 = [zeros(n-1,1); ones(n,1); 0.5*(Pmax-Pmin); 0.5*(Qmax-abs(Qmin))];

A = [];
b = [];
Aeq = [];
beq = [];

OptOpf = optimset('Display', 'iter', 'Diagnostics', 'on', 'DerivativeCheck', 'on',...
    'LargeScale', 'off', 'GradConstr', 'off', 'GradObj', 'off', 'Hessian', 'off',...
    'MaxIter', 5000, 'MaxFunEvals', 100000);

[x,fval,exitflag,output1,lambda] = fmincon(@CF, x0, A, b, Aeq, beq, lb, ub, @nlc, OptOpf, S);

S.xopt = x;
S.opf.x = x;
S.opf.fval = fval;
S.opf.lambda = lambda;

S.bus.angle = [0; x(1:n-1)];    % slack bus angle = 0
S.bus.voltage = x(n:2*n-1);

Vbus = S.bus.voltage.*exp(j*S.bus.angle);
S.Sbus = Vbus.*conj(S.Ybus*Vbus);

S.gen.Ps = x(2*n:2*n+ng-1)*100;
S.gen.Qs = x(2*n+ng:length(x))*100;

[sum(S.gen.Ps) sum(S.bus.loadMW) sum(S.gen.Ps)-sum(S.bus.loadMW)]
[sum(S.gen.Qs) sum(S.bus.loadMVAR) sum(S.gen.Qs)-sum(S.bus.loadMVAR)]

[real(S.Sbus) S.bus.loadMW]
[imag(S.Sbus) S.bus.loadMVAR]

end
