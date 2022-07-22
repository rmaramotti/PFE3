clear variables
close all

T = readtable('PFE3_ResultsTable.csv');
ncond = 8;
varnames = ["EXR_NegV" "EXR_PosV" "EXR_NegL" "EXR_PosL" "REL_NegV" "REL_PosV" "REL_NegL" "REL_PosL"];
rownames = T.rt_temp_subj(1:8:end);
vartypes = ["double" "double" "double" "double" "double" "double" "double" "double"];
nsubjects = size(T,1)/8;
MeanRT = table('Size', [nsubjects, ncond], 'VariableNames', varnames, 'VariableTypes', vartypes, 'RowNames', rownames);

for i = 1 : nsubjects
    for j = 1 : 8
        MeanRT{i,j} = T.rt_temp_mean(j+8*(i-1));
    end
end

writetable(MeanRT, 'PFE3_MeanRT_table.txt', 'WriteRowNames', true, 'Delimiter', ';');