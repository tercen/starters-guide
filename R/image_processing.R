library(magick)
library(magrittr)
library(stringr)


all_images <- list.files('images', pattern = "raw_*.png")
new_names <- paste0("raw_", all_images)

file_location <- paste("images\\",all_images, sep = "")
new_file_location <- paste("images\\",new_names, sep = "")

file.rename(file_location, new_file_location )

for (i in (1:length(new_file_location))){
print(i)
input_img <- image_read(new_file_location[i])
output_img <- image_shadow(input_img, color = "black", bg = "white", geometry = "50x10+30+30", operator = "atop", offset = "+20+20")
image_write(output_img, file_location[i])
}


all_raw_images <- list.files('images', pattern = "raw_")
for (image in all_raw_images){
filelocation <- paste("images\\",image, sep = "")
shadow_bordered_img <- image_read(filelocation) %>% image_shadow(color = "black", bg = "white", geometry = "50x10+30+30", operator = "atop", offset = "+20+20")
newfilelocation <- str_remove(filelocation, "raw_")
image_write(shadow_bordered_img, newfilelocation)}
