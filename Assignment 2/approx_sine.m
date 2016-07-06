function [approx, terms] = approx_sine(x, threshold)
 
% --- Variable Declaration --- %
real = sin(x); % Real Value of sin(x) to compare
terms = 0; % Inital Terms value
approx = x; % Initial Approx value

% --- Function Declaration --- % 
while abs((real-approx)/real) > threshold
    terms = terms + 1; 
    if rem(terms,2) == 1
        approx = approx - (x^(2*terms+1)/factorial(2*terms+1)); % Odd iteration has a subtraction
    elseif rem(terms,2) == 0
        approx = approx + (x^(2*terms+1)/factorial(2*terms+1)); % Even iteration has an addition
    end
end
