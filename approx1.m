function approx1
x=0:0.01:15;
fun=(x.^2)+2*cos(x);
approx=feedforwardnet(1);
approx.trainParam.epochs=500;
approx.layers{1}.transferFcn='logsig';
approx.trainParam.goal=0.01;
approx=train(approx,x,fun);
nefn=approx(x);
%plot(x,nefn,x,fun)
approximate=@(t,x)[x(2);(-0.1 * x(1)^3) + sim(approx,x(1))];
    [time,fn]=ode45(approximate,[0 15],[0 2]);
plot(time,fn);
end