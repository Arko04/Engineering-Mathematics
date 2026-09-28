%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%% Problem 1 %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function Heat_Solution

    %Parameters
    L = 2; % Length of the rod
    c = 1/sqrt(50); % Coefficient related to the equation
    m = 0;

    %% PDE function
    function [c, f, s] = Equation(x, t, u, dudx)
        c = 1;
        f = dudx;
        s = 0;
    end

    %% Initial condition
    function u0 = Init(x)
        u0 = 2 * exp(x); 
    end

    %% Boundary conditions
    function [pl, ql, pr, qr] = BC(xl, ul, xr, ur, t)
        pl = ul; 
        ql = 0;
        pr = ur - 35; 
        qr = 0;
    end

    %% Spatial and temporal discretization
    x = linspace(0, 1, 200);
    t = linspace(0, 10, 201);

    %% Solve the PDE
    sol = pdepe(m, @Equation, @Init, @BC, x, t);

    %% Plot the results for x,t
    
    % For t = 0, 5, 10
    figure(1);
    hold on;
    plot(sol(1,:), 'DisplayName', 't = 0', 'LineWidth', 1.5);
    plot(sol(101,:), 'DisplayName', 't = 5', 'LineWidth', 1.5);
    plot(sol(201,:), 'DisplayName', 't = 10', 'LineWidth', 1.5);
    title('PDE Heat Plot in t = 0, 5, 10');
    grid on;
    legend show;
    hold off;
    
    %%%% As you can see in figure(1), the temperature gradually spreads along
    %the length of the rod, and finally, it decreases linearly from the end
    %of the rod, which has a temperature of 200, to the beginning of the rod,
    %which has a temperature of zero, and this means that the rod has reached
    %equilibrium, but at t = 5, it is still The curve is slightly bent, which
    %means that it is not yet balanced. %%%%
    
    % For all t & x
    figure(2);
    imagesc(sol)
    colormap hot
    colorbar
    xlabel('Position x (meters)');
    ylabel('Time t (seconds)');
    title('Heatmap PDE');
    
    %%%% As you can see in figure(2), the heat is concentrated at the 200
    %point at first, but with the passage of time, it spreads in the rod and
    %the rest of the rod experiences an increase in heat, for example, at the
    %end, the temperature in the middle of the rod becomes something like 15,
    %which is correct.
    
    % For 3d
    figure(3);
    surf(x, t, sol);
    title('Temperature distribution over time and space');
    xlabel('Position x (meters)');
    ylabel('Time t (seconds)');
    zlabel('Temperature u (degrees Celsius)');
    
    %% Plot the results for x_new,t_new
    
    % Spatial and temporal discretization
    x_new = linspace(0, 1, 100);
    t_new = linspace(0, 10, 101);

    % Solve the PDE
    sol2 = pdepe(m, @Equation, @Init, @BC, x_new, t_new);
    
    % Plot For t = 0, 5, 10
    figure(4);
    hold on;
    plot(sol2(1,:), 'DisplayName', 't-new = 0', 'LineWidth', 1.5);
    plot(sol2(51,:), 'DisplayName', 't-new = 5', 'LineWidth', 1.5);
    plot(sol2(101,:), 'DisplayName', 't-new = 10', 'LineWidth', 1.5);
    title('NEW PDE Heat Plot in t-new = 0, 5, 10');
    grid on;
    legend show;
    hold off;
    
    % Plot For all t & x
    figure(5);
    imagesc(sol2)
    colormap hot
    colorbar
    xlabel('Position x-new (meters)');
    ylabel('Time t-new (seconds)');
    title('NEW Heatmap PDE');
    
    % For 3d
    figure(6);
    surf(x_new, t_new, sol2);
    title('Temperature distribution over time and space');
    xlabel('Position x-new (meters)');
    ylabel('Time t-new (seconds)');
    zlabel('NEW Temperature u (degrees Celsius)');
end
