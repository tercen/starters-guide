library(magick)
library(magrittr)

img <- image_read('images\\Defining_teams_DefineTeam.png')

img_shadow <-  image_shadow(img, color = "black", bg = "white", geometry = "50x10+30+30", operator = "atop", offset = "+20+20")

image_write(img_shadow, 'images\\SHADOWDefi_ning_teams_DefineTeam.png' )

# blue_images <- list.files('images', pattern = ("workflow"))


