function showBar(confMat)
    name = {'Class 1';'Class2 ';'Class 3'};
    x = (1:3);
    b = bar(x,confMat);
    set(gca,'xticklabel',name)
    xtips2 = b(2).XEndPoints;
    ytips2 = b(2).YEndPoints;
    labels2 = string(b(2).YData);
    %text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    %    'VerticalAlignment','bottom')
    xtips2 = b(2).XEndPoints;
    ytips2 = b(2).YEndPoints;
    labels2 = string(b(2).YData);
    text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
        'VerticalAlignment','bottom')
end