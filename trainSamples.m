function w = trainSamples(X,y)
    [m, n] = size(X);
% Initialize fitting parameters
    itr = 500;
    initial_w = zeros(n, 1);
    alpha = 0.01;
    w = initial_w;
    ycost = zeros(1,itr);
    xcost = 1:itr;
    for i=1:itr
        grad = computeGradient(w,X,y);
        w = w - alpha*grad;
        cost = costFunction(w, X, y);
        ycost(1,i) = cost;
    end
    plot(xcost,ycost);
    
end