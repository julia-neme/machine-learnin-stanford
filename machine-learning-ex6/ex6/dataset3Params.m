function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and
%   sigma. You should complete this function to return the optimal C and
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found usx2ing the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example,
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using
%        mean(double(predictions ~= yval))
%
C_pos = [0.01 0.03 0.1 0.3 1 3 10 30];
S_pos = [0.01 0.03 0.1 0.3 1 3 10 30];

svmtrain_constants = zeros(length(C_pos)^2, 3);
n = 1;
for c = C_pos
  for s = S_pos
    model = svmTrain(X, y, c, @(x1, x2) gaussianKernel(x1, x2, s), 1e-3, 20);
    predict = svmPredict(model, Xval);
    error = mean(double(predict ~= yval))
    svmtrain_constants(n, :) = [c, s, error];
    n = n+1;
  end
end

sort_error = sortrows(svmtrain_constants, 3);
C = sort_error(1, 1);
sigma = sort_error(1, 2);







% =========================================================================

end
