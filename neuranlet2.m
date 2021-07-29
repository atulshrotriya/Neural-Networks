function neuranlet2
p(:,1)=[5;0];p(:,2)=[4;-1];p(:,3)=[6;0];p(:,4)=[5;-1];
p(:,5)=[2;-1];p(:,6)=[1;-2];p(:,7)=[2;-2];p(:,8)=[1;-3];

t(:,1)=[0];t(:,2)=[0];t(:,3)=[0];t(:,4)=[0];
t(:,5)=[1];t(:,6)=[1];t(:,7)=[1];t(:,8)=[1];

weight=rand(3,1);
thresh=1;
error=ones(8,1);
e=0.5;
while norm(error)>1e-5
    for k=1:8
        P=[p(:,k);thresh];
        tnet=hardlim(weight'*P);
        error(k)=t(:,k)-tnet;
        if abs(error(k))>1e-6
            weight=weight-sign(weight'*P)*e*P;
        end
    end
end
it=1:0.1:8;
out=(-weight(1)*it-weight(3))/weight(2);
hold on
plot(p(1,1:4),p(2,1:4),'go',p(1,5:8),p(2,5:8),'b+')
plot(it,out,'r')
end