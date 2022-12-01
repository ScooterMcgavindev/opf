% Economic Dispatch problem 
% Using x = quadprog(H,f,A,b,Aeq,beq,lb,ub)
    % min Cgi = (alpha)Pgi + (beta)Pgi* +lambda < equation to solve
    % min 0.5x^(T)Hx + f^(T)x
    % where: H = 2diag(S.gen.alpha)
    %        f = S.gen.beta
    %        A =[]
    %        b =[]
    %        Aeq*x = Pt
    %        Pt = beq                           > # of loads
    %        x = decision variable [Pgi] nx1 vector
    %        Aeq = coefficent
    %        lb = Pgi minimum (lower bound)     > Inequality constraints
    %        ub = Pgi maximum (upper bound)     > Inequality constraints
    
function S = Economic_Dispatch(S)
format long g

%[X,FVAL,EXITFLA,OUTPUT,LAAMBDA] = quadprog(N,f,A,b)
lb = S.gen.Pmin; % lower bound
ub = S.gen.Pmax; % upper bound 

% matrix must have quadratic coefficents times 2 such that the 0.5 is
% normalized
N = diag(2*S.gen.a);  % a = alpha
f = S.gen.b;


A=[];
b=[];

% Constraints
ng=length(S.gen.ng);
Aeq=ones(1,ng);
beq=sum(S.bus.loadMW); % whats LMN --> loadMW?


% Call the function to solve the problem quadratic
[x,fval,exitflag,output1,lambda] =quadprog(N,f,A,b,Aeq,beq,lb,ub);

S.gen.Popt=x;
S.gen.fval=fval;
S.gen.flag=exitflag;
S.gen.lambda=lambda;
S.gen.output1=output1;

S.gen.Popt
S.gen.lambda

end
