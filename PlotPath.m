function PlotPath(connection, cityLocation, path, trackWidth)
nCities = length(cityLocation);
for i = 1:nCities/trackWidth-1
   set(connection(i),'XData',[cityLocation(1,path(i)) cityLocation(1,path(i+1))]);
   set(connection(i),'YData',[cityLocation(2,path(i)) cityLocation(2,path(i+1))]);
end

drawnow;