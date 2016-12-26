#!/usr/bin/python2.7 

import numpy as np
from pandas import *
from pylab import *
import os
ind = arange(0,9,3)
div = 1000000.0

wid=0.35

filename = "eventDumps/event_%s.csv" % (sys.argv[1])

data = read_csv(filename)
count =0
host_wait=0
gpu_wait =0
gpu_exec = 0

for i in data.index:
	#if data.Type.ix[i] == 'Kernel':
	host_wait = host_wait + (data.Submitted.ix[i]-data.Queued.ix[i])
	gpu_wait = gpu_wait +  (data.Start.ix[i]-data.Submitted.ix[i])
	gpu_exec = gpu_exec + (data.End.ix[i]-data.Start.ix[i])
	count = count + 1
		
record_cmd = 'echo %s, %s, %s, %s >> mt_plot_data.csv' % (sys.argv[1], (host_wait/(div)), (gpu_wait/div), (gpu_exec/div))
os.system(record_cmd)








		
	
	
