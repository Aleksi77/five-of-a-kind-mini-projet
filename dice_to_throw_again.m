% Answer for the 2.4 question

function throw_again_these_dice = dice_to_throw_again(throw_outcome) % We return the indices of outcome to throw again (where the value is not equal to the most common outcome values)

input_row = size(throw_outcome,1); % We count the number of rows inside the input vector
input_column = size(throw_outcome,2); % We count the number of columns inside the input vector
if (input_row == 1 && input_column == 5) % We test if we have a 1x5 matrix in input (To simulate one outcome from one throw, the user has to put a input in the form [x x x x x])
    input_length = length(throw_outcome);
    frequency_of_a_face = [0 0 0 0 0 0]; % We create a full zeros matrix in order to initialize it. This matrix will contain the number of time each face occurs
    for i = 1:6 % We put and update the value by +1 everytime a face occurs at the correct place in the output vector (Counter i represents a face)
        for j = 1:input_length % We run through the input vector "throw_outcome" and we count how many time a face occurs
            if throw_outcome(j) == i % If the face occured is equal to one of the face represented by the counter
                frequency_of_a_face(i) = frequency_of_a_face(i) + 1; % We increment the value by 1 (It means that the face occured)
            end
        end
    end
    find_parameter = (frequency_of_a_face == max(frequency_of_a_face)); % We create the parameter for the find function
    most_common_outcome_indice = find(find_parameter,1); % In the matrix frequency_of_a_face, we find the most common outcome indice with the function "find". "max" locates the most common outcome. If there are two pairs in the result, we just return one of them. So, we add the parameter "1" to do that
    throw_again_these_dice = find(most_common_outcome_indice ~= throw_outcome); % We find the dice to throw again with the knowledge of the most common outcome
else
    error('Please, try again. Reload the function and put as the input a 1x5 matrix with values from 1 to 6')
    return
end

end

% Here, we use alternative 1 