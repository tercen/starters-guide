library(magick)
library(magrittr)

img <- image_read('images\\add_workflow.png')

img_blue <- image_border(img, "blue", "1x1")

image_write(img_blue, 'images\\BLUE_add_workflow.png' )

blue_images <- list.files('images', pattern = ("workflow"))
