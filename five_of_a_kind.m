% Answer for the 2.5 question

function number_throws_needed = five_of_a_kind() % This function returns five of a kind of the most common outcome and the number of throws needed. We re-roll dice that should be re-rolled and we count the number of rolls before all dice show the same face (Ex : All 1, all 2, all 3 and so on...). It is called Yatzy

random_throw_outcome = randi([1 6],[1 5]); % We throw 5 regular six-sided dice randomly (Faces from 1 to 6)
number_throws_needed = 1; % We initiate a counter to count all the rolls needed to obtain a five-of-a-kind. The counter is equal to 1 because we already have thrown once with the randi function above
[most_common_outcome_indice,most_common_outcome_frequency,frequency_of_a_face] = most_common_outcome(random_throw_outcome); % We call the function created before to find the most common outcome in order to find the dice to throw again and so to find a five of a kind
flag = 0; % We use a flag to exit and enter the while loop
while flag == 0
    if most_common_outcome_frequency ~= 5 % We test if the most common outcome occured 5 times. If it is the case, then we got a five of a kind and we exit the while loop. If it is not, we have to keep going
        for i = 1:5
            if random_throw_outcome(i) ~= most_common_outcome_indice % We throw only a selected dice (Which are not the most common)
                random_throw_outcome(i) = randi([1 6]); % We re-roll the selected dice randomly with randi function
            end
        end % We throw multiple selected dice again randomly 
        [most_common_outcome_indice,most_common_outcome_frequency,frequency_of_a_face] = most_common_outcome(random_throw_outcome); % We repeat the procedure. We call the function created before to find the most common outcome in order to find the dice to throw again and so to find a five of a kind
        number_throws_needed = number_throws_needed + 1; % At each throw, we increment the total number of throws needed because we have to throw one more time before having one five of a kind
    elseif most_common_outcome_frequency == 5
        flag = 1; % We quit the loop when we have found a five of a kind
    end
end
% fprintf('We have a five of a kind in %d throws.\n', number_throws_needed); % This line is for testing purpose

end