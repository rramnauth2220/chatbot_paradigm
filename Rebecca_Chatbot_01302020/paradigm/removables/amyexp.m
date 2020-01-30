% this program using trigger 6 to control the remote eye tracking
addpath('C:\Python\JapanExp\tools');
volume=1;
instructiontime=5;
blockL=30;
trialL=6;
videoMap=containers.Map;
r=1;
movieName='QB.MP4';
movielength=8*60+27;
cond=1;
switch cond
    case 1
        fn0=sprintf('C:/Python/JapanExp/Students/paradigm/amyexp.csv');
    case 2
        fn0=sprintf('paradigm/VedioEye2_T6.txt');
    case 3
        fn0=sprintf('paradigm/VideoObj2_T6.txt');
end
fid=fopen(fn0,'w');
screen=0;
trigger=8;
start=0;
duration=0.5;vol=volume;
% soundLine(fid, 'SinWaveTones_1.wav',start,duration,vol,trigger);
textline(fid, start,'',trigger,start+duration,[ -1 -1 -1],screen,[ 0 0]);
 T6=6;
        textline(fid,start+2,'',T6,start+2.5,[ -1 -1 -1],screen,[ 0 0]);
switch cond
    case 2
%         for screen=0:1
            videoLine(fid,'eye-wall.avi',start,195,0,0,1)
            videoLine(fid,'eye-wall-adam.avi',start,195,0,1,1)
%         end
    case 3
%         for screen=0:1
            videoLine(fid,'fishtank_repeat_x264.avi',start,195,0,0,1)
            videoLine(fid,'plant2.avi',start,195,0,1,1)
%         end
end

% triggeroff(fid,start,3);
% textline(fid,0,['instrunction' ],1,instructiontime-5,[ -1 -1 -1],screen,[ 0 0]);
% textline(fid,instructiontime-5,'+',0,instructiontime-.5,[ -1 -1 -1],screen,[ 0 0]);
for b=1:6
    for i=1:3
        blockstart=(b-1)*blockL+(i-1)*trialL+instructiontime;
        total=b*3+i;
        if mod(total,2)==0
            trigger=1;
        else
            trigger=1;
        end
        % triggeroff(fid,blockstart-1,trigger);
        soundLine(fid, 'amy1.wav',blockstart,duration,vol,0);
        textline(fid,blockstart,'',1,blockstart+duration,[ -1 -1 -1],screen,[ 0 0]);
        soundLine(fid, 'amy2.wav',blockstart+3,duration,vol,trigger);
        % this is the new line add a trigger 6 1 sec after the main trigger 
        if trigger==3 & i==1
        T6=6;
      %  textline(fid,blockstart+2,'',T6,blockstart+2.5,[ -1 -1 -1],screen,[ 0 0]);
        end
        textline(fid,blockstart+3,'',trigger,blockstart+3+duration,[ -1 -1 -1],screen,[ 0 0]);
        % triggeroff(fid,blockstart+3,trigger);
        %videoLine(fid,movieName,blockstart,blockstart+movielength,screen,trigger);
        %fprintf(fid,'key,%f,%s,%d,%f\n',blockstart,movieName,trigger,blockstart+movielength);
    end
    textline(fid,blockstart+3+duration,'',trigger,blockstart+3+duration+3,[ -1 -1 -1],screen,[ 0 0]);
    textline(fid,blockstart+3+duration+3,'',trigger,blockstart+3+duration+6,[ -1 -1 -1],screen,[ 0 0]);
    textline(fid,blockstart+3+duration+6,'',trigger,blockstart+3+duration+9,[ -1 -1 -1],screen,[ 0 0]);
    textline(fid,blockstart+3+duration+9,'',trigger,blockstart+3+duration+12,[ -1 -1 -1],screen,[ 0 0]);
    textline(fid,blockstart+3+duration+12,'',trigger,blockstart+3+duration+15,[ -1 -1 -1],screen,[ 0 0]);
end
endtime=b*blockL+instructiontime+5;
screen=0;
 T6=6;
     textline(fid,endtime,'',T6,endtime+2,[ -1 -1 -1],screen,[ 0 0]);
fprintf(fid,'text,%d,thanks,4,%d,%d,0,0,0,0,0\n',endtime+3,endtime+5,screen);
fprintf(fid,'sound,%d,SinWaveTones_1.wav,0,%d,%d,1\n',endtime-3,endtime,volume);
fclose(fid);
