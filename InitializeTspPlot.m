function tspFigure = InitializeTspPlot(cityLocation,range)

tspFigure = figure(1);
set(tspFigure,'DoubleBuffer','on');
axis([range(1),range(2),range(3),range(4)]);
axis square;
grid on;
city = [];
for i = 1:length(cityLocation)
   city(i) = rectangle('Position', [cityLocation(1,i)-0.25 cityLocation(2,i)-0.25 0.5 0.5],'Curvature', [1 1]);
end
