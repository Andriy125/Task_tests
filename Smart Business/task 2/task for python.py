import pandas as pd
import os
import glob

# Set the current directory
script_directory = os.path.dirname(os.path.abspath(__file__))
os.chdir(script_directory)

# Get a list of CSV files
csv_files = glob.glob("Data part/*.csv")

# Create an empty DataFrame
df = pd.DataFrame()

# Read files and add them to the DataFrame
for file in csv_files:
    if file == csv_files[0]:
        # First file has headers
        df = pd.read_csv(file, delimiter=';')
        # headers reading
        headers = df.columns.tolist()
    else:
        # Files without headers
        temp_df = pd.read_csv(file, header=None, delimiter=';', names=headers)
        df = pd.concat([df, temp_df])

# Reset the DataFrame index
df.reset_index(drop=True, inplace=True)

# Calculate the fraction of domain for each row
df['Domain Fraction'] = df['email'].str.split('@').str[1]
domain_fraction = df['Domain Fraction'].value_counts()

# Count the number of people for each company
people_count_by_company = df['company_name'].value_counts()

# Configure the output
pd.set_option('display.max_rows', None)
pd.set_option('display.max_columns', None)

# Print the results
print("Fraction of domain for each row:")
print(domain_fraction)

print("\n", "-"*50, "\n")

print("Count of people for each company:")
print(people_count_by_company)
