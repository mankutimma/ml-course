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

theta_reg = theta;
theta_reg(1,:) = [];
J = ((sum(y .* log(sigmoid(X*theta)) + (1 - y) .* log(1 - sigmoid(X*theta))))/(-m)) + (lambda*sum(theta_reg .^2 ))/(2*m);

%grad = (X'*(sigmoid(X*theta) - y))/m - (lambda*theta)/m;

htheta = sigmoid(X * theta);
grad(1) = 1 / m * sum((htheta - y) .* X(:, 1));
for i = 2:size(theta, 1)
    grad(i) = 1 / m * sum((htheta - y) .* X(:, i)) + lambda / m * theta(i);
end
% =============================================================

end