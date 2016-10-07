function pheromoneLevel = InitializePheromoneLevels(numberOfNodes, tau0)

    pheromoneLevel = ones(numberOfNodes) .* tau0;

end

