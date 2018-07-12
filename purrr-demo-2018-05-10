install.packages('purrr')

library(purrr)

ir_num <- iris[,1:4]

out <- double()
for (i in seq_along(ir_num)) {
  out[i] <- mean(ir_num[[i]])
}
out

map(ir_num, mean)
map_dbl(ir_num, mean, na.rm = TRUE)

is.numeric(3)

ir_num <- iris %>% 
  keep(is.numeric)

head(ir_num)

iris %>% 
  discard(is.numeric) %>% 
  head()

lm(mpg ~ wt, data = mtcars)

View(mtcars)

mtcars %>% 
  split(.$cyl) %>% 
  map(function(df) lm(mpg ~ wt, data = df))

mtcars %>% 
  split(.$cyl) %>% 
  map(~ lm(mpg ~ wt, data = .))

x <- list('cable', 'paper',
          'pen')  

x %>% 
  reduce(paste)
