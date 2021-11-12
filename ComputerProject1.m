% COMPUTER PROJECT 1
% Maya Ramde, 9/16/21
clear; clc;

x = linspace(-2, 2, 1000); % initialize 50 points of x to be -2<x<2
y = linspace(-2, 2, 1000); % initialize 50 points of y to be -2<y<2

err = 1; % initialize error bound\

% initialize root values
root1 = -1;
root2 = 0.5 + (sqrt(3)/2)*1i;
root3 = 0.5 - (sqrt(3)/2)*1i;

% write f(z) and f'(z)
f = @(z) z^3 + 1;
fp = @(z) 3*z^2;
%[X,Y]=meshgrid(x,y);
matrix = zeros(1000);
for j = 1:1000
    for k = 1:1000
        z = x(k) + 1i*y(j); 
        
       % terminate loop when error is small or 25 loops have occurred
        for i=1:25
            z_old = z; %store current value of z before it is updated
            z = z - f(z)/fp(z);
            delta=0.25;
            if abs(z-z_old) > delta
                t = abs(fp(z_old) ./ f(z_old))*delta;
                z = z_old - t.*(f(z_old) ./ fp(z_old));
            end
           err = abs(z - z_old);
        
        end
        % locate which root z is closest to
        z1=0;z2=0;z3=0;
        loc = min([abs(z - root1), abs(z - root2), abs(z - root3)]);
        if loc == abs(z - root1)
            z1 = 1;
        elseif loc == abs(z - root2)
            z2 = 2;
        elseif loc == abs(z - root3)
            z3 = 3;
        end
        
        % set (j,k) in matrix to index value found above
        matrix(j,k) = (z1 + 2*z2 + 3*z3);
    end
end
imagesc(matrix);

