function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
C1 = [0.01 0.03 0.1 0.3 1 3 10 30];
sigma1 = [0.01 0.03 0.1 0.3 1 3 10 30];
for i=1:8   %C
    for j=1:8   %sigma
        model = svmTrain(X, y, C1(i), @(X, y) gaussianKernel(X, y, sigma1(j)));
        predictions = svmPredict(model, Xval);
        temp = mean(double(predictions ~= yval));
        if i==1&&j==1
            temp1 = temp;
        end
        if temp <= temp1
            temp1 = temp;
            C = C1(i);
            sigma = sigma1(j);
        end
    end
end





% =========================================================================

end
