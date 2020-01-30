addpath('C:\Python\JapanExp\tools');
prompts = {'accomplish','animal','attributes','friends','job'...
    'family','fears','foods','forward','time','games'...
    'holiday','laugh','movies','music','peeves','plans', 'proud'...
    'season','social', 'sports','dream','subject','vacation','wearing'};
instances=length(prompts);

for i=1:instances
    
    fn0=sprintf("sequence_u_%d.csv", i);
    
    fid=fopen(fn0,'w');
    startTime = 0;
    endTime = 5+(50*3);
    volume = 10;
    trigger = 1;
    
    udpLine(fid, startTime, 'A', startTime+0.5);
    batLine(fid,'ready.bat',startTime,1,0,0,0);
    
    y = prompts{i};
    disp(y);
    
    for j = 0:3
            start = 5+(50*j);
            if j == 0
                batLine(fid,y + ".bat",start,1,0,0,0);
            else
                batLine(fid,"chat.bat",start,1,0,0,0);
            end
            
            srtm_time = randi(30) + 13; % between 10-30s of chat period
            batLine(fid,'magic.bat',start+srtm_time,1,0,0,0);
            
            batLine(fid,'rest.bat',start+35,1,0,0,0);
    end

    batLine(fid, 'end.bat',205,1,0,0,0);
    udpLine(fid, 205, 'K', 205.5);
    fclose(fid);
end