function [] = plots(P, C)

L = P*C;
S = 1 / (1+L);
PS = P*S;
CS = C*S;
T = 1-S;

tfs = [L, S, T, PS, CS];
titles = ["Lazo abierto (L)", "Sensibilidad (S)", ...
    "Sensibilidad complementaria (T)", ...
    "Sensibilidad a la perturbación de entrada", ...
    "Sensibilidad al ruido de medición"];

for i=1:5
    options = bodeoptions;
    options.FreqUnits = 'Hz';
    figure;
    bode(tfs(i), options);
    title(titles(i));
    grid on;
end

end

