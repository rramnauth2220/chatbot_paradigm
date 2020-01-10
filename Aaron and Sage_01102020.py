from setup import *
import subprocess
#Adam.hand.no2.avi
from psychopy import visual, gui
import sys
from tools.easygui import *
from tools.experiment import *
from tools.experiment_dual_monitor import *

from tools.Checkerboard import *
isMusic=0
msg ="Experiments"
title = "Experiment List"
choices0 = ["00: RealEye","01: Distractor1", "02: Distractor2", "03: Touch", "04: Chat", "05: Amy"]
nC=len(choices0) 
x=runrecord("eyewall",nC,360)
choices=[]
isTest=0 
subject='hh';
for i in range(nC):
    if x.check(i)==0:
        choices.append("%s" % choices0[i])
    else:
        choices.append("%s done" % choices0[i])
while 1:
    choice = choicebox(msg, title, choices)
    i=choices.index(choice)
    x.onedone(i+1)
    print i
    if i==0:
        MaterialFolder='eyewallList'
        paradigmdescript="RealEye2_T6_UDP.txt"
        keyboardrecord="RealEye.txt"
        e=experiment_dual_monitor(instrument,Nirs,eeglist,isTest,MaterialFolder,paradigmdescript,keyboardrecord,longTrigList=[2,4])
        e.winlist=[1,2];
        e.keysimulator="3";
        e.run()
        e=1
    if i==1:
        MaterialFolder='eyewallList'
        paradigmdescript="RealEye2_Distractor1_UDP.txt"
        keyboardrecord="Distractor1.txt"
        e=experiment_dual_monitor(instrument,Nirs,eeglist,isTest,MaterialFolder,paradigmdescript,keyboardrecord,longTrigList=[2,4])
        e.keysimulator="3";
        e.run()
    if i==2:
        MaterialFolder='eyewallList'
        paradigmdescript="RealEye2_Distractor2_UDP.txt"
        keyboardrecord="Distractor2.txt"
        e=experiment_dual_monitor(instrument,Nirs,eeglist,isTest,MaterialFolder,paradigmdescript,keyboardrecord,longTrigList=[2,4])
        e.keysimulator="3";
        e.run()
    if i==3:
        MaterialFolder='students'
        paradigmdescript="SageParadigmFinal.csv"
        keyboardrecord="Touch.txt"
        e=experiment_dual_monitor(instrument,Nirs,eeglist,isTest,MaterialFolder,paradigmdescript,keyboardrecord,longTrigList=[2,4])
        e.winlist=[1,2];
        e.keysimulator="3";
        e.run()
    if i== 4:
        MaterialFolder='students'
        paradigmdescript="Michelle_%s.csv" %(subject)
        keyboardrecord="Chat.txt"
        subprocess.call('vlcscreenrecord.bat Michelle_%s 215' % (datetime.datetime.now().strftime("%Y-%m-%d%H_%M_%S")))
        e=experiment_dual_monitor(instrument,Nirs,eeglist,2,MaterialFolder,paradigmdescript,keyboardrecord,longTrigList=[2,4])
        e.winlist=[1,2];
        e.keysimulator="3";
        e.run()
    if i==5:
        MaterialFolder='students'
        paradigmdescript="amyexp.csv"
        keyboardrecord="RealEye.txt"
        e=experiment_dual_monitor(instrument,Nirs,eeglist,isTest,MaterialFolder,paradigmdescript,keyboardrecord,longTrigList=[2,4])
        e.keysimulator="3";
        e.run()
        e=1



    choices[i]=choices[i]+' done'
    sys.exit(0)           # user chose Cancel
