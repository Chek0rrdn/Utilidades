#!/bin/bash
#Autor: Edgar Alberto Pérez


# Verificar si se ha proporcionado un archivo de entrada
if [ $# -eq 0 ]; then
    echo "Por favor, proporcione un archivo de entrada."
    exit 1
fi

# Asignar nombres de archivo de entrada y salida
input=$1
output="${input%.*}_.mp4"

# Convertir el archivo de video al formato compatible con Roku
ffmpeg -i "$input" -c:v libx264 -profile:v high -level:v 4.0 -pix_fmt yuv420p -preset medium -crf 23 -c:a aac -b:a 192k -ac 2 "$output"

# Mostrar mensaje de finalización
echo "La conversión del archivo $input ha sido completada. El archivo resultante es $output."

#               ./convert-to-roku.sh /ruta/a/mi/video.avi