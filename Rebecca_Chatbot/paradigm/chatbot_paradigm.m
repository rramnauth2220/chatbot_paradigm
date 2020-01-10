addpath('C:\Python\JapanExp\tools');
fileType='hhiijjkkllmmoo';
instances=8;
prompts = {'Accomplish.wav','Animal.wav','Attributes.wav','Close Friends.wav','Dream Job.wav'...
    'Family.wav','Fears.wav','Foods.wav','Forward.wav','Free Time.wav','Games.wav'...
    'Holiday.wav','Laugh.wav','Movies.wav','Music.wav','Pet Peeves.wav','Plans.wav', 'Proud.wav'...
    'Season.wav','Social Media.wav', 'Sports.wav','Strange Dream.wav','Subject.wav','Vacation','Wearing'};

%fprintf("length of string %d", strlength(fileType));

%for i=1:strlength(fileType)-1
for i=1:instances
    %fn0=sprintf("sequence_%s%s.csv", fileType(i), fileType(i+1));
    fn0=sprintf("sequence_%d.csv", i);
    
    fid=fopen(fn0,'w');
    startTime = 0;
    volume = 10;
    trigger = 1;
    soundLine(fid, 'Be Ready To Chat.wav',startTime,5,volume,8);

    xList=[];
    for j = 0:3
            x = randi(25);
            while ismember(x,xList)==1
            x = randi(25);
            end
            xList=[xList x];
            y = prompts{x};

            start = 5+(50*j);
            soundLine(fid,y,start,3,volume,0);
            soundLine(fid,'beep.wav',start+3,0.5,volume+5,trigger);

            srtm_time = randi(30) + 13;
            soundLine(fid, 'SRTM.wav', start+srtm_time,1.5,volume+5, 0);
            
            soundLine(fid, 'beep.wav',start+33.5,.5,volume+5,0);
            soundLine(fid,'Rest.wav',start+34,.5,volume,0);
    end

    soundLine(fid, 'End.wav',208.5,5,volume,4);
    fclose(fid);
end