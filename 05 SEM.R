library(lavaan)


model <- '


mentalhealth =~ anxious +
                worry +
                depressed +
                low_interest +
                lonely

#schwartz values
self_transcendence =~ equality_schwartz +
                      caring_others_schwartz +
                      helping_society_schwartz +
                      social_good_schwartz +
                      environment_schwartz

conservation =~ safety_schwartz +
                tradition_schwartz +
                loyalty_schwartz +
                respect_schwartz +
                proper_behavior_schwartz

openness_change =~ creativity_schwartz +
                   independence_schwartz +
                   adventure_schwartz +
                   novelty_schwartz

self_enhancement =~ wealth_schwartz +
                    success_schwartz +
                    achievement_schwartz
                    
                
wellbeing =~ health_satisfaction +
             social_satisfaction +
             life_satisfaction


self_transcendence ~~ conservation
self_transcendence ~~ openness_change
self_transcendence ~~ self_enhancement

conservation ~~ openness_change
conservation ~~ self_enhancement

openness_change ~~ self_enhancement

mentalhealth ~~ self_transcendence
mentalhealth ~~ conservation
mentalhealth ~~ openness_change
mentalhealth ~~ self_enhancement



wellbeing ~ mentalhealth +
                      self_transcendence +
                      conservation +
                      openness_change +
                      self_enhancement +
                      age_grouped +
                      gender

'

fit <- sem(
  model,
  data = cleaned_data,
  estimator = "WLSMV"
)

summary(
  fit,
  standardized = TRUE,
  fit.measures = TRUE,
  rsquare = TRUE
)
