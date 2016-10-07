function [nextNode, work] = GetNode(current, previousVector, nodesLocation, nodesFriction, trackWidth, pheromoneLevel, alpha, beta)

hasChose = false;
section = ceil(current/trackWidth);
for i = 1:trackWidth
    d(i) = norm(nodesLocation(:,(section)*trackWidth+i) - nodesLocation(:,current));
    cosBeta(i) = abs(previousVector'*(nodesLocation(:,(section)*trackWidth+i) - nodesLocation(:,current))/(d(i)*norm(previousVector)));

end
visibility = cosBeta ./ (d.*nodesFriction((section)*trackWidth+1:(section)*trackWidth+trackWidth));
pheromonVisibilityProduct = pheromoneLevel((section)*trackWidth+1:(section)*trackWidth+trackWidth).^alpha .* visibility.^beta;

nodeProbability = pheromonVisibilityProduct./sum(pheromonVisibilityProduct);
[nodeProbability, permutations] = sort(nodeProbability,'descend');

r = rand();

if (r < nodeProbability(1))
    nextPosition = permutations(1);
else
    candidate = 2;
    while(hasChose == false)
        nodeProbability(candidate) = nodeProbability(candidate) + nodeProbability(candidate-1);
        if ((r < nodeProbability(candidate))||candidate == trackWidth)
            hasChose = true;
            nextPosition = permutations(candidate);
        end
        candidate = candidate + 1;
    end
end
work = 1/visibility(nextPosition);
nextNode = section*trackWidth + nextPosition;
end