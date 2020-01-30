addpath('C:\Python\JapanExp\tools');
fileType='hhiijjkkllmmoo';
prompts = {'Accomplish.wav','Animal.wav','Attributes.wav','Close Friends.wav','Dream Job.wav'...
    'Family.wav','Fears.wav','Foods.wav','Forward.wav','Free Time.wav','Games.wav'...
    'Holiday.wav','Laugh.wav','Movies.wav','Music.wav','Pet Peeves.wav','Plans.wav', 'Proud.wav'...
    'Season.wav','Social Media.wav', 'Sports.wav','Strange Dream.wav','Subject.wav','Vacation','Wearing'};
instances=length(prompts);
%for i=1:strlength(fileType)-1
for i=1:instances
    %fn0=sprintf("sequence_%s%s.csv", fileType(i), fileType(i+1));
    fn0=sprintf("sequence_u_%d.csv", i);
    
    fid=fopen(fn0,'w');
    startTime = 0;
    endTime = 5+(50*3);
    volume = 10;
    trigger = 1;
    
    udpLine(fid, startTime, 'A', startTime+0.5);
    soundLine(fid,'Be Ready To Chat.wav',startTime,5,volume,8);
    
    %xList=[];
    %x = randi(25);
    %while ismember(x,xList)== 1
    %    x = randi(25);
    %end
    %disp(strcat(num2str(x), " ", num2str(ismember(x, xList) == 1)));
    %xList = [xList, x];
    y = prompts{i};
    disp(y);
    %soundLine(fid,y,5,3,volume,0);
    
    for j = 0:3
            start = 5+(50*j);
            if j == 0
                soundLine(fid,y,start,3,volume,0);
                %soundLine(fid,'beep.wav',start+3,0.5,volume+5,trigger);
            else
                soundLine(fid,"Chat.wav",start,3,volume,0);
            end
            
            srtm_time = randi(30) + 13; % between 10-30s of chat period
            soundLine(fid,'magic.wav',start+srtm_time,0.5,volume+5,0);
            
            %soundLine(fid,'Rest.wav',start+34,.5,volume,0);
            soundLine(fid,'Rest.wav',start+35,.5,volume,0);
    end

    soundLine(fid, 'End.wav',205,5,volume,4);
    udpLine(fid, 205, 'K', 205.5);
    fclose(fid);
end