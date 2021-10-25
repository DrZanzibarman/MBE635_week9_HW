
library(tidyr)
#library(plyr)
library(ggplot2)
library(magrittr)
library(ggplot2)
library(dplyr)


list_of_chars <- c("SWars_Raw$View_Han", "SWars_Raw$View_Luke", "SWars_Raw$View_Leia")  #, SWars_Raw$View_Ani, SWars_Raw$View_Obi, SWars_Raw$View_Emp, SWars_Raw$View_Vader, SWars_Raw$View_Lando, SWars_Raw$View_Boba, SWars_Raw$View_3po, SWars_Raw$View_R2, SWars_Raw$View_Jar, SWars_Raw$View_Padme, SWars_Raw$View_Yoda)

for(movie_char in list_of_chars) {
  print(movie_char)
  levels(movie_char)

  ggplot(SWars_Clean)+
    geom_bar(mapping = aes( x= movie_char
    ),
    stat = 'count',
    )

  }





List_of_chars <- c("SWars_Raw$View_Han", "SWars_Raw$View_Luke", "SWars_Raw$View_Leia", "SWars_Raw$View_Ani", "SWars_Raw$View_Obi", "SWars_Raw$View_Emp", "SWars_Raw$View_Vader", "SWars_Raw$View_Lando", "SWars_Raw$View_Boba", "SWars_Raw$View_3po", "SWars_Raw$View_R2", "SWars_Raw$View_Jar", "SWars_Raw$View_Padme", "SWars_Raw$View_Yoda")) 



for(Movie_Char in c(SWars_Clean$View_Han, SWars_Clean$View_Luke, SWars_Clean$View_Leia)) {
  "Movie_Char" <- factor("Movie_Char", levels = c('Very unfavorably', 'Somewhat unfavorably', 'Neither favorably nor unfavorably (neutral)', 'Somewhat favorably', 'Very favorably'), ordered = TRUE)
  ggplot(SWars_Clean)+
    geom_bar(mapping = aes( x= SWars_Clean$"Movie_Char"
    ),
    stat = 'count',
    )
}

SWars_Clean$View_Han <- factor(SWars_Clean$View_Han, levels = c('Very unfavorably', 'Somewhat unfavorably', 'Neither favorably nor unfavorably (neutral)', 'Somewhat favorably', 'Very favorably'), ordered = TRUE)

ggplot(SWars_Clean)+
  geom_bar(mapping = aes( x= SWars_Clean$View_Han,
                          fill = Fan_YN
    ),
    stat = 'count',
    position = 'dodge'
  )+
  facet_wrap(vars(Gender))

levels(SWars_Clean$View_Han)

# Neither favorably nor unfavorably (neutral) 2
# 
#   1
# Unfamiliar (N/A)  N/A
# Very favorably  4
# Very unfavorably  0





SWars_Test_3 <- SWars_Clean %>% 
  mutate(across(matches("View_*"),
        recode, 'Very unfavorably' = '1','Somewhat unfavorably' ='2', 'Neither favorably nor unfavorably (neutral)'='3', 'Somewhat favorably' = '4', 'Very favorably' = '5', 'Unfamiliar (N/A)'=NULL))
