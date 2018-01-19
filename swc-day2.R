gapminder <- read.csv("https://raw.githubusercontent.com/swcarpentry/r-novice-gapminder/gh-pages/_episodes_rmd/data/gapminder-FiveYearData.csv")

x <- 1:5
x[3]
x[1:3]

xlist <- list(a = 'Software Carpentry',
              b = 1:10,
              data = head(iris))

xlist[1]
xlist[1:2]

xlist[[1]]
xlist[[2]]

xlist[[1:2]]
xlist[[-1]]
names(xlist)
xlist[['a']]
xlist$a

# data frames

View(gapminder)
head(gapminder[3])
head(gapminder[['lifeExp']])
head(gapminder$lifeExp)

gapminder[1:3,]
gapminder[4,2]

# gapminder - extract rows 1 to 9 AND rows 19 to 23 for all cols
gapminder[c(1:9, 19:23),]

# control flow
x <- 3

if (x > 7){
  print('x is greater than 7')
}

x <- 3
if (x > 7){
  print('x is greater than 7')
} else {
  print('x is not greater than 7')
}

any(c(FALSE, TRUE, TRUE))
all(c(FALSE, TRUE, TRUE))

x <- 7
if (x > 7){
  print('x is greater than 7')
} else if (x == 7){
  print('x is equal to 7')
} else {
  print('x is not greater than 7')
}

x <- 1:10
for (element in x){
  print(element)
}

x <- 1:5
y <- c('a', 'b','c', 'd', 'e')

for (i in x){
  for (j in y){
    print(paste(i, j))
  }
}

output_vector <- c()

for (i in x){
  for (j in y){
    output_vector <- c(output_vector, paste(i, j))
  }
}
output_vector

# graphics and plotting
library(ggplot2)
install.packages('ggplot2')

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

ggplot(data = gapminder, aes(x = gdpPercap, y = lifeExp))

ggplot(data = gapminder, 
       aes(x = year, y = lifeExp, by = country)) +
  geom_point() +
  geom_line(aes(color = continent))

# exercise -
# create a line plot with year on the x,
# gdp per capita on the y,
# color code by continent

ggplot(data = gapminder, aes(x = year, y = gdpPercap, color = continent)) +
  geom_line()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.2) +
  scale_x_log10() +
  geom_smooth(method = 'lm', size = 1.5)

# create a scatter plot (with an alpha value)
# with population on the x
# and log scaled gdpPercap on the y
# and add a linear fit with a thickness of 1.5

ggplot(gapminder, aes(x = pop, y = gdpPercap)) +
  geom_point(alpha = 0.2) +
  scale_y_log10() +
  geom_smooth(method = 'lm', size = 1.5) +
  scale_x_log10()

ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(alpha = 0.2, color = 'dodger blue') +
  scale_x_log10() +
  geom_smooth(method = 'lm', size = 1.5)

# functions

my_sum <- function(a, b) {
  our_sum <- a + b
  return(our_sum)
}
my_sum(2, 3)

fahr_to_kelvin <- function(temp){
  kelvin <- ((temp - 32) * (5/9)) + 273.15
  return(kelvin)
}
current_temperature <- 80
k_temperature <- fahr_to_kelvin(current_temperature)
k_temperature

# exercise - create a function that converts
# kelvin to celsius

kelvin_to_celsius <- function(temp) {
  celsius <- temp - 273.15
  return(celsius)
}

# dplyr
library(dplyr)
install.packages('dplyr')

gapminder[gapminder$continent == 'Africa',]

gapminder$continent

# select
head(select(gapminder, year, country, continent, gdpPercap))

gapminder %>% 
  select(year, country, continent, gdpPercap) %>% 
  head()

gapminder %>% 
  filter(continent == 'Europe', year <= 1970) %>%
  select(year, country, continent)

gapminder %>% 
  filter(continent == 'Europe' | year <= 1970) %>%
  select(year, country, continent) %>%
  head()

gapminder %>%
  group_by(continent) %>%
  summarise(mean_cont_gdp = mean(gdpPercap))

gapminder %>%
  group_by(continent) %>% 
  summarise(mean_cont_gdp = mean(gdpPercap),
            sd_gdp = sd(gdpPercap),
            mean_pop = mean(pop),
            count = n())


gapminder %>% 
  mutate(pop_per_mil = pop / 1e6) %>% 
  head()

gapminder %>% 
  filter(country %in% c('Afghanistan', 'Albania', 'Canada',
                        'South Africa')) %>%
  dim()
  
gapminder %>% 
  filter(country %in% c('Afghanistan', 'Albania', 'Canada',
                        'South Africa')) %>%
  ggplot(aes(x = year, y = lifeExp, color = continent)) +
  geom_line() +
  facet_wrap(~ country)

myplot <- ggplot(gapminder, aes(x = year, y = lifeExp, color = continent)) +
  geom_line() +
  facet_wrap(~ country)

ggsave('plot.png', plot = myplot, dpi = 500)
?ggsave
# exercise - 
# create a faceted line plot with year on the x
# and population on the y
# for the countries Canada, South Africa, Australia
# color code by continent
filter(country %in% c('Afghanistan', 'Albania', 'Canada',
                      'South Africa'))
  

