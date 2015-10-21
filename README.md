# Smartphone_exercise
data collected from the accelerometers from the Samsung Galaxy S smartphone

read_file.R
downloads the file and unzips

run_analysis.R
reads in all necessary tables
removes special characters from feature names
creates one data frame out of train, test, y and subject
creates new data frame with reduced number of features (mean and std)
creates new data set
