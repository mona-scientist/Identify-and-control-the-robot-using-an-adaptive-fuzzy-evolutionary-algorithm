function [out]=APRBS(N,L1,L2,var)
u=idinput(N,'prbs',[1/50 1/30],[L1 L2]);
for i=2:length(u)
    if u(i)~=u(i-1)
       u(1:i-1)=var*randn(1)*u(1:i-1);
       j=i;
       break
    end
end
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=j:length(u)
    if u(i)~=u(i-1)
      u(j:i-1)=var*randn(1)*u(j:i-1);
      j=i;
    else
        continue
    end
end
u=(u-min(u))/(max(u)-min(u));
u=(L2-L1)*u+L1;
out=u;