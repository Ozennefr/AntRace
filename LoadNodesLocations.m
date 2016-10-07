function nodesLocation = LoadNodesLocations
n = 10; repeats = 5;
x = repmat(1:n,repeats,1);
n = 5; repeats = 10;
y = repmat(1:n,repeats,1)';
nodesLocation =  [x(:)'; y(:)']