function X = normalizeFeatures(X)
    X = X-mean(X);
    X = X./std(X);
end