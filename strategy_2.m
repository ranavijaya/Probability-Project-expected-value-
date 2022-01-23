function [final_expected_vals] = strategy_2()
% Function to calculate expected values of time for P_om from .1 to .5
    
    initial_E = [7.109830200957157  13.747037779905098 20.415662725586326
                 3.8321483594592816 7.090836763705904  10.435340300715005
                 2.7962512487710653 4.870194275499013  7.130718950732399
                 2.3497542908541056 3.736455736129949  5.5178668695576
                 2.1943350814194544 2.9716754070972726 4.664041954066908];
    
    final_expected_vals = [];
    
    % Using P_om from .1 to .5
    for iter_count = (1:5)
        
        % Using P_om from .1 to .5
        p_om = iter_count/10;
        
        % Starting with the E1, E2, and E3 calculated manually
        E = initial_E(iter_count,:);
        
        % Calculating E4 to E19 using general equation
        for d = 4:19
            E(d)=(1+(2.5*p_om-4.5*p_om*p_om)*E(d-2)+(4.5*p_om*p_om-3.5*p_om)*E(d-1)+(1.5*p_om*p_om*E(d-3)))/(p_om*(1.5*p_om-1));
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