filename = 'ctrlauto_tp1_g.csv';

time = tout;
no_lineal = squeeze([estado{1}.Values.Data, estado{2}.Values.Data, estado{3}.Values.Data]);
u = squeeze(inout{2}.Values.Data);
data = [time, u, no_lineal];


cHeader = {'time' 'u' 'y' 'ydot' 'i'}; %dummy header
textHeader = strjoin(cHeader, ','); %cHeader in text with commas
%write header to file
fid = fopen(filename, 'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);

%write data to end of file
dlmwrite(filename, data,'-append','precision', 8);