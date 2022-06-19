# Load the dplyr and tidyverse package
library(dplyr)
library(tidyverse)
# Load MechaCar Data
mecha_mpg <- read.csv(file='./Resources/MechaCar_mpg.csv',check.names=F,stringsAsFactors = F) 
# Deliverable 1 - Linear Regression
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg) # Setup Linear Regression
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mecha_mpg)) # Summarize Data

## Suspension Coil - Summary Statistics
mecha_coil <- read.csv(file='./Resources/Suspension_Coil.csv',check.names=F,stringsAsFactors = F)
total_summary <- mecha_coil %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Var_PSI=var(PSI),Std_Dev_PSI=sd(PSI),Num_Coil=n(), .groups = 'keep') 
# Lot Summary
lot_summary <- mecha_coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),Median_PSI=median(PSI),Var_PSI=var(PSI),Std_Dev_PSI=sd(PSI),Num_Coil=n(), .groups = 'keep')
## Visualization
plt1 <- ggplot(mecha_coil,aes(y=PSI)) # Total 
plt1 + geom_boxplot()

plt2 <- ggplot(mecha_coil,aes(x=Manufacturing_Lot,y=PSI)) # by Lot
plt2 + geom_boxplot()


### T-Tests on Suspension Coils
t.test(mecha_coil$PSI,mu=1500) # for PSI t-test
lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1") # for lot1
lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2") # for lot2
lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3") # for lot3
t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)
