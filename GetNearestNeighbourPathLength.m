function d = GetNearestNeighbourPathLength(nodesLocation, nodesFriction, trackWidth)

d = 0;
numberOfSection = length(nodesLocation)/trackWidth;

section = 1;
position = 1;
path = zeros(1,numberOfSection);
path(1) = (section-1)*trackWidth + position;
previousVector = [1;0];
for iSection = 2 : numberOfSection
    [path(iSection), travelWork] = NearestNeighbourg(path(iSection-1), previousVector, nodesLocation, nodesFriction, trackWidth);
    d = d + travelWork;
    previousVector = nodesLocation(:,path(iSection))-nodesLocation(:,path(iSection-1));
end
vector = nodesLocation(:,path(end))-nodesLocation(:,path(1));
cosBeta = norm(previousVector'*vector)/(norm(previousVector)*norm(vector));
disp(path)
d = d + (norm(nodesLocation(:,path(1))-nodesLocation(:,path(end)))*(nodesFriction(path(1)) + nodesFriction(path(end)))/2)/cosBeta;