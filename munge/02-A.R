blm.df <- blm.clean %>%
  select(hma_name,
         admin_st,
         herd_type,
         total_acres,
         horse_aml_low,
         horse_aml_high,
         est_horse_pop,
         burro_aml_low,
         burro_aml_high,
         est_burro_pop) %>% 
  mutate(total_sq_miles = total_acres / 640)