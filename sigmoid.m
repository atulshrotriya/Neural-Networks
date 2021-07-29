function out = sigmoid(l)

out = zeros(size(l));

for j=1:size(l,1);
    for k=1:size(l,2);
        out(j,k)=1./(1+exp(-l(j,k)));
    end
end
end