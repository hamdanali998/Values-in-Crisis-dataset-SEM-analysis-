library(car)
library(dplyr)


cleaned_data <- cleaned_data |> 
  mutate(
    mentalhealth_score = rowMeans(
      cbind(anxious, worry, depressed, low_interest, lonely), na.rm = TRUE),
    
    self_transcendence_score = rowMeans(
      cbind(
        equality_schwartz,
        caring_others_schwartz,
        helping_society_schwartz,
        social_good_schwartz,
        environment_schwartz),na.rm = TRUE),
    
    conservation_score = rowMeans(
      cbind(
        safety_schwartz,
        tradition_schwartz,
        loyalty_schwartz,
        respect_schwartz,
        proper_behavior_schwartz ), na.rm = TRUE),
    
    openness_change_score = rowMeans(
      cbind(
        creativity_schwartz,
        independence_schwartz,
        adventure_schwartz,
        novelty_schwartz), na.rm = TRUE),
    
    self_enhancement_score = rowMeans(
      cbind(
        wealth_schwartz,
        success_schwartz,
        achievement_schwartz), na.rm = TRUE),
    
    wellbeing_score = rowMeans(
      cbind(
        health_satisfaction,
        social_satisfaction,
        life_satisfaction ), na.rm = TRUE))

library(car)

vif_model <- lm(
  wellbeing_score ~
    mentalhealth_score +
    self_transcendence_score +
    conservation_score +
    openness_change_score +
    self_enhancement_score +
    age_grouped +
    gender,
  data = cleaned_data)

car::vif(vif_model)
