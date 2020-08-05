function plotData(X, y)
%PLOTDATA Plots the data points X and y into a new figure 
%   PLOTDATA(x,y) plots the data points with + for the positive examples
%   and o for the negative examples. X is assumed to be a Mx2 matrix.

% Create New Figure
figure; hold on;

% ====================== YOUR CODE HERE ======================

acc = find(y == 1); ref = find(y == 0);

plot(X(acc, 1), X(acc, 2), 'k+', 'LineWidth', 2, 'MarkerSize', 7);
plot(X(ref, 1), X(ref, 2), 'ko', 'MarkerFaceColor', 'y', 'MarkerSize', 7);

% =========================================================================

hold off;

end
