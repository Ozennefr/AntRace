function deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection, trackWidth)

    [numberOfAnts, nuberOfCities] = size(pathCollection);
    nuberOfCities = nuberOfCities*trackWidth;
    deltaPheromoneLevel = zeros(nuberOfCities);

    for iAnt = 1 : numberOfAnts
        for iStep = 1 : nuberOfCities/trackWidth - 1
            fromNode = pathCollection(iAnt, iStep);
            toNode = pathCollection(iAnt, iStep+1);
            deltaPheromoneLevel(toNode, fromNode) = deltaPheromoneLevel(toNode, fromNode) + 1/pathLengthCollection(iAnt);
        end
        fromNode = pathCollection(iAnt, 1);
        toNode = pathCollection(iAnt, end);
        deltaPheromoneLevel(toNode, fromNode) = deltaPheromoneLevel(toNode, fromNode) + 1/pathLengthCollection(iAnt);
    end
    
end