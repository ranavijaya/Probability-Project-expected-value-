function [final_expected_vals] = strategy_1()
% Function to calculate expected values of time for P_om from .1 to .5
    
    final_expected_vals = [];
    
    % Using P_om from .1 to .5
    for p_om = (1:5)/10
        
        % Starting with the E1 and E2 calculated manually
        E = [1/(1-p_om), (2-3*p_om)/((1-p_om)*(1-p_om))];
        
        % Calculating E3 to E19 using general equation
        for d = 3:19
            E(d) = (p_om + (1-2*p_om)*(1+ E(d-1)) + p_om*(1+ E(d-2)))/(1-p_om);
        end
        
        % Now calculating the expected value using conditional expectation
        % Using pmf of d (uniform distribution with Pd = 0.1)
        expected_total = 0;
        for d = 10:19
            expected_total = expected_total + 0.1*E(d);
        end
        
        disp(expected_total);
        final_expected_vals(end + 1) = expected_total;
    end
end