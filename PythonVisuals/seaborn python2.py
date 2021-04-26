# The following code to create a dataframe and remove duplicated rows is always executed and acts as a preamble for your script: 

# dataset = pandas.DataFrame(trip_distance, duration)
# dataset = dataset.drop_duplicates()

# Paste or type your script code here:
import matplotlib.pyplot as plt
import numpy as np
import seaborn as sns
import pandas as pd
#sns.set_theme(style="ticks")

df = dataset

x= df.iloc[:,0:1].to_numpy()
x= x.reshape(len(x),)
y= df.iloc[:,1:2].to_numpy()
y= y.reshape(len(y),)

sns.jointplot(x=x, y=y, color="#F9C74F",  kind="reg")


plt.savefig('plot.png', 
           transparent=True)