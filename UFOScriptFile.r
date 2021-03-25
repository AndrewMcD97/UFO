# Andrew Mc Daid - L00135038
# Data Science - Class Test 1

# -------------------------------------------------------------
# Q1 - Load In UFO Dataset And Replace Missing Content With NA
# -------------------------------------------------------------

ufo_data <- read.csv("ufo.csv", na = "")

# -------------------------------------------------------------
# Q2 - Show Structure of DataFrame And First 15 Rows Of Data
# Also Count The Number Of Rows In The DF, It Should Equal 89071
# -------------------------------------------------------------

# View Structure To Check If It's Read In Right
str(ufo_data)

# Show First 15 Rows Of DataFrame
head(ufo_data, 15)

# Count The Number Of Rows In The DataFrame, Should = 89071
nrow(ufo_data)

# -------------------------------------------------------------
# Q3 - Convert datetime From chr DataType To The date DataType
# -------------------------------------------------------------

# Telling R The Format Of The Data And Saving It To A Variable Called 
# converted_date Then Checking To See If It Worked
converted_date <- as.Date(ufo_data$datetime, format = '%m/%d/%Y')
converted_date

# -------------------------------------------------------------
# Q4 - Update DF With New Date Structure, Prove It's Changed By
# Displaying The New Structure. datetime Should Be A Date Type
# -------------------------------------------------------------

# Saving The Converted Dates Into The DataFrame
ufo_data$datetime <- converted_date

# Checking The Structure To See If datetime Now Has The Right DataType
str(ufo_data)

# -------------------------------------------------------------
# Q5 - Change Variable Names Of  duration..seconds. duration..hours.min.
# date.posted To DurationSeconds, DurationHrsMins, DatePosted
# Using The names() Function To Check Before And After Changing
# -------------------------------------------------------------

# Checking Column Names Before Changing
names(ufo_data)

# Want To Change Name Of Column 6,7 and 9
colnames(ufo_data)[6] = "DurationSeconds"
colnames(ufo_data)[7] = "DurationHrsMins"
colnames(ufo_data)[9] = "DatePosted"

# Verify It's Been Changed By Using names() Again
names(ufo_data)

# -------------------------------------------------------------
# Q6 - Change 'latitude' Variable From A chr To A Numerical Var
# Recode It To Numerical And Then Show New Structure
# -------------------------------------------------------------

# Convert latitude From chr To numerical
# Don't Use Int As The Data Has Decimal Points
converted_lat <- as.numeric(ufo_data$latitude)
converted_lat

# Place The Converted Data Into The latitude Variable
ufo_data$latitude <- converted_lat

# Check That The Structure Has Changed
str(ufo_data)

# -------------------------------------------------------------
# Q7 - Use The mice Library To Display The Num Of Missing Variables
# In The DataFrame. Check How Many Records Have No Missing Data
# And Also Check How Many Variables Have All Data Variables Missing
# -------------------------------------------------------------

# Install And Use The Mice Package To Show Missing Var's
install.packages("mice")
library(mice)

# Plot The Missing Data, Red Squares = Missing
md.pattern(ufo_data)

# From This Plot 69528 Records Have No Missing Data
# 196 Records Have All Data Variables Missing
# Plot Is Saved As A .png But It's Hard To See Var Names etc Due To Amount Of Data

# -------------------------------------------------------------
# Q8 - Sort UFO DF By Shape And Then By City. Extract The Cols
# datetime, city, country And shape And Store In A DF Called
# sorted_ufo_data. Display The First 15 Rows Of This
# -------------------------------------------------------------

# Sort DF By Shape And Then City Within Each Shape Of UFO
attach(ufo_data)
shapeCity <- ufo_data[order(shape,city),]
shapeCity

# Extract The 4 Needed Columns From This
sorted_ufo_data <- subset(shapeCity, select =  c(datetime, city, country, shape))

# Show First 15 Rows Of The Subset
head(sorted_ufo_data, 15)

# -------------------------------------------------------------
# Q9 - Use subset() To Find All Records In ufo_data Where Country
# Is 'gb' And Shape = 'disk', Store It In ufo_gb_disk DataFrame
# -------------------------------------------------------------

attach(ufo_data)
ufo_gb_disk <- subset(ufo_data, country == 'gb' & shape == 'disk')

# 111 Records Matching This Data According To str()
str(ufo_gb_disk)

# Show First 15 Rows Of This DF 
head(ufo_gb_disk)

# -------------------------------------------------------------
# Q10 - Use write.csv() To Save ufo_data As 'modified_ufo.csv'
# ufo_gb_disk as 'ufo_gb.csv' And sorted_ufo_data As 'sorted_ufo.csv'
# Save All 3 Files Into The Working Directory.
# 
# Sync 5 Files To My Remote GitHub Repo -
# UFOScriptFile.r, modified_ufo.csv, ufo_gb.csv, sorted_ufo_data And
# missingvars.png
#
# My Repo Link Is - https://github.com/AndrewMcD97/UFO
# -------------------------------------------------------------

# Saving ufo_data as 'modified_ufo.csv'
write.csv(ufo_data, file="modified_ufo.csv")

# Saving ufo_gb_disk as 'ufo_gb.csv'
write.csv(ufo_gb_disk, file="ufo_gb.csv")

# Saving sorted_ufo_data As 'sorted_ufo.csv'
write.csv(sorted_ufo_data, file="sorted_ufo.csv")



