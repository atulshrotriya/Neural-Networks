function neuralnet5
p=[5 4 6 5 2 1 2 1;0 -1 0 -1 -1 -2 -2 -3];
D=[5 4 6 5 2 1 2 1;0 -1 0 -1 -1 -2 -2 -3]';
target=[0 0 0 0 1 1 1 1]';
[m, n] = size(D);
D = [ones(m, 1) D];
Vin = zeros(n + 1, 1);
[cost, gradient] = costFn(Vin, D, target);

%Initial cost and gradient
fprintf('Initial Cost %f', cost);
fprintf('\n Initial Gradient \n');
fprintf(' %f \n', gradient);

%Using fminunc for gradient descent
options = optimset('GradObj', 'on', 'MaxIter', 15);
[V, cost] = fminunc(@(t)(costFn(t, D, target)), Vin, options);

% Final cost
fprintf('Cost at final weights %f\n', cost);
fprintf('Weights and threshold: \n');
fprintf(' %f \n', V); 
function plotDB(Vw, D, target)
    function plotD(x,y)
        figure;
    end
plotD(D(:,1:2), target);
hold on
plot(p(1,5:8),p(2,5:8),'g+','LineWidth', 2,'MarkerSize', 5)
plot(p(1,1:4),p(2,1:4),'ro', 'Linewidth',2,'MarkerSize', 5)
if size(D, 2) <= 3
%evaluating and plotting the boundary line
    xa = [min(D(:,2))-2,  max(D(:,2))+2];
    ya = (-1./Vw(3)).*(Vw(2).*xa + Vw(1));
    plot(xa, ya)
else
    u = linspace(-10, 0.1, 200);
    v = linspace(-10, 0.1, 200);
    z = zeros(length(u), length(v));
    for i = 1:length(u)
        for j = 1:length(v)
            z(i,j) = mapFeature(u(i), v(j))*Vw;
        end
    end
    z = z';
    contour(u, v, z, [0, 0], 'LineWidth', 2)
end
hold off
end
plotDB(V, D, target);
end