# load packages 
library(tidyverse)
library(janitor)

# clean names of variables
clean_data <- janitor::clean_names(raw_data)

# select and rename variables of interest
selected_data <- clean_data |> 
  select(
    
    # demographics
    q02_age_grouped,
    q01,
    
    #mental health outcomes
    q18_1,
    q18_2,
    q18_3,
    q18_4,
    q18_5,
    
    #health & well-being outcomes
    q34_1,
    q34_3,
    q34_5,
    
    #schwartz values
    q21_1:q21_22,
    
    #personality items (BFI-10)
    q30_1:q30_10
    
  ) |> 
  rename(
    
    #demographics
    gender = q01,
    age_grouped = q02_age_grouped,
    
    #mental health outcomes
    anxious = q18_1,
    worry = q18_2,
    depressed = q18_3,
    low_interest = q18_4,
    lonely = q18_5,
    
    #health & well-being outcomes
    health_satisfaction = q34_1,
    social_satisfaction = q34_3,
    life_satisfaction = q34_5,
    
    #schwartz values
    creativity_schwartz = q21_1,
    wealth_schwartz = q21_2,
    equality_schwartz = q21_3,
    achievement_schwartz = q21_4,
    safety_schwartz = q21_5,
    novelty_schwartz = q21_6,
    rule_following_schwartz = q21_7,
    understanding_others_schwartz = q21_8,
    humility_schwartz = q21_9,
    enjoyment_schwartz = q21_10,
    independence_schwartz = q21_11,
    caring_others_schwartz = q21_12,
    success_schwartz = q21_13,
    government_security_schwartz = q21_14,
    adventure_schwartz = q21_15,
    proper_behavior_schwartz = q21_16,
    respect_schwartz = q21_17,
    loyalty_schwartz = q21_18,
    environment_schwartz = q21_19,
    tradition_schwartz = q21_20,
    social_good_schwartz = q21_21,
    helping_society_schwartz = q21_22,
    
    #personality items (BFI-10)
    reserved = q30_1,
    trusting = q30_2,
    lazy = q30_3,
    relaxed = q30_4,
    few_artistic_interests = q30_5,
    outgoing = q30_6,
    critical = q30_7,
    thorough = q30_8,
    nervous = q30_9,
    imaginative = q30_10
    
  )
# check variables types
str(selected_data)

#check missing values
colSums(is.na(selected_data))

# percentage missing
missing_pct <- round(
  colSums(is.na(selected_data)) / nrow(selected_data) * 100,
  2
)

sort(missing_pct, decreasing = TRUE)

# missingness is generally low.
# BFI-10 items showed the highest missingness (around 7%),
# which is considered acceptable given the large sample size
# missing values were handled using listwise deletion

n_before <- nrow(selected_data)

selected_data <- na.omit(selected_data)

n_after <- nrow(selected_data)

n_removed <- n_before - n_after

# number of rows removed 5607 out of 40530

# check distributions
summary(selected_data)

# check duplicates

sum(duplicated(selected_data))

# there are 117 duplicates

# check for duplicate respondent IDs

sum(duplicated(clean_data$id_merge))

# result: 0 duplicate IDs found
# these 117 duplicates are for different respondents and were retained

# check for outliers

numeric_vars <- selected_data[sapply(selected_data, is.numeric)]

outlier_count <- sapply(numeric_vars, function(x) {
  sum(x < quantile(x, .25, na.rm = TRUE) - 1.5*IQR(x, na.rm = TRUE) |
        x > quantile(x, .75, na.rm = TRUE) + 1.5*IQR(x, na.rm = TRUE),
      na.rm = TRUE)
})

sort(outlier_count, decreasing = TRUE)

# verifying ranges to check values of the outliers

sapply(selected_data, range, na.rm = TRUE)

# All values fell within the valid response categories specified in the questionnaire
