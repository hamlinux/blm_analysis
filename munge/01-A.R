# Example preprocessing script.
blm.clean <- clean_names(blm.data) %>%
  drop_na(total_acres)
