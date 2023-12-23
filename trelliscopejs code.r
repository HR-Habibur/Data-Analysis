library(tidyverse)
library(trelliscopejs)

# Load data
data(mtcars)

# Define the function to create the scatterplot matrix
create_spm <- function(data, xvar, yvar) {
  ggplot(data, aes(x = !!sym(xvar), y = !!sym(yvar))) +
    geom_point() +
    labs(x = xvar, y = yvar) +
    theme_classic()
}

# Create a list of plots
plots <- list()
for (xvar in names(mtcars)) {
  for (yvar in names(mtcars)) {
    plots[[paste0(xvar, ".", yvar)]] <- create_spm(mtcars, xvar, yvar)
  }
}

# Create the Trelliscope display
spm <- ts_display(
  name = "Scatterplot Matrix",
  author = "Your Name",
  descrip = "An interactive scatterplot matrix",
  nrow = 4,
  ncol = 4,
  grid = plots
)

# Publish the display
publish(spm)
