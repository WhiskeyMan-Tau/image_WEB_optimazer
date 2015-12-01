#Images WEB optimizer script
## Optimaze images in the folder to public in WEB.

# ENGLISH
The script changes the images in a folder, optimizing them for publication in the WEB.

To use script set options in section **Script settings** and copy script to folder where placed images.

Description of the parameters:

**FILE_FORMAT** - Specifies the type of image expansion (jpg, png, etc.).

**IMG_MAX_WIDTH** and **IMG_MAX_HEIGHT** - set the size (width and height) of the image.

	If the picture has a larger width or height greater than that specified, it will be reduced to
	
	specified size preserving the aspect ratio of the image.
	
**QUALITY** - sets the quality (compression) images as a percentage of the original (100%)

	100 - 100% quality.
	
	90 - 90% quality and so on.
	
**ROTATE_DEG** - specifies how many degrees you want to rotate the image

	0 to 360 - rotate clockwise
	
	0 to -360 - turn counterclockwise

**WATERMARK** - The text that will be imposed as a watermark

**WATERMARK_FONT_SIZE** - The font size of the watermark


To work correctly, the script will need additional Packages:

  Imagemagick
  
    Installation: sudo apt-get install imagemagick
    
    

# RUSSIAN

Скрипт изменяет изображения в вапке, оптмизируя их для публикации в WEB.

Для использования укажите свои пареметры в разделе **Script settings** и скопируйте скрипт в папку где находятся изображения.

Описание параметров:

**FILE_FORMAT** - Задает тип изображений по расширению (jpg, png и прочие).

**IMG_MAX_WIDTH** и **IMG_MAX_HEIGHT** - задают размер (ширину и высоту) изображения.

    Если картинка имеет большую ширину или высоту, чем заданный, она будет уменьшина до
    указанного размера сохраняя пропорции изображения.
    
**QUALITY** - задает качетво (степень сжатия) изображения в процентах от оригинала (100%)

	100 - 100% качества.
	
	90 - 90% качества и так далее.
	
**ROTATE_DEG** - задает на сколько градусов нужно повернуть изображения

	от 0 до 360  - поворот по часовой 
	
	от 0 до -360 - поворот против часовой
	
**WATERMARK** - Текст, который будет наложен в виде водяного знака

**WATERMARK_FONT_SIZE** - Размер шрифта водяного знака


Для корректной работы скрипта понадобятся дополнительные пакеты пакеты:

	imagemagick
	
		Установка: sudo apt-get install imagemagick
