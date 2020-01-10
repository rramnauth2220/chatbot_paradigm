#e=experiment('none','none','COM7',1,'ActiveBoston3','bio2d.txt', 'key.txt')
#instrument='TechN'  #no Nirs hookedon Hitachi or TechEnd
instrument='GPIO'#new trigger box
#Nirs='COM5' # no Nirs hookedon
#Jedi='COM8' # no eeg recording
Nirs='none' # no Nirs hookedon
Nirs='COM4' # trigger box
eeglist=('none', 'none') # no eeg recording
isTest=0
#astem='COM10'
aduino='COM5'
#aduino='none'
astem='none'
import pygame.midi

def print_devices():
    for n in range(pygame.midi.get_count()):
        print (n,pygame.midi.get_device_info(n))

#if __name__ == '__main__':
#pygame.midi.init()
#print_devices()
MIDIID=1 # change thi number into edrum
#aduino='none'

