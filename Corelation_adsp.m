clc;
clear all;
close all;
%impulse and unit step
t=[-5:.125:5]; 
% sine 
x1=sin(2*pi*t/10);
stem(t,x1);
title('sine')
xlabel('Sample')
ylabel('amplitude')
%cosine 
x2=cos(2*pi*t/10);
stem(t,x2);
title('cosine')
xlabel('Sample')
ylabel('amplitude')
%unit 
z(t>0)=1;
stem(t,z);
title('Unit step')
xlabel('Sample')
ylabel('amplitude')
%exponential
e=(exp(t)).*z;
stem(t,e)
title('exponential')
xlabel('Sample')
ylabel('amplitude')
%ramp
r(t<0)=0;
r(t>0)=t(t>0);
stem(t,r)
title('ramp')
xlabel('Sample')
ylabel('amplitude')
%cross correlation
X1=z;
X2=z;
[a b]=size(t);
u(1)=0;
g(1)=0;
h(1)=0;
p(1)=0;
v(1)=0;
j=[X1 zeros(a,b)];
k=[zeros(a,b) X2];
l=[X2 zeros(a,b)];
m=[zeros(a,b) X1];
for c=1:b
for i=1:b
    h(i)=j(i).*k(b-c+i);
    p(i)=l(i).*m(b-c+i);
    u(i+1)=h(i)+u(i);
    v(i+1)=p(i)+v(i);
end
g1(c)=u(end);
g2(b-c+1)=v(end);
u=0;
v=0;
end
g=[g2(2:b) g1];
N=1:(2*b-1);
subplot(2,1,1)
stem(N,g)
title('Correlation using formula')
subplot(2,1,2)
o=xcorr(X1,X2);
stem(conv(X1,X2))
title('Correlation using Xcorr() function')
