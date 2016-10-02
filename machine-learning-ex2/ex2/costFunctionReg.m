function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta


p = sigmoid(X * theta);

t = theta;
t(1,:) = [];
w = zeros(1,1);
o = [w;t];

b =[ [ 0 ]; theta([2:length(theta)])]

i = ((1/m)*(-y'*log(p)- (1-y)'*log(1-p))) +(lambda/(2*m))*(b.^2);

J = sum(i(:));

grad = (1/m) * X'*(p-y) +((lambda)/m)*(o);




% =============================================================

end
