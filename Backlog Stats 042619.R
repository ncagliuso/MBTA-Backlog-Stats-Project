#Backlog Stats Project
#Nick Cagliuso
#This project provides data visualizations for requisitions in two specific buyers' backlogs

library(openxlsx)
library(dplyr)
library(tidyverse)
library(lubridate)
library(ggplot2)
library(ggExtra)
library(ggthemes)
library(egg)
BACKLOG_04262019_151001 <- read.xlsx("C:/Users/NCAGLIUSO/Desktop/BACKLOG-04262019-151001.xlsx")

BACKLOG_04262019_151001$Req_Date <- as.Date(BACKLOG_04262019_151001$Req_Date, origin = "1899-12-30")
BACKLOG_04262019_151001$Approval_Date <- as.Date(BACKLOG_04262019_151001$Approval_Date, origin = "1899-12-30")
BACKLOG_04262019_151001 <- BACKLOG_04262019_151001 %>% mutate(Approval_Age = today() - .data$Approval_Date)
PLOT_BACKLOG <- BACKLOG_04262019_151001 %>% filter(.data$Approval_Age < 300)
#Any Approval Age greater than 300 days is a significant outlier

CFRANCIS <- BACKLOG_04262019_151001 %>% filter(.data$Buyer == "CFRANCIS")
CFRANCIS <- CFRANCIS %>% filter(.data$Approval_Age < 200)
#Any Approval Age greater than 200 days is a significant outlier for this buyer

JKIDD <- BACKLOG_04262019_151001 %>% filter(.data$Buyer == "JKIDD")

ggplot(data = CFRANCIS, aes(x = Approval_Age)) + geom_density()
ggplot(data = JKIDD, aes(x = Approval_Age)) + geom_density()
ggplot(data = PLOT_BACKLOG, aes(x = Approval_Age)) + geom_density()
#Density plots

ggplot(data = PLOT_BACKLOG, aes(x = Approval_Age)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 
ggplot(data = CFRANCIS, aes(x = Approval_Age)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white")+
  geom_density(alpha=.2, fill="#FF6666") 
ggplot(data = JKIDD, aes(x = Approval_Age)) + 
  geom_histogram(aes(y=..density..), colour="black", fill="white") +
  geom_density(alpha=.2, fill="#FF6666") 
#Histogram + density plot overlayed

plt1 <- PLOT_BACKLOG %>%
  ggplot(aes(x="", y = Approval_Age)) +
  geom_boxplot(fill = "lightblue", color = "black") + 
  coord_flip() +
  theme_classic() +
  xlab("") +
  theme(axis.text.y=element_blank(),
        axis.ticks.y=element_blank())
plt2 <- PLOT_BACKLOG %>% 
  ggplot() +
  geom_histogram(aes(x = Approval_Age, y = (..count..)/sum(..count..)),
                 position = "identity", binwidth = 1, 
                 fill = "lightblue", color = "black") +
  ylab("Relative Frequency") +
  theme_classic()
egg::ggarrange(plt2, plt1, heights = 2:1)
#Histogram with corresponding boxplot below for total Buyers' Backlog