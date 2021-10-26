mybarplot <- function(dataframe, x_axis, y_axis, fill_factor) {
  ggplot2::ggplot(data = {{dataframe}})+
    geom_bar(mapping = aes(x= {{x_axis}},
                           fill = {{fill_factor}}
                          ),
                    stat = {{y_axis}},
                    position = 'dodge'
  )
}

mybarplot(SWars_Clean, View_Han, 'count', Gender)



ggplot(data = SWars_Clean)+
  geom_bar(mapping = aes(x= View_Luke,
                         fill = Gender
  ),
  stat = 'count',
  position = 'dodge'
  )  



