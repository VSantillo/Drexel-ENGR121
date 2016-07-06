function m = my_mode(vec)

% --- Variable pt. 1 --- %
x = sort(vec);           % Gets vec in numerical order
mode = zeros(1,numel(x));% Creates a 0 vector for the next part

% --- Mode Values --- %
for i=1:length(vec)-1   % This portion iterates through the entire vector
    if x(i) == x(i+1)   % Each iteration, it's checking if the value of that number is equal to the next value
        mode(i) = x(i); % If it is, store it in the mode vector
    end                 
end

% --- Variable pt. 2 --- %
mode(mode == 0) = [];         % Removing all values of 0 from the mode vector
term = ones(1,numel(mode));   % Creates a 1 vector to find the terms

% --- Term Values --- % 
for i=1:length(mode)-1           % This portion iterates through the entire mode vector
    if mode(i) == mode(i+1)      % Each iteration it checks to see if the mode it's next two is equal
        term(i+1) = term(i) + 1; % If it is, add 1 to the current value of the term to the next term value
    elseif mode(i) ~= mode(i+1)  % If it isn't, that term becomes zero
        term(i+1) = 1;             
    end
end

% --- Variable pt. 3 --- % 
[~,maxterm] = max(term);  % Find the index of the max value of the term vector
maxterm = mode(maxterm);  % Replace the maxterm with the maxterm of the mode vector

% --- Finally, Mode --- %
if maxterm == 0    % If there isn't a maxterm, the mode doesn't exist
    m = min(vec);  % Per the question, we will return the minimum value of the vector
else               % Else,
    m = maxterm    % Maxterm = maxterm
end


end