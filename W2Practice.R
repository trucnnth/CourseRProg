dataset_url <- 'http://s3.amazonaws.com/practice_assignment/diet_data.zip'
download.file(dataset_url, 'diet_data.zip')
unzip('diet_data.zip', exdir = 'diet_data')

list.files('diet_data')
andy <- read.csv('diet_data/Andy.csv')
head(andy)

length(andy$Day)
dim(andy)

names(andy) #[1] "Patient.Name" "Age"          "Weight"       "Day"

andy[which(andy$Day == 30), 'Weight']
#the same as
subset(andy$Weight, andy$Day == 30)

andy_start <- andy[1, 'Weight']
andy_end <- andy[30, 'Weight']

andy_loss <- andy_start - andy_end

files_full <- list.files('diet_data', full.names = TRUE)
head(read.csv(files[3]))

andy_david <- rbind(andy, read.csv(files[2]))
head(andy_david)
tail(andy_david)

weightmedian <- function(directory, day){
    files_list <- list.files(directory, full.names = TRUE)
    dat <- data.frame()
    for (i in 1:5){
        dat <- rbind(dat, read.csv(files_list[i]))
    }
    dat_subset <- dat[which(dat[, 'Day'] == day), ]
    median(dat_subset[, 'Weight'], na.rm = TRUE)
}

tmp <- vector(mode = 'list', length = length(files_full))

for (i in seq_along(files_full)){
    tmp[[i]] <- read.csv(files_full[[i]])
}
