clc;
clear all;
close all;
t=-2:2:4;
b=length(t);
%step
z(t>0)=1;
plot(z);
%impulse
imp(t==0)=1;
imp(t<0)=0;
imp(t>0)=0;
%triangular
tri(t<0)=t(t>0)/5;
tri(t==0)=1;
tri(t>0)=1-(t(t>0))/5;
%sinc
s1=sinc(t)';

unit=z';
impt=imp';
trit=tri';

% f=data(1:1764,1)
% plot(f)
N=b;
%  hu=dftmtx(b);
%  ha=hu*impt;

%DFT matrix
wn=exp(-2*pi/N);
for k=0:N-1
    for n=0:N-1 
    wkn(k+1,n+1)= exp(-2*pi*i*k*n/N);
    end
end

dft=wkn*unit;
plot(abs(dft))
figure
dft2=wkn*trit;
plot(abs(dft2))
figure
dft3=wkn*s1;
plot(abs(dft3))
figure
plot(periodogram(f))
%DFT
N=b;
x=z;
c(1)=0;
for k=1:b
    for n=1:N 
        sum=x(n)*exp(-2*pi*i*n*k/N);
        c(n+1)=c(n)+sum;
    end
    X(k)=c(end);
end
plot(abs(X))

%IDFT matrix
wn=exp(-2*pi/N);
for k=0:N-1
    for n=0:N-1 
    wkn1(k+1,n+1)= exp(2*pi*i*k*n/N);
    end
end
%IDFT
N=b;
x=z;
c(1)=0;
for k=1:b
    for n=1:N 
        sum=dft(n)*exp(2*pi*i*n*k/N);
        c(n+1)=c(n)+sum;
    end
    X(k)=c(end);
end
plot(abs(X))

idft=wkn*dft/N;
figure
plot(abs(idft))