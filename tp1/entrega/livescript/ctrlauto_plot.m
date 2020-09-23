function [] = ctrlauto_plot(ej)

tbl = readtable(strcat('ctrlauto_tp1_',ej,'.csv'));
tbl.time = seconds(tbl.time);
tbl = table2timetable(tbl);

if ej=='d'
    vars = {{'y','y_lineal'}, {'ydot', 'ydot_lineal'}, {'i', 'i_lineal'} };
    s = stackedplot(tbl, vars, 'GridVisible', 'on', 'Marker', '.');
    s.DisplayLabels = {'Posición', 'Velocidad', 'Corriente'};
    s.XLimits = seconds([0, 2]);
    s.AxesProperties(1).YLimits = [0, 1.5];
    s.AxesProperties(2).YLimits = [0, 30];
    for i=1:3
        s.AxesProperties(i).LegendLocation = 'northwest';
    end
    
elseif ej=='f'
    vars = {'u', 'y', 'ydot', 'i'};
    s = stackedplot(tbl, vars, 'GridVisible', 'on', 'Marker', '.');
    s.DisplayLabels = {'Entrada', 'Posición', 'Velocidad', 'Corriente'};
    
elseif ej=='g'
    vars = {'u', 'y', 'ydot', 'i'};
    s = stackedplot(tbl, vars, 'GridVisible', 'on', 'Marker', '.', 'Title', 'Restitución inicial');
    s.DisplayLabels = {'Entrada', 'Posición', 'Velocidad', 'Corriente'};
    s.XLimits = seconds([0, 1]);
    
    figure;
    s = stackedplot(tbl, vars, 'GridVisible', 'on', 'Marker', '.', 'Title', 'Respuesta al escalón');
    s.DisplayLabels = {'Entrada', 'Posición', 'Velocidad', 'Corriente'};

    s.XLimits = seconds([2.5, 6]);
    s.AxesProperties(1).YLimits = [-10, 3];
    s.AxesProperties(2).YLimits = [-0.03, 0];
    s.AxesProperties(3).YLimits = [-0.11, 0.026];
    s.AxesProperties(4).YLimits = [0.4, 0.6];
    
elseif ej=='h'
    vars = {'u', {'y','y_lineal'}, {'ydot', 'ydot_lineal'}, {'i', 'i_lineal'}, 'e'};
    s = stackedplot(tbl, vars, 'GridVisible', 'on', 'Marker', '.', 'Title', 'Respuesta al escalón');
    s.DisplayLabels = {'Entrada', 'Posición', 'Velocidad', 'Corriente', 'Error'};
    s.XLimits = seconds([0, 3]);
    
    for i=2:4
    s.AxesProperties(i).LegendLocation = 'southeast';
    end
end

