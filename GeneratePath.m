function [path, work] = GeneratePath(pheromoneLevel, alpha, beta, trackWidth, nodesLocation, nodesFriction)
    work = 0;
    nOfSection = length(pheromoneLevel)/trackWidth;
    path = zeros(1, nOfSection);
    startSection = 1;
    startPosition = 1;
    path(1) = (startSection-1)*trackWidth + startPosition;
    previousVector = [1;0];
    for iSection = 2 : nOfSection
        [path(iSection), dWork] = GetNode(path(iSection-1), previousVector, nodesLocation, nodesFriction, trackWidth, pheromoneLevel, alpha, beta);
        previousVector = nodesLocation(:,path(iSection))-nodesLocation(:,path(iSection-1));
        work = work + dWork;
    end       