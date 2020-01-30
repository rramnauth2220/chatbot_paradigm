addpath('C:\Python\JapanExp\tools');
promptdir = dir('../media/*.wav');
prompts = {promptdir.name};
%disp(hasDot);
%file = prompts{5};
%[filepath,name,ext] = fileparts(file);
%disp(filepath);

instances=length(prompts);

for i=1:instances
    fn0=sprintf("../media/%s.bat", extractBefore(prompts{i}, ".wav"));
    fid=fopen(fn0,'w');
    fprintf(fid, '@echo off. \n\nstart /min cmdmp3.exe "C:\\Python\\JapanExp\\Rebecca_Chatbot\\media\\%s" \nexit', prompts{i});
    fclose(fid);
end