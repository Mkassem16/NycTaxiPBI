# The following code to create a dataframe and remove duplicated rows is always executed and acts as a preamble for your script: 

# dataset = pandas.DataFrame(Month Name, total_amount, Month)
# dataset = dataset.drop_duplicates()

# Paste or type your script code here:
import seaborn as sns
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

df = dataset
category = df.columns[0]
numeric = df.columns[1]
order = df.columns[2]

df = df.sort_values(order)

sns.set_theme(style="white", rc={"axes.facecolor": (0, 0, 0, 0)})


pal = sns.cubehelix_palette(10, rot=-.25, light=.7)
g = sns.FacetGrid(df, row=category, hue=category, aspect=15, height=.5, palette=pal)
g.map(sns.kdeplot, numeric,
      bw_adjust=.5, clip_on=False,
      fill=True, alpha=1, linewidth=1.5)
g.map(sns.kdeplot, numeric, clip_on=False, color="w", lw=2, bw_adjust=.5)
g.map(plt.axhline, y=0, lw=2, clip_on=False)

def label(x, color, label):
    ax = plt.gca()
    ax.text(0, .2, label, fontweight="bold", color=color,
            ha="left", va="center", transform=ax.transAxes)


g.map(label, numeric)
g.fig.subplots_adjust(hspace=-.25)
g.set_titles("")
g.set(yticks=[])
g.despine(bottom=True, left=True)


plt.savefig('plot.png', 
           transparent=True)

