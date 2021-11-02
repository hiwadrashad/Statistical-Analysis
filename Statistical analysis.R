install.packages("gapminder")
library(gapminder)
summary(gapminder)

attach(gapminder)
median(pop)
hist(lifeExp)
hist(log(pop))
# statistical test functions inside gapminder

install.packages("dyplr")
library(dyplr)

df1 <- gapminder %>%
  select (country,lifeExp)%>%
  filter(country=="South Africa" | country == "Island") %>%
  #group_by(country)%>%
  #summarise(Average_life = mean(lifeExp))
  # summarization on average lifexp
  
t.test(data= df1 , lifeExp ~ country)

install.packages("ggplot2")
library(ggplot2)

gapminder %>%
  filter(gdpPercap < 50000) %>%
  ggplot(aes(x=log(gdpPercap), y=lifeExp, col=years, size=pop))+
  geom_point(alpha=0.3)+
  geom_smooth(method = lm)+
  facet_wrap(~continent)

summary(lm(lifeExp ~gdpPercap+pop))