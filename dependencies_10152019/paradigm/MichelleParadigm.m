addpath('C:\Python\JapanExp\tools');
fileType='hhiijjkkllmmoo';
prompts = {'Accomplish.wav','Animal.wav','Attributes.wav','Close Friends.wav','Dream Job.wav'...
    'Family.wav','Fears.wav','Foods.wav','Forward.wav','Free Time.wav','Games.wav'...
    'Holiday.wav','Laugh.wav','Movies.wav','Music.wav','Pet Peeves.wav','Plans.wav', 'Proud.wav'...
    'Season.wav','Social Media.wav', 'Sports.wav','Strange Dream.wav','Subject.wav','Vacation','Wearing'};

for s=1:14
fn0=sprintf('Michelle_%s%s.csv',fileType(s),fileType(s+1));

    
fid=fopen(fn0,'w');
startTime = 0;
volume = 10;
trigger = 1;
soundLine(fid, 'Be Ready To Chat.wav',startTime,5,volume,8);


xList=[];
for i = 0:3
        x = randi(25);
        while ismember(x,xList)==1
        x = randi(25);
        end
        xList=[xList x];
        y = prompts{x};
        
        start = 5+(50*i);
        soundLine(fid,y,start,3,volume,0);
        soundLine(fid,'SinWaveTones_2.wav',start+3,0.5,volume+5,trigger);
        
        soundLine(fid, 'SinWaveTones_1.wav',start+33.5,.5,volume+5,0);
        soundLine(fid,'Rest.wav',start+34,.5,volume,0);
  
end

soundLine(fid, 'End.wav',208.5,5,volume,4);
fclose(fid);
end
