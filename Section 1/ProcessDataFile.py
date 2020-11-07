# imported modules
import pandas as pd


def processDatafile(file):
    # Read dataset.csv using pandas module
    df = pd.read_csv(file)

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
    # Variable to temporary store above_100 df values
    above_100 = []

    for idx, val in enumerate(df['price']):
        # Remove any zeros prepended to the price dataframe
        nonZeroinFooter.append(str(val).lstrip('0.'))
        if(val > 100):
            # Append true to temporary variable above_100
            above_100.append(str.lower("true"))
        else:
            # Append false to temporary variable above_100
            above_100.append(str.lower("false"))

    df['price'] = nonZeroinFooter
    df["above_100"] = above_100

    # Write updated df to procesedDataSet.csv
    df.to_csv('processedDataSet.csv', index=False)
