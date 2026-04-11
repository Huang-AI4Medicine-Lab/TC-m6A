
# ==========================================
# Global Project Setup & Custom Functions
# ==========================================

# 1. Load global libraries
# ==> Add other libraries you use in every chapter here (e.g., library(dplyr), library(ggplot2))
library(magrittr)


# 2. Custom inline hook for formatting numbers
inline_hook <- function(x) {
  if (is.numeric(x)) {
    formatted <- format(x, digits = 2, big.mark = ",")
  } else {
    formatted <- x
  }
  paste0("**", formatted, "**")
}
knitr::knit_hooks$set(inline = inline_hook)

# 3. Custom colorize function for HTML/PDF compatibility
colorize <- function(x, color) {
  if (knitr::is_latex_output()) {
    sprintf("\textcolor{%s}{%s}", color, x)
  } else if (knitr::is_html_output()) {
    sprintf("<span style='color: %s;'>%s</span>", color, x)
  } else {
    x
  }
}

# 4. Read the hidden .env file located one folder up in the main project directory
readRenviron("../.env")

# 5. Extract the CLOUD path and save it as a global R variable
cloud <- Sys.getenv("CLOUD")
