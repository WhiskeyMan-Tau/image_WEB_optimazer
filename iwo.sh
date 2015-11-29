#!/bin/bash

# ENGLISH ==========================================================================================
# The script changes the images in a folder, optimizing them for publication in the WEB.
#
# To use the select its paremetry section Script settings.
#
# Description of the parameters:
# FILE_FORMAT - Specifies the type of image expansion (jpg, png, etc.).
# IMG_MAX_WIDTH and IMG_MAX_HEIGHT - set the size (width and height) of the image.
#   If the picture is wider ilivysotu greater than specified, it will be up to umenshina
#   Specified size preserving the aspect ratio of the image.
# QUALITY - sets kachetvo (compression) images as a percentage of the original (100%)
#   100 - 100% quality.
#   90 - 90% quality and so on.
# ROTATE_DEG - specifies how many degrees you want to rotate the image
#   0 to 360 - rotate clockwise
#   0 to -360 - turn counterclockwise
#
# To work correctly, the script will need additional Packages:
#   Imagemagick ---------------------------------------------
#     Installation: sudo apt-get install imagemagick
#   Exiftool ------------------------------------------------
#   It is planned to introduce a change in the EXIF, to remove 
#   the author and Copyright and now installation of this 
#   package is not needed.
#     Installation: sudo apt-get install libimage-exiftool-perl

# RUSSIAN===========================================================================================
# Скрипт изменяет изображения в вапке, оптмизируя их для публикации в WEB.
# 
# Для использования укажите свои пареметры в разделе Script settings.
# 
# Описание параметров:
# FILE_FORMAT - Задает тип изображений по расширению (jpg, png и прочие).
# IMG_MAX_WIDTH и IMG_MAX_HEIGHT - задают размер (ширину и высоту) изображения.
#   Если картинка имеет больший ширину иливысоту большую, чем заданный, она будет уменьшина до
#   указанного размера сохраняя пропорции изображения.
# QUALITY - задает качетво (степень сжатия) изображения в процентах от оригинала (100%)
#   100 - 100% качества.
#   90 - 90% качества и так далее.
# ROTATE_DEG - задает на сколько градусов нужно повернуть изображения
#   от 0 до 360  - поворот по часовой 
#   от 0 до -360 - поворот против часовой
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
ROTATE_DEG=180
# End Script settings ==============================================================================

for img in `ls *.$FILE_FORMAT`
do
  # Change the QUALITY, if specified
  if [[ $QUALITY -gt 0 ]]; then
    `mogrify -quality $QUALITY $img`
  fi

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
