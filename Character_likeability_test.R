mybarplot <- function(dataframe, x_axis, y_axis, fill_factor) {
  {{dataframe}} %>% 
  filter({{x_axis}} == c('1', '2','3','4','5'))%>%
  ggplot2::ggplot(.)+
    geom_bar(mapping = aes(x= {{x_axis}},
                           fill = {{fill_factor}}
                          ),
                    stat = {{y_axis}},
                    position = 'dodge'
  )
}

mybarplot(SWars_Clean, c(View_Han, View_Luke), 'count', Age)

mybarplot(SWars_Clean, View_Luke, 'count', interaction(Age, Gender))


ggplot(data = SWars_Clean)+
  geom_bar(mapping = aes(x= View_Luke,
                         fill = Gender
  ),
  stat = 'count',
  position = 'dodge'
  )  



