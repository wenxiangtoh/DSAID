# imported modules
import pandas as pd
import numpy as np

df = pd.read_csv('dataset.csv')

# Dropping row if name column is Nan
df.dropna(subset=['name'], inplace=True)

# full_name data frame with split value columns
full_name = df["name"].str.split(" ", n=1, expand=True)
# Adding first_name column at position 0 using full_name data frame
df.insert(0, "first_name", full_name[0])
# Adding last_name column at position 1 using last_name data frame
df.insert(1, "last_name", full_name[1])
# Dropping name column
df.drop(columns=["name"], inplace=True)

# Variable to temporary store price df values
nonZeroinFooter = []

for idx, val in enumerate(df['price']):
    # Remove any zeros prepended to the price dataframe
    nonZeroinFooter.append(str(val).lstrip('0'))
df['price'] = nonZeroinFooter

