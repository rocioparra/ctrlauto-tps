function [] = ctrlauto_plot2(ej)

tbl = readtable(strcat('ctrlauto_tp2_', num2str(ej),'.csv'));
tbl.time = seconds(tbl.time);
tbl = table2timetable(tbl);

vars = {'u' 'perturbacion' 's_control' 'y'};
s = stackedplot(tbl, vars, 'GridVisible', 'on', 'Marker', '.');
s.DisplayLabels = {'Entrada' 'Perturbación' 'Señal de control' 'Salida'};

end

