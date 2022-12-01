function S = readcf(S)

clc 
clear all 
close all 
format long g

file=uigetfile('9bus.cf');
S.file=file;

fid= fopen(file, 'r');

str=fgetl(fid);

while strcmp(str, '')
   str=fgetl(fid);
end

S.title=str;

str=fgetl(fid);

while strcmp(str(1:3),'BUS') == 0
    str=fgetl(fid);
end

nn=1;
S.bus.name='';

str=fgetl(fid);

while strcmp(str(1:2),'-9') == 0

    k2=1;
    [k1 k2]=find_str(str, k2);
    S.bus.number(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.name=strvcat(S.bus.name,str(k1:k2-1));
    
    [k1 k2]=find_str(str, k2);
    S.bus.area(nn,1)=str2num(str(k1:k2));

    [k1 k2]=find_str(str, k2);
    S.bus.zone(nn,1)=str2num(str(k1:k2));

    [k1 k2]=find_str(str, k2);
    S.bus.type(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.voltage(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.angle(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.loadMW(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.loadMVAR(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.genMW(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.genMVAR(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.baseKV(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.desiredVolts(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.maxMVAR(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.minMVAR(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.shuntG(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.bus.shuntB(nn,1)=str2num(str(k1:k2));
    
    str=fgetl(fid);
    nn=nn+1;
    S.bus.n=length(S.bus.voltage);
end

while strcmp(str(1:3),'BRA') == 0    
    str=fgetl(fid);
end

nn=1;
str=fgetl(fid); 
while strcmp(str(1:2), '-9') == 0 
    
    k2=1;
    [k1 k2]=find_str(str, k2);
    S.branch.from(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.to(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.area(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.zone(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.circuit(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.type(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.R(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.X(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.B(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.branch.lineMVA1(nn,1)=str2num(str(k1:k2));
    
    str= fgetl(fid);
    nn=nn+1;
    S.branch.n=length(S.branch.from);
end


while strcmp(str(1:3),'GEN') == 0    
    str=fgetl(fid);
end
    
str=fgetl(fid);
str=fgetl(fid);

nn=1;
while strcmp(str(1:2), '-9') == 0 
    k2=1;
    
    [k1 k2]=find_str(str, k2);
    S.gen.number(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.gen.Pmax(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.gen.Pmin(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.gen.Qmax(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.gen.Qmin(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.gen.a(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.gen.b(nn,1)=str2num(str(k1:k2));
    
    [k1 k2]=find_str(str, k2);
    S.gen.c(nn,1)=str2num(str(k1:k2));
    
    
    str=fgetl(fid);
    nn=nn+1;
    S.gen.ng = length(S.gen.number);
    
end

while strcmp(str(1:3),'INT') == 0    
    str=fgetl(fid);
end

str=fgetl(fid); 
while strcmp(str(1:2), '-9') == 0 
    
end