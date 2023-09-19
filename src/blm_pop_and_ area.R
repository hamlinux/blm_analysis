# Total Number of Square Miles and Horses in system
blm.df %>% 
 select(est_horse_pop, total_sq_miles, admin_st) %>% 
 summarise(total_sq_mile =  sum(total_sq_miles),
           total_horse_pop = sum(est_horse_pop),
           average_horse_per_mile = mean(total_horse_pop / total_sq_mile),
           average_mile_per_horse = mean(total_sq_mile / total_horse_pop)) %>% 
  print()


#Plot Avereage Horses per Square Mile per State
blm.df %>% 
  select(est_horse_pop, total_sq_miles, admin_st) %>% 
  group_by(admin_st) %>%
  summarise(avg_horse_per_mile = mean(est_horse_pop / total_sq_miles)) %>% 
  ggplot(aes(x = admin_st, y = avg_horse_per_mile))+
  geom_col()+
  labs(title = "Average Horse per Square Mile by State",
       x= "Administrative State",
       y = "Average Horses per Square Mile")

  ggsave(file.path('graphs', 'avg_sq_miles_state.png'))
  
#Plot Total Square Miles Managed per State
blm.df %>% 
 select(est_horse_pop, total_sq_miles, admin_st) %>% 
 group_by(admin_st) %>%
 summarise(total_sq_mile_state =  sum(total_sq_miles)) %>%
 ggplot(aes(x = admin_st, y = total_sq_mile_state))+
 geom_col()+
 labs(title = "Total Square Miles of Management Land per State",
       x = "Administrative State",
       y = "Total Square Miles")
 
 ggsave(file.path('graphs', 'total_sqmiles_per_state.png')) 
  
  