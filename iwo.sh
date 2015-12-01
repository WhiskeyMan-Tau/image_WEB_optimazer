#!/bin/bash

# ENGLISH ==========================================================================================
# The script changes the image in the folder, optimizing them for publication in the WEB.
#
# To use, specify the parameters in the section ** Script settings **.
#
# Description of the parameters:
# FILE_FORMAT - Specifies the type of image expansion (jpg, png, etc.).
# IMG_MAX_WIDTH and IMG_MAX_HEIGHT - set the size (width and height) of the image.
#   If the picture has a larger width or height greater than that specified, it will be reduced to
#   Specified size preserving the aspect ratio of the image.
# QUALITY - sets the quality (compression) images as a percentage of the original (100%)
#   100 - 100% quality.
#   90 - 90% quality and so on.
# ROTATE_DEG - specifies how many degrees you want to rotate the image
#   0 to 360 - rotate clockwise
#   0 to -360 - turn counterclockwise
# WATERMARK - The text that will be imposed as a watermark
# WATERMARK_FONT_SIZE - The font size of the watermark
#
# To work correctly, the script will need additional Packages:
#   Imagemagick ---------------------------------------------
#     Installation: sudo apt-get install imagemagick
#   Exiftool ------------------------------------------------
#     It is planned to introduce a change in the EXIF, to remove the author
#     Copyright and now installation of this package is not needed.
#     Installation: sudo apt-get install libimage-exiftool-perl

# RUSSIAN===========================================================================================
# Скрипт изменяет изображения в в папке, оптимизируя их для публикации в WEB.
# 
# Для использования укажите свои параметры в разделе **Script settings**.
# 
# Описание параметров:
# FILE_FORMAT - Задает тип изображений по расширению (jpg, png и прочие).
# IMG_MAX_WIDTH и IMG_MAX_HEIGHT - задают размер (ширину и высоту) изображения.
#   Если картинка имеет большую ширину или высоту, чем заданный, она будет уменьшена до
#   указанного размера сохраняя пропорции изображения.
# QUALITY - задает качество (степень сжатия) изображения в процентах от оригинала (100%)
#   100 - 100% качества.
#   90 - 90% качества и так далее.
# ROTATE_DEG - задает на сколько градусов нужно повернуть изображения
#   от 0 до 360  - поворот по часовой 
#   от 0 до -360 - поворот против часовой
# WATERMARK - Текст который будет наложен в виде водяного знака
# WATERMARK_FONT_SIZE - Размер шрифта водяного знака
#
# Для корректной работы скрипта понадобятся дополнительные пакеты пакеты:
#   imagemagick---------------------------------------------
#     Установка: sudo apt-get install imagemagick
#   exiftool------------------------------------------------
#   Планируется ввести изменение EXIF, для удаления автора 
#   и копирайта, сейчас установка этого пакета не нужна.
#     Установка: sudo apt-get install libimage-exiftool-perl

# Script settings ==================================================================================
FILE_FORMAT='jpg'
IMG_MAX_WIDTH=900
IMG_MAX_HEIGHT=900
QUALITY=90
ROTATE_DEG=0
WATERMARK=
WATERMARK_FONT_SIZE=20
# End Script settings ==============================================================================

for img in `ls *.$FILE_FORMAT`
do
  # Change the QUALITY, if specified
  if [[ $QUALITY -gt 0 ]]; then
    `mogrify -quality $QUALITY $img` 
  fi

  # Add the watermark, if specified
  if [[  -n $WATERMARK ]]; then
    `mogrify -fill white -box '#00770080' -gravity South \
   -pointsize $WATERMARK_FONT_SIZE -annotate +0+5 "   $WATERMARK   " $img`
  fi

# Rotate image, if specified
if [[ $ROTATE_DEG -ne 0 ]]; then
    `mogrify -rotate $ROTATE_DEG $img`
fi

  # Width
  if [[ `identify -format "%w" $img` -gt $IMG_MAX_WIDTH ]]; then
    `mogrify -resize $IMG_MAX_WIDTH $img`
  fi

  # Height
  if [[ `identify -format "%h" $img` -gt $IMG_MAX_HEIGHT ]]; then
    `mogrify -resize x$IMG_MAX_HEIGHT $img`
  fi
done
