ggplot(data = SWars_Clean)+
  geom_bar(mapping = aes(x= View_Luke,
                         fill = Gender
  ),
  stat = 'count',
  position = 'dodge'
  )  



