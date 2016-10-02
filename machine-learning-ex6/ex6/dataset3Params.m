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

C_test = [0.01; 0.03; 0.1;0.3; 1; 3; 10; 30;];

a_test = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30;];

error = zeros(64,1);

t = 1;

for i = 1:8,
	for j= 1:8,
		sigme = a_test(j);
		model = svmTrain(X, y, C_test(i), @(X, y) gaussianKernel(X, y, sigme),1e-3, 20);
		pred = svmPredict(model, Xval);
		error(t) = mean(double(pred ~= yval));
		t = t+1;
	end;
end;

[m, pos] = min (error);

m;
pos;

pos%9;

d2 = pos/8;
if (floor(d2) == 0)
	d2 =1;
endif

v = floor(d2);
C = C_test(v,1);

sigma = a_test(mod(pos,8));


% =========================================================================

end
