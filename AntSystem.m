%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Ant system (AS) for TSP.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all
clc;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Data
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nodesLocation = LoadNodesLocations();
trackWidth = 5;
numberOfSection = length(nodesLocation)/trackWidth;
nodesFriction =  ones(1,50);
i = [11 12 19 20 26 27 33 34 47 48 49 50];
nodesFriction(i) = 99;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
numberOfAnts = 50;  % To do: Set to appropriate value.
alpha = 1.0;        % To do: Set to appropriate value.
beta = 5.0;         % To do: Set to appropriate value.
rho = 0.5;          % To do: set to appropriate value.

nearestNeighbourPathLength = GetNearestNeighbourPathLength(nodesLocation, nodesFriction, trackWidth);
tau0 = numberOfAnts/nearestNeighbourPathLength;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Initialization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

range = [0 20 0 20];
tspFigure = InitializeTspPlot(nodesLocation, range);
connection = InitializeConnections(nodesLocation, nodesLocation, nodesFriction);
pheromoneLevel = InitializePheromoneLevels(length(nodesLocation), tau0); 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Main loop
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
minimumPathLength = inf;

iIteration = 0;
targetPathLength = 0;

while (minimumPathLength > targetPathLength)
 iIteration = iIteration + 1;

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Generate paths:
 %%%%%%%%%%%%%%%%%%%%%%%%%%

 pathCollection = [];
 pathLengthCollection = [];
 for k = 1:numberOfAnts
  [path, pathLength] = GeneratePath(pheromoneLevel, alpha, beta, trackWidth, nodesLocation, nodesFriction);
                 
  if (pathLength < minimumPathLength)
    minimumPathLength = pathLength;
    disp(sprintf('Iteration %d, ant %d: path length = %.5f',iIteration,k,minimumPathLength));
    PlotPath(connection,nodesLocation,path, trackWidth);
    bestPath = path;
  end
  pathCollection = [pathCollection; path];           
  pathLengthCollection = [pathLengthCollection; pathLength];
 end

 %%%%%%%%%%%%%%%%%%%%%%%%%%
 % Update pheromone levels
 %%%%%%%%%%%%%%%%%%%%%%%%%%

 deltaPheromoneLevel = ComputeDeltaPheromoneLevels(pathCollection,pathLengthCollection, trackWidth);  % To do: write the ComputeDeltaPheromoneLevels function
 pheromoneLevel = UpdatePheromoneLevels(pheromoneLevel,deltaPheromoneLevel,rho);          % To do: write the UpdatePheromoneLevels function

end






