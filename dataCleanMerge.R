# Libraries
library(readxl)
library(dplyr)
library(tidyr)
library(stringr)
library(car)

# Import supervisor and nurse data
nurseData <- read_excel("~/Documents/R projects/Google/nurseData.xlsx")
supervisorData <- read_excel("~/Documents/R projects/Google/supervisorData.xlsx")
View(nurseData)
View(supervisorData)

# recode multiple columns in supervisor data (note: N/A's are actually "not applicable" survey anaswer - turn into R's NA)
glimpse(supervisorData)

supervisorData1 <- sapply(supervisorData, FUN = function(x) recode(x, 
  "'Among the Weakest'=1.0; 'Below Average'=2.0; 'Average'=3.0; 'Above Average'=4.0; 'Among the Best'=5.0;"))

supervisorData1[supervisorData1 == 'N/A'] <- NA

#SupervisorData1 is a matrix, want to convert it to data.frame
class(supervisorData1)
supervisorData2 <- as.data.frame(supervisorData1)

# mean replace NA's accross all of the columns
for(i in 1:ncol(supervisorData2)){
  supervisorData2[is.na(supervisorData2[,i]), i] <- mean(supervisorData2[,i], na.rm = TRUE)
}

# Create supervisor data dimension average scores
supervisorData3 <- mutate(supervisorData2, 
  mc = (mc01 + mc02 + mc03 + mc04 + mc05 + mc06 + mc07 + mc08 + mc09 + mc10 + mc11 + mc12 
        + mc13 + mc14 + mc15 + mc16 + mc17 + mc18 + mc19 + mc20 + mc21) / 21,
  sc = (sc01 + sc02 + sc03 + sc04 + sc05 + sc06 + sc07 + sc08 + sc09 + sc10) / 10,
  hp = (hp02 + hp03 + hp04 + hp05 + hp06) / 5,
  pi = (pi01 + pi02 + pi03 + pi04 + pi05 + pi06 + pi07 + pi08 + pi09) / 9,
  bc = (bc01 + bc02 + bc03 + bc04 + bc05 + bc06 + bc07 + bc08 + bc09 + bc10 + bc11) / 11,
  pt = (pt01 + pt02 + pt03 + pt04 + pt05 + pt06 + pt07 + pt08 + pt09 + pt10 + pt11) / 11,
  rr = (rr01 + rr02 + rr03 + rr04 + rr05 + rr06 + rr07)/ 7,
  pa = (pa01 + pa02 + pa03 + pa04 + pa05 + pa06 + pa07 + pa08 + pa09 + pa10 + pa11) / 11)
  
# meanings of the supervisor data dimension average score variables
# Dimensions:
# "mc" = "managementOfCare", 
# "sc" = "safetyAndInfectionControl", 
# "hp" = "healthPromotionAndMaintenance", 
# "pi" = "psychosoicalIntegrity", 
# "bc" = "basicCareAndComfort", 
# "pt" = "pharmaAndParenteralTherapies", 
# "rr" = "reductionOfRiskPotential", 
# "pa" = "physiologicalAdaptation", 

# Single item measures:
# "ap01" = "avoidDiscipline", 
# "ap02" = "complianceSafetyGuidelines", 
# "ap03" = "errors", 
# "ap04" = "attendance", 
# "ap05" = "overallPerformance", 
# "ap06" = "potentialPerformance" 

# Create overall supervisor composite score - all on same scale, no need to standardize
supervisorData4 <- mutate(supervisorData3, compositeScore = (mc + sc + hp + pi + bc + pt + rr + pa) / 8)

# Create a supervisor datafile to merge (subset of supervisorData4)
supervisorFinal <- select(supervisorData4, nurseID, ap01:compositeScore)
head(supervisorFinal)

# Merge supervisor data with nurse data (inner join)
data <- merge(nurseData, supervisorFinal, by = "nurseID")
View(data)

# K-NN

# Logistic Regression

# Regression



