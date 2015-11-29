#!/bin/bash

# RUSSIAN===========================================================================================
# Скрипт изменяет изображения в вапке, оптмизируя их для публикации в WEB.
# 
# Для использования укажите свои пареметры в разделе Script settings.
# 
# Описание параметров:
# file_format - Задает тип изображений по расширению (jpg, png и прочие).
# img_max_width и img_max_height - задают размер (ширину и высоту) изображения.
#   Если картинка имеет больший ширину иливысоту большую, чем заданный, она будет уменьшина до
#   указанного размера сохраняя пропорции изображения.
# quality - задает качетво (степень сжатия) изображения в процентах от оригинала (100%)
#   100 - 100% качества.
#   90 - 90% качества и так далее.
# 
# Для корректной работы скрипта понадобятся дополнительные пакеты пакеты:
#   imagemagick---------------------------------------------
#     Установка: sudo apt-get install imagemagick
#   exiftool------------------------------------------------
#   Планируется ввести изменение EXIF, для удаления автора 
#   и копирайта, сейчас установка этого пакета не нуэна
#     Установка: sudo apt-get install libimage-exiftool-perl


# Script settings ==================================================================================
file_format='jpg'
img_max_width=900
img_max_height=900
quality=90
# End Script settings ==============================================================================

for img in `ls *.$file_format`
do
  # Change the quality, if specified
  if [[ quality -gt 0 ]]; then
    `mogrify -quality $quality $img`
  fi

  # Width
  if [[ `identify -format "%w" $img` -gt $img_max_width ]]; then
    `mogrify -resize $img_max_width $img`
  fi

  # Height
  if [[ `identify -format "%h" $img` -gt $img_max_height ]]; then
    `mogrify -resize x$img_max_height $img`
  fi
done
