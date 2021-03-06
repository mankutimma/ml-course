function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

h = X*theta; %X is 97x2 dimension , theta is 2x1 and h is 97x1, whereas y is also 97x1

err = h - y;

err_sq = err .^ 2;

total = sum(err_sq);

%J = total/(2*m)

J = (sum((X*theta -y).^2))/(2*m);

% J = 32.07

% =========================================================================

end
