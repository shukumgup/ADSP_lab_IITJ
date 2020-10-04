clc;
clear all;
close all;
t=-5:.01:5;
b=length(t);
x=sin(2*pi*10*t);
ftsin=dftmtx(b)*x';
% m1=max(ftsin);
m1abs=abs(ftsin);
stem(abs(ftsin))
m=max(m1abs);
% count=0;
% for i=1:b/2+1
%     if m1abs(i)>1
%         count=count+1;
%     end
% end
for i=1:b/2+1
if m==m1abs(i)
    g=i;
end
end
omega=2*pi/b*g;
f=omega/(2*pi);
fs=2*f;
%for critical
f=10;
fs=2*10;
t1=-1:1/fs:1;
v1=length(t1);
mc=sin(2*pi*10*t1);
plot(t1,mc);
hold on
%over sample
fover=100;
t2=-1:1/fover:1;
v2=length(t2);
mo=sin(2*pi*10*t2);
plot(t2,mo,'*-');
hold on
%under sampling
funder=15;
t3=-1:1/funder:1;
v3=length(t3);
mu=sin(2*pi*10*t3);
plot(t3,mu,'--');
% %dft domain
%  df=dftmtx(v1)*mc';
%  plot(abs(df))
df2=dftmtx(v2)*mo';
 plot(t2,abs(df2))
 hold on
df3=dftmtx(v3)*mu';
plot(t3,abs(df3))

%using fft
plot(t1,abs(fft(mc)))
hold on
plot(t2,abs(fft(mo)))
hold on
plot(t3,abs(fft(mu)),'--')

%reconsrtuction
r2(1:9)=0;
for k=1:101
    r2(k*10)=mo(k);
    for l=1:9
    r2(k*10+l)=mo(k);
    end
end
plot(r2)
for k=1:101
    r3(k)=mo(k);
end
plot(r3)
r4(1:9)=0;
for k=1:101
    r4(k*10)=mo(k);
    for l=1:9
    r4(k*10+l)=sinc(k);
    end
end
plot(r4)
%under sampling reconstruction
r5(1:9)=0;
for k=1:31
    r5(k*10)=mu(k);
    for l=1:9
    r5(k*10+l)=sinc(k);
    end
end
plot(r5)
%zero padding
t=0:1/50:1-1/50;
fs1=20;
fs2=21;
mx=sin(2*pi*fs1*t);
my=sin(2*pi*fs2*t);
mz=mx+my;
% stem(t,mz)
figure
plot(abs(fft(mz)))
z=zeros(1,1000);
mt=[mz z];
% stem(mt)
figure
plot(abs(fft(mt)))
%%%Sampling in frequency domain
t=-5:.01:5;
tri(t<0)=t(t>0)/5;
tri(t==0)=1;
tri(t>0)=1-(t(t>0))/5;
stem(t,tri)
fftsin=fft(tri);
trig=fft(fftsin);
trigrep=[trig trig trig trig trig];
plot(abs(trigrep))

zop=zeros(1,10);
tri=triang(20);
tripad=[zop tri' zop];
stem(tripad)
fftsin=fft(tripad);
trig1=fft(fftsin);
trigrep1=[trig1 trig1 trig1 trig1 trig1];
figure
plot(abs(trigrep1))


tri=triang(20);
tripad=tri;
stem(tripad)
fftsin=fft(tripad);
bh=length(fftsin);
trig2=fft(fftsin(1:7:bh));
trigrep2=[trig2' trig2' trig2' trig2' trig2'];
plot(abs(trigrep2))