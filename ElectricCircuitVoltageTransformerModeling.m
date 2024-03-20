
%************************************************************************************************************************************************
%                                                                                                                                               *
%               Simulations for the paper Mathematical Modeling of the Short Circuit Mode of a Voltage Transformer                              *
%                                                                                                                                               *
%       - The script implements a formula that calculates the current \(i_{t2}\) based on the given parameters and input voltage signal.        *
%       - It defines the time vector \(t\) and sets the angular frequency \(w\).                                                                *
%       - Amplitude of the input voltage signal \(ut\) is defined as a cosine function.                                                         *
%       - Constants \(l1\), \(l2\), \(r1\), \(r2\), and \(m\) are assigned specific values.                                                     *
%       - Impedance and resistance values are calculated for further computations.                                                              *
%       - Numerator and denominator terms are calculated to determine the current value \(it2\).                                                *
%       - There is a check to handle the case when \(Zn\) is zero, calculating \(it20\) accordingly.                                            *
%       - Finally, the script plots the graphs of \(it2\) and \(it20\).                                                                         *
%                                                                                                                                               *
%************************************************************************************************************************************************



%                       Implementation of the formula:            it2= (U1*m)/(Zn*Xm + x2*Zm + x1*(Xm + X2 + Xn))



% Defining time vector
t = linspace(0, 100, 1000);
% Setting angular frequency
w = 1;

% Defining amplitude of input voltage signal
A = 660;
ut = A * cos(w * t);

% Constants based on Table 1
l1 = 0.0223;
l2 = 0.0223;
r1 = 0.0125;
r2 = 0.0125;
m = 17.4;


%*****************************************************************************************************************

% Impedance and resistance values
zm = 1i * w * m;
rm = 128;
zl1 = 1i * w * l1;
zl2 = 1i * w * l2;
zn = 10;
x1 = zl1 + r1;
x2 = zl2 + r2;
xm = zm + rm;

% Calculating numerator and denominator terms
C = ut * xm;
D = xm * x2 + xm * zn + x1 * (zn + x2 + xm);
it2 = C / D;

% Check if Zn is zero
if zn == 0
    E = xm * x2 + x1 * (x2 + xm);
    it20 = C / E;
end


% Plotting the graphs
plot(t, it2, 'b');
hold on; % Retain current plot
plot(t, it20, 'r');