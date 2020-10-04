t=0:4
x=[0 1 1 0 1]
figure
subplot(2,2,1)
stem(t,x)
for i=1:5
    r(i)=-t(i);
    z(i)=x(i);
end
subplot(2,2,2)
stem(r,z)
for i=1:5
    o(i)=-t(i)-2;
    p(i)=x(i);
end
subplot(2,2,3)
stem(o,p)
