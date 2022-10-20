% Answer for the 2.1 question

function throws_results = several_throws(number_of_dice)

if number_of_dice > 0
    throws_results = randi([1,6],1,number_of_dice); % Generate randomly a 1-by-number_of_dice column vector of uniformly distributed random integers from the interval [1,6]
    histogram(throws_results,'FaceColor','red','Normalization','probability'); % We plot the histogram to visualize results of several throws
    grid on
    title('Visualization of the results of several throws with a given number of dice'); % This is the title for the histogram 
    xlabel('Face appeared'); % x-axis represents the different die faces from 1 to 6
    ylabel('Probability for a die to show the different faces'); % y-axis represents the probability for each die to show
else
    error('Please, enter a correct number of throws. This number should be a positive integer');
    return
end
disp('Since the probability for a die to show different faces (1, 2, 3, 4, 5, or 6) is identical with a fair die (uniform distribution), the histogram represents equal bars (Almost same value, same height). The value of the probability is equal to 1/6');

end

% Since the probability for a die to show 1, 2, 3, 4, 5, or 6 is identical (uniform distribution), the histogram represents equal bars (Almost same value, same height)
