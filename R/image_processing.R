# For image editing
library(magick)

# For piping code
library(magrittr)

# To adjust strings for filenames
library(stringr)

# After looking at the width, the book only goes up to aprox. 775 pixelwidth. 
# 750 pixelwidth looks best to me. Used on a full screen capture of 1920x920 creates a 752x361.
# Bordersize is adjusted to 1x1

# Every raw file will start with a fullscreen screenshot using Fireshot. 
#   I separate files between full, left, right and projection. This term will decide which part is cropped and bordered.
#   Full = fullscreen screenshot 
#   Left = Left half of the screen 
#   Right = Right half of the screen
#   Projection = 2/3 of the screen, removing the 1/3 on the right side.

# List all "raw" images, that are not resized and bordered yet. 
Allraw_images <- list.files('images', pattern = "raw")

# Separating the fullscreen images, left, right and projections.
Fullscreen_images <- grep("full", Allraw_images, value = TRUE)
Leftside_images <- grep("left", Allraw_images, value = TRUE)
Rightside_images <- grep("right", Allraw_images, value = TRUE)
Projection_images <- grep("projection", Allraw_images, value = TRUE)

# Resizing, cropping and adding borders for each subset of images.

# Fullscreen images
for (image in Fullscreen_images)
  {filelocation <- paste("images\\",image, sep = "")
  scaled_bordered_img <- image_read(filelocation) %>% image_scale("750") %>% image_border("blue", "1x1")
  newfilelocation <- str_remove(filelocation, "raw_full_")
  image_write(scaled_bordered_img, newfilelocation)
}

# Leftside images
for (image in Leftside_images)
  {filelocation <- paste("images\\",image, sep = "")
  scaled_cropped_bordered_img <- image_read(filelocation) %>% image_scale("750") %>% image_crop("376x361") %>% image_border("blue", "1x1")
  newfilelocation <- str_remove(filelocation, "raw_left_")
  image_write(scaled_cropped_bordered_img, newfilelocation)}

# Rightside images

for (image in Rightside_images)
  {filelocation <- paste("images\\",image, sep = "")
  scaled_cropped_bordered_img <- image_read(filelocation) %>% image_scale("750") %>% image_crop("376x361+376") %>% image_border("blue", "1x1")
  newfilelocation <- str_remove(filelocation, "raw_right_")
  image_write(scaled_cropped_bordered_img, newfilelocation)}

# Projection images
for (image in Projection_images)
  {filelocation <- paste("images\\",image, sep = "")
  scaled_cropped_bordered_img <- image_read(filelocation) %>% image_scale("750") %>% image_crop("562x361") %>% image_border("blue", "1x1")
  newfilelocation <- str_remove(filelocation, "raw_projection_")
  image_write(scaled_cropped_bordered_img, newfilelocation)}
