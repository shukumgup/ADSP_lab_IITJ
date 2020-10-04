clc;
close all;
clear all;
pow_l=1;
l=1000; %samples
count=0;
m=1;
var2=10; % variance is taken as 10 for 2nd noise
p=.5;%probability of bernoulli's rv(prob=p for 0 and prob=(1-p) for 1)
n1=randn(1,l);
n2=randn(1,l);
n3=randn(1,l);
n4=randn(1,l);

%%
for r=1:length(p)
samp=l*p(r);
len_samp=round(samp);
% n(1:len_samp)=(n1(1:len_samp));
n(1:len_samp)=sqrt(1/2)*(n1(1:len_samp)+1i*n2((1:len_samp)));
n(len_samp+1:l)=(sqrt(1/2)*((n1(len_samp+1:l)+1i*n2(len_samp+1:l))))+(sqrt(1/2)*(sqrt(var2)*(n3(len_samp+1:l)+1i*n4(len_samp+1:l))));
% generation of 1 & -1
pow_db=-4:2:20;
pow_l=10.^(pow_db/10);
for m=1:length(pow_l)

for k=1:l
    h=sqrt(1/2)*(randn(1,1)+1i*randn(1,1));
    x_in=rand>0.5;
    x=2*x_in-1;
    y(k)=sqrt(pow_l(m))*x*h+n(k);
    if (real(conj(h)*y(k)))>=0
        flag=1; 
    else
        flag=0;
    end
    err=x_in-flag;
    if err==0
        count=count+0;
    else
        count=count+1;
    end
end
error(r,m)=count/l;
count=0;
end
end
semilogy(pow_db,error,'--');
hold on;
%% analytical
for r=1:length(p)
N=(p(r))*qfunc(sqrt(pow_l)/1)+(1-p(r))*qfunc(sqrt(pow_l/(1+10)));
snr1=pow_l;
snr2=pow_l/(1+var2);
ber(r,:)=(p(r))*(0.5-0.5*sqrt(snr1./(1+snr1)))+(1-p(r))*(0.5-0.5*sqrt(snr2./(1+snr2)));
end
semilogy(pow_db,ber,'*');
xlabel('SNR(in dB)')
ylabel('Probability of error')
title('BER for additive impulsive noise')