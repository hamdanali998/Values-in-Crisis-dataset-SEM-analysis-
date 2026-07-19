library(semTools)

model_cr <- '


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




'

fit_cr <- cfa( model_cr, data = cleaned_data, estimator = "WLSMV")



compRelSEM(fit_cr)


AVE(fit_cr)
