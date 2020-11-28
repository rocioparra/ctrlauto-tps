filename = 'ctrlauto_tp2_9.csv';

time = out.tout;
data = squeeze([out.ScopeData1{1}.Values.Data, out.ScopeData1{2}.Values.Data,...
    out.ScopeData1{3}.Values.Data, out.ScopeData1{4}.Values.Data]);

data = [time, data];


cHeader = {'time' 'u' 'perturbacion' 's_control' 'y'}; %dummy header
textHeader = strjoin(cHeader, ','); %cHeader in text with commas
%write header to file
fid = fopen(filename, 'w'); 
fprintf(fid,'%s\n',textHeader);
fclose(fid);

%write data to end of file
dlmwrite(filename, data,'-append','precision', 8);