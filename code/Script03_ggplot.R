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
    aes(x= Sepal.Length)
  )+
  geom_histogram()


# boxplot -----------------------------------------------------------------

iris %>% 
  ggplot(
    aes(x = Species,
        y = Sepal.Length)
  )+
  geom_boxplot()

## change color
iris %>% 
  ggplot(
    aes(x = Species,
        y = Sepal.Length,
        color = Species)
  ) +
geom_boxplot()

## change inside box
iris %>% 
  ggplot(
    aes(x = Species,
        y = Sepal.Length,
        fill = Species)
  ) +
  geom_boxplot()

# exercise ---------------------------------------------------------------


# Q1 Using iris data, identify the longest Sepal.Length using arrange() function

iris %>% 
  arrange(desc(Sepal.Length))
    
# Q2 Using iris data, filter/select individuals with Sepal.Width greater than 3.0
    
iris %>% 
  filter(Sepal.Width > 3.0)
# Q3 using iris data, select the columns "Petal.Length" and "Petal.Width"
# and arrange the order of rows by "Petal.Length"
# Assign the result to object "df_petal"

df_Petal <- iris %>% 
  select(Petal.Length, Petal.Width) %>% 
  arrange(desc(Petal.Length))
# Q4 Calculate mean Sepal.Width by species ;assign the result to "df_mean"
iris %>% 
  group_by(Species) %>% 
  summarize(mean = mean(Sepal.Width))
# Q5 Create a point figure of Petal.Width (y-axis) and sepal.Width (x-axis)
iris %>% 
  ggplot(aes(x = Sepal.Width,
        y = Petal.Width,
        color = Species)) +
  geom_point()
