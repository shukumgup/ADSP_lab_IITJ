t=[-4:0.01:4]; 
y(t==0)=1;
y(t>0)=0;
y(t<0)=0;
z(t>0)=1;
figure
subplot(4,1,1)
plot(t,y);
title('response')
xlabel('time')
ylabel('amplitude')
subplot(4,1,2)
plot(t,z);
x=t.*z;
subplot(4,1,3)
plot(t,x);
w=t.*y(t==0);
subplot(4,1,4)
plot(t,w);
q=sin(t).*y(t==0);
figure
plot(t,q)
r(t>0.1)=1;
m=z-r;
figure
plot(t,m)