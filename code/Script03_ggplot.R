library(tidyverse)


# Point figure ------------------------------------------------------------

## Shift +ctrl+ M for pipe

iris %>% 
  ggplot(
    aes(x = Sepal.Length,
        y = Sepal.Width)
  ) +
  geom_point()
## aes(...,color)
iris %>% 
  ggplot(
    aes(x = Sepal.Length,
        y=Sepal.Width,
        color=Species)
  )+
  geom_point()

iris %>% 
  ggplot(
    aes(x = Sepal.Length,
        y= Sepal.Width)
  )+
  geom_point(color = "darkgreen")





# line figure -------------------------------------------------------------

df_x <- tibble(x= 1:50,
       y= 2* x)

df_x %>% 
  ggplot(
    aes(x = x,
        y = y)
  ) +
  geom_line()

# histogram ---------------------------------------------------------------

iris %>%
  ggplot(
    aes(x+ Sepal.Length)
  )+
  geom_histogram()


# boxplot -----------------------------------------------------------------



