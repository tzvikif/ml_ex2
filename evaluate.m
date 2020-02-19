function [trainErr,testErr] = evaluate(trainX,trainY,testX,testY)
    w = trainSamples(trainX,trainY);
    trainErr = (predictSamples(w,trainX) - trainY)'*(predictSamples(w,trainX) - trainY);
    testErr = (predictSamples(w,testX) - testY)'*(predictSamples(w,testX) - testY);
end
