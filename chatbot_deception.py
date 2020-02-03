# Rebecca Ramnauth
# last update: 01 10 2020
# chatbot deception study s'2020

from setup import *
import subprocess, random

from psychopy import visual, gui
import sys
from tools2.easygui import *
from tools2.experiment import *
from tools2.experiment_dual_monitor import *

#from tools.Checkerboard import *

isMusic=0
msg ="Experiments"
title = "Experiment List"
choices0 = ["00: Rebecca's Chatbot Paradigm"]
nC=len(choices0) 
x=runrecord("rebecca",nC,360)
choices=[]
isTest=0 
sequence=25

# generate menu GUI
for i in range(nC):
    if x.check(i)==0:
        choices.append(" %s" % choices0[i])
    else:
        choices.append("%s done" % choices0[i])
        
while 1:
    choice = choicebox(msg, title, choices)
    i=choices.index(choice)
    x.onedone(i+1)
    print i
    if i == 0:
        MaterialFolder='Rebecca_Chatbot'
        paradigmdescript="sequence_u_%s.csv" %(sequence)
        keyboardrecord="Chat.txt"
        #subprocess.call('vlcscreenrecord.bat chatbot_%s 215' % (datetime.datetime.now().strftime("%Y%m%d_%H%M%S")))
        e=experiment_dual_monitor(instrument,Nirs,eeglist,2,MaterialFolder,paradigmdescript,keyboardrecord,longTrigList=[2,4])
        e.winlist=[1,2];
        e.keysimulator="3";
        e.run()
    
    # record completion 
    choices[i]=choices[i]+' done'
    sys.exit(0) # process completed or cancelled
