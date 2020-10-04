clc;
clear all;
close all;
%impulse and unit step
t=[-5:.05:5]; 
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
%impulse
imp(t==0)=1;
imp(t<0)=0;
imp(t>0)=0;
stem(t,imp)
%step
z(t>0)=1;
stem(t,z);
%ramp
r(t<0)=0;
r(t>0)=t(t>0);
stem(t,r)
%triangular
tri(t<0)=t(t>0)/5;
tri(t==0)=1;
tri(t>0)=1-(t(t>0))/5;
stem(t,tri)
%ramp concatinated with exp
t1=0:.05:4;
rexp(t<0)=0;
rexp(t>0)=[.05:.05:1 exp(-t1(t1>0))];
stem(t,rexp)
X1=z;
X2=z;
[a b]=size(t);
u(1)=0;
g(1)=0;
h(1)=0;
p(1)=0;
v(1)=0;
j=[X1 zeros(a,b)];
k=[zeros(a,b) X2(b:-1:1)];
l=[X2(b:-1:1) zeros(a,b)];
m=[zeros(a,b) X1];
for c=1:b
for i=1:b
    h(i)=j(i).*k(b+i-c);
    p(i)=l(i+c-1).*m(b+i-1);
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
title('Convolution using formula')
subplot(2,1,2)
o=xcorr(X1,X2);
stem(conv(X1,X2))
title('Convolution using conv() function')
p1=g(1:b);
p2=[g(b+1:2*b-1) 0];
p3=p1+p2;
cn=1:b;
figure
subplot(2,1,1)
stem(cn,p3)
title('circular Convolution using formula')
subplot(2,1,2)
stem(cconv(X1,X2,b))
title('Convolution using cconv() function')

