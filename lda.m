function [Y,V] = lda(class1,class2,class3,dim)
    [r,c] = size(class1);
    mu1 = mean(class1);
    mu2 = mean(class2);
    mu3 = mean(class3);
    mu = mean([class1;class2;class3]);
        
    S1 = (r-1)*cov(class1);
    S2 = (r-1)*cov(class2);
    S3 = (r-1)*cov(class3); 
    Sw = S1 + S2 + S3;
    
    Sb = r*((mu1-mu')*(mu1-mu)'+(mu2-mu)'*(mu2-mu)+(mu3-mu)'*(mu3-mu));
    
    [V,D] = eig(Sb,Sw); 
    
    Y1 = V(:,1:dim)'*class1';
    Y2 = V(:,1:dim)'*class2';
    Y3 = V(:,1:dim)'*class3';
    
    Y = [Y1,Y2,Y3];
end
 