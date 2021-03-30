library(forestmodel)

panels <- list(
  list(width = 0.03),
  list(
    width = 0.1,
    display = ~ variable,
    fontface = "bold",
    heading = "Variable"
  ),
  list(width = 0.1, display = ~ level),
  list(
    width = 0.03,
    item = "vline",
    hjust = 0.5
  ),
  list(
    width = 0.75,
    item = "forest",
    hjust = 0.5,
    heading = "Odds Ratio",
    linetype = "dashed",
    line_x = 0,
    text_size = 5,
    shape = 18,
    size = 4
  ),
  list(
    width = 0.03,
    item = "vline",
    hjust = 0.5
  ),
  list(
    width = 0.08,
    heading = "95% CI",
    display = ~
      gsub(".", "·",
        sprintf(
          "%0.2f (%0.2f – %0.2f)",
          trans(estimate),
          trans(conf.low),
          trans(conf.high)
        ),
        fixed = T
      ),
    
    display_na = NA
  ),
  list(
    width = 0.03,
    display = ~ gsub(".", "·", ifelse(
      reference, "", format.pval(p.value, digits = 1, eps = 0.001)
    ), fixed = T),
    display_na = NA,
    hjust = 1,
    heading = "p"
  ),
  list(width = 0.03)
)

format_options <- forest_model_format_options(
  colour = "black",
  color = NULL,
  shape = 18,
  text_size = 5,
  point_size = 4,
  banded = TRUE
)