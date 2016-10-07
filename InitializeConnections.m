function connection = InitializeConnections(cityLocation, nodesLocation, nodesFriction)
scatter(nodesLocation(1,:),nodesLocation(2,:),100,nodesFriction(:),'filled');
colormap parula
connection = [];
for i = 1:length(cityLocation)
   connection(i) = line([0 0], [0 0]);
end
