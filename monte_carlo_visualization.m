% Answers for the 2.6 / 2.7 / 2.8 questions

% 2.6 question : Write a (new) function that throws dice until you have obtained five-of-a-kind many times.

function monte_carlo_visualization(n_experiments) % This is a function that throws dice until we have obtained five-of-a-kind many x times according to n_experiments input by user in the function. This is a monte carlo simulation

if n_experiments > 0
    number_throws_needed = zeros(1,n_experiments); % We initialize the vector to store the different throws needed to obtain a five-of-a-kind in each experiment
    for i = 1:n_experiments % Since the number of iterations is known, we have to loop from 1 repetition to n_experiments repetition
        number_throws_needed(i) = five_of_a_kind(); % We store the number of throws needed in each experiment in a vector and we repeat the experience n_experiments time
    end
    monte_carlo_histogram = histogram(number_throws_needed,'BinWidth',1,'FaceColor','r'); % We plot a histogram called h with 1 bin width to visualize the monte carlo simulation
    grid on
    title(sprintf('Monte Carlo Simulation : Estimated probability density function (Number of throws needed distribution to get a five of a kind for %d iterations)',n_experiments)); % We use sprintf to create the title of the histogram and to display the number of experience required for the simulation in a correct format 
    xlabel('Number of throws needed to have a five of a kind');
    ylabel('Number of five of a kind');
    xticks('auto'); % We adjust the scale for the x-axis in order to visualize better results

% 2.7 question : Modify the function to also return estimations of the expected value and variance for the number of throws.

    expected_value = (sum(number_throws_needed))/n_experiments; % Average calculation formula for the expected value (average value)
    variance_value = (1/(n_experiments - 1)) * (sum((number_throws_needed - expected_value).^2)); % Average calculation formula for the variance
    fprintf('The average value for the number of throws needed to achieve a five of a kind is estimated to : %d\n\nThe variance value for the experience is estimated to : %d\n\n',expected_value,variance_value); % We display the results for the user
    fprintf('We notice that the values found are close to the theoretical expected value and expected variance\n\n');
    fprintf('The variance is a measure that tells how large the (squared) deviations from the expected value are. If the variance is small that implies that the number of throws needed to get five-of-a-kind stays approximately the same from time to time, whereas a large variance indicates that the number of throws may vary substantially\n\n');

% 2.8 question : Extend your function to also plot the analytic probability function in the same figure as the histogram from the Monte-Carlo simulations

    hold on % We plot the function on the same figure as the histogram 

% To compute the probability function, we need the values of A matrix, e1 and e5 given in the project pdf document

    A = [0 1/6 1/36 1/216 1/1296; 0 5/6 10/36 15/216 25/1296; 0 0 25/36 80/216 250/1296; 0 0 0 120/216 900/1296; 0 0 0 0 120/1296]; % Creation of A matrix
    e1 = [1;0;0;0;0]; % Creation of e1
    e1_transposition = (e1)'; % Transposition of e1
    e5 = [0;0;0;0;1]; % Creation of e1
    for k = 1:max(number_throws_needed) % For every throws needed to have a five of a kind through every experiment
        p(k) = ((e1_transposition)*(A^k)*e5)*(n_experiments); % p(k) is the probability that k throws are needed to get five-of-a-kind. Since we are doing n_experiments, we have to multiply the probability by n_experiments
    end % We calculate the probability associated 
    density_function = plot(p,'g','LineWidth',3,'Marker','o'); % We plot the probability density function called p in green with linewidth = 5 in order to visualize the function
    grid on
    legend([monte_carlo_histogram density_function],'Monte Carlo Estimation','Probability density function','location','best') % We create a legend
else
    error('Please, try again. Reload the function with a correct n value of experiments. n should be a positive integer');
    return
end

end

% END OF THE PROJECT
