filename = 'ctrlauto_tp1_d.csv';

time = out.tout;
lineal = squeeze([out.lineal{1}.Values.Data, out.lineal{2}.Values.Data, out.lineal{3}.Values.Data])';
no_lineal = squeeze([out.no_lineal{1}.Values.Data, out.no_lineal{2}.Values.Data, out.no_lineal{3}.Values.Data]);

lineal(:, 3) = lineal(:,3) + 0.5;

data = [time, lineal, no_lineal];


cHeader = {'time' 'y_lineal' 'ydot_lineal' 'i_lineal', 'y', 'ydot', 'i'}; %dummy header
textHeader = strjoin(cHeader, ','); %cHeader in text with commas
%write header to file
fid = fopen(filename, 'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);

%write data to end of file
dlmwrite(filename, data,'-append','precision', 8);