
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

Char_Rank <- SWars_Test_3 %>% 
  select(matches("View_*"))


# sd_MR=sd(MR_pmol_s),
#             N_N=n(),
#             se=sd_MR/sqrt(N_N),
#             upper_limit=mean_MR+1*sd_MR, 
#             lower_limit=mean_MR-1*sd_MR 
#   )

        
#test_test <- cbind(colnames(Char_Rank_Sum),Char_test)
                
                
#Char_test <- t(Char_Rank)%>%
  
Char_Sum_test <-summarise(test_test, mean_view=mean(as.numeric(test_test),trim = 0,), .groups=rowwise)



Char_Rank_Sum <-cbind(
  data.frame(c(mean(as.numeric(Char_Rank$View_Han), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Luke), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Leia), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Ani), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Obi), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Emp), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Vader), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Lando), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Boba), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_3po), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_R2), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Jar), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Padme), na.rm = TRUE),
             mean(as.numeric(Char_Rank$View_Yoda), na.rm = TRUE)
                )),
  data.frame(c(sd(as.numeric(Char_Rank$View_Han), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Luke), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Leia), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Ani), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Obi), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Emp), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Vader), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Lando), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Boba), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_3po), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_R2), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Jar), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Padme), na.rm = TRUE),
             sd(as.numeric(Char_Rank$View_Yoda), na.rm = TRUE)
              )),
  colSums(!is.na(Char_Rank))
  )

