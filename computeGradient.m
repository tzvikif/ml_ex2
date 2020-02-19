function grad = Gradient(theta,X,y)
    m = length(y);
    delta = (X*theta-y);
    grad = (1/m)*X'*delta;
end