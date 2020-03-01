function showBar(confMat,Name)
    if nargin==2
        figure('Name',Name,'NumberTitle','off');
    end
    name = {'Class 1';'Class2 ';'Class 3'};
    x = (1:3);
    b = bar(x,confMat);
    set(gca,'xticklabel',name)
    xtips1 = b(1).XEndPoints;
    ytips1 = b(1).YEndPoints;
    labels1 = string(b(1).YData);
    text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
        'VerticalAlignment','bottom')
    xtips2 = b(2).XEndPoints;
    ytips2 = b(2).YEndPoints;
    labels2 = string(b(2).YData);
    text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
        'VerticalAlignment','bottom')
    legend(b(:),{"Success","Failure"})
end