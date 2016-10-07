function [nearestNode, minDistance] = NearestNeighbourg(current, previousVector, nodesLocation, nodesFriction, trackWidth)

    minDistance = inf;
    section = ceil(current/trackWidth);
    position = current-(section - 1)*trackWidth;
    nearestNode = section*trackWidth + position;
    
    for iPosition = 1:trackWidth
        node = section*trackWidth + iPosition;
        vector = nodesLocation(:,node)-nodesLocation(:,current);
        cosBeta = norm(previousVector'*vector)/(norm(previousVector)*norm(vector));
        d = norm(nodesLocation(:,current)-nodesLocation(:,node))*(nodesFriction(node))/cosBeta;
        if (d < minDistance)
            minDistance = d;
            nearestNode = node;
        end
    end
    
end