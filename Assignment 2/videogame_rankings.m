function [removed,Xmean,Xstd,Y,textfile] = videogame_rankings(X)
fid = fopen('output.txt','w+');
% Do not modify above this line.

%% --- Score Adjustment --- %

% --- Variables --- %
TotEl = numel(X(1,:)); % Total Number of Elements in the System
j = 1;        % Column #
removed = 0;  % Players Removed

% --- Function --- %
while j < TotEl-removed+1
    if X(2,j) == 1              % Bonus Application
        X(1,j) = X(1,j) + 5;
    end
    if X(3,j) == 2              % Removal Application
        X(:,j) = [];
        removed = removed + 1;
    elseif X(3,j) == 1          % Penalty Application
        X(1,j) = X(1,j) - 5;
        j = j + 1;
    else
        j = j + 1;
    end
end

%% --- Metrics for Tier Ranges --- %

% --- Variables --- %
MeanTot = 0;
StdTot = 0;
RelEl = numel(X(1,:));


% --- Xmean --- %
for i = 1:RelEl
    MeanTot = MeanTot + X(1,i);
end

Xmean = MeanTot / RelEl;

% --- Xstd --- %
for i = 1:RelEl
    StdTot = StdTot + ((X(1,i) - Xmean)^2);
end

Xstd = sqrt(StdTot/(RelEl-1));
%% --- Tier Assignment --- %

% --- Variables --- %
Y = zeros(2,RelEl);
T1 = Xmean + (4/3*Xstd);
T2 = Xmean + (1/3*Xstd);
T3 = Xmean - (1/3*Xstd);
T4 = Xmean - (4/3*Xstd);
T = zeros(1,5);

% --- Tier Values --- %
for i=1:RelEl
    Check = X(1,i);
    Y(1,i) = Check;
    if T1 <= Check;
        Tier = 1;
        T(1) = T(1) + 1;
    elseif T2 <= Check && Check < T1
        Tier = 2;
        T(2) = T(2) + 1;
    elseif T3 <= Check && Check < T2
        Tier = 3;
        T(3) = T(3) + 1;
    elseif T4 <= Check && Check < T3
        Tier = 4;
        T(4) = T(4) + 1;
    else
        Tier = 5;
        T(5) = T(5) + 1;
    end
    Y(2,i) = Tier;
end

% --- Final Printout --- %
fprintf(fid,'Out of the original %d players, %d remain.\nThe mean of the scores is %.3f, standard deviation is %.3f.\nThe number of players in each tier is as follows:\n',TotEl,TotEl-removed,Xmean,Xstd);
for i=1:numel(T)
    if T(i) == 1
        fprintf(fid,'Tier %d: 1 player\n',i);
    else
        fprintf(fid,'Tier %d: %d players\n',i,T(i));
    end
end
% Do not modify below this line.
fclose(fid);
textfile = fileread('output.txt')
end