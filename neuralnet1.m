function neuralnet1
p(:,1)=[5;0];p(:,2)=[4;-1];p(:,3)=[6;0];p(:,4)=[5;-1];
p(:,5)=[2;-1];p(:,6)=[1;-2];p(:,7)=[2;-2];p(:,8)=[1;-3];

t(:,1)=[0];t(:,2)=[0];t(:,3)=[0];t(:,4)=[0];
t(:,5)=[1];t(:,6)=[1];t(:,7)=[1];t(:,8)=[1];

net1=newp(minmax(p),1);
out=sim(net1,p)
weight=net1.IW{1,1}
bias=net1.b{1}

net1.trainParam.epochs=100;
net1=train(net1,p,t);

out=sim(net1,p)
weight=net1.IW{1,1}
bias=net1.b{1}

figure
plotpv(p,t)
plotpc(weight,bias)
end