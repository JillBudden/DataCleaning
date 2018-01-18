''' Reminder on changing working directory in terminal: 
cd /Users/Users/jillbudden/Documents/PythonProjects/Google

To run the script type: python google.py '''

# libraries
import pandas as pd

# Import data
file = 'dimensionReduction.xlsx'

# Load spreadsheet
xl = pd.ExcelFile(file)

# Print sheet names
print(xl.sheet_names)

# Load a sheet into a DataFrame by index (can also do by name)
df1 = xl.parse(0)

# Print the head of the DataFrame 
print(df1.head())

# Parse the first sheet and rename the columns
df1 = xl.parse(0, skiprows=[0], names=['count', 'nurse', 'participantID', 'title',
                  'mc01', 'mc02', 'mc03', 'mc04', 'mc05', 'mc06', 'mc07',
                  'mc08', 'mc09', 'mc10', 'mc11', 'mc12', 'mc13', 'mc14', 'mc15', 'mc16', 'mc17',
                  'mc18', 'mc19', 'mc20', 'mc21', 'sic01', 'sic02', 'sic03', 'sic04', 'sic05',
                  'sic06', 'sic07', 'sic08', 'sic09', 'hpm01', 'hpm02', 'hpm03', 'hpm04', 'hpm05', 
                  'hpm06', 'pi01', 'pi02', 'pi03', 'pi04', 'pi05', 'pi06', 'pi07', 'pi08', 'pi09',
                  'bcc01', 'bcc02', 'bcc03', 'bcc04', 'bcc05', 'bcc06', 'bcc07', 'bcc08', 'bcc09',
                  'bcc10', 'bcc11', 'ppt01', 'ppt02', 'ppt03', 'ppt04', 'ppt05', 'ppt06', 'ppt07',
                  'ppt08', 'ppt09', 'ppt10', 'ppt11', 'rrp01', 'rrp02', 'rrp03', 'rrp04', 'rrp05',
                  'rrp06', 'rrp07', 'pa01', 'pa02', 'pa03', 'pa04', 'pa05', 'pa06', 'pa07', 'pa08',
                  'pa09', 'pa10', 'pa11', 'avoidDiscipline', 'complySafetyGuides', 'errors', 
                  'attendance', 'overallPerformance', 'potentialPerformance'])

# Print the head of the DataFrame
print(df1.head())

# meanings of the supervisor item data
# "mc" = "managementOfCare", 
# "sic" = "safetyAndInfectionControl", 
# "hpm" = "healthPromotionAndMaintenance", 
# "pi" = "psychosoicalIntegrity", 
# "bcc" = "basicCareAndComfort", 
# "ppt" = "pharmaAndParenteralTherapies", 
# "rrp" = "reductionOfRiskPotential", 
# "pa" = "physiologicalAdaptation", 


# recode multiple columns in supervisor data - deal with nan - delete or mean replace

# Clustering

# Dimensionality Reduction

