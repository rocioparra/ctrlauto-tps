filename = 'ctrlauto_tp1_h.csv';

time = tout;
u = squeeze(inout{2}.Values.Data);
l = squeeze([lineal{1}.Values.Data, lineal{2}.Values.Data, lineal{3}.Values.Data]);
nl = squeeze([no_lineal{1}.Values.Data, no_lineal{2}.Values.Data, no_lineal{3}.Values.Data]);

l(:, 3) = l(:,3) + 0.5;

data = [time, u, l, nl, err(:,2)];


cHeader = {'time' 'u' 'y_lineal' 'ydot_lineal' 'i_lineal', 'y', 'ydot', 'i', 'e'};
textHeader = strjoin(cHeader, ','); %cHeader in text with commas
%write header to file
fid = fopen(filename, 'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);

%write data to end of file
dlmwrite(filename, data,'-append','precision', 8);