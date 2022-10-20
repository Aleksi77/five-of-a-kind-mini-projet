% Answer for the 2.2 question

function frequency_of_a_face = count_number_outcome(throw_outcome)

input_row = size(throw_outcome,1); % We count the number of rows inside the input vector
input_column = size(throw_outcome,2); % We count the number of columns inside the input vector
if (input_row == 1 && input_column == 5) % We test if we have a 1x5 matrix in input (The user has to put a input in the form [x x x x x])
    input_length = length(throw_outcome); % We take the length of the input vector in order to run through it 
    frequency_of_a_face = [0 0 0 0 0 0]; % We create a full zeros matrix in order to initialize it. This matrix will contain the frequencies of the faces
    for i = 1:input_length % We run through the input vector "throw_outcome" and we count how many time a face occurs
        frequency_of_a_face(throw_outcome(i)) = frequency_of_a_face(throw_outcome(i)) + 1; % We put and update the value by +1 everytime a face occurs at the correct index in the output vector
    end
else
    error('Please, try again. Reload the function and put as a input a 1x5 matrix with values from 1 to 6');
    return
end
    
end