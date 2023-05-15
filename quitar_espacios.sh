#!/bin/bash

# Función para renombrar archivos
function renombrar_archivos {
  for archivo in "$1"/*.{mp4,avi,mkv}; do
    if [[ -f "$archivo" ]]; then
      # Renombrar el archivo cambiando los espacios por guiones bajos
      nuevo_archivo=${archivo// /_}
      if [[ "$archivo" != "$nuevo_archivo" ]]; then
        mv "$archivo" "$nuevo_archivo"
        echo "El archivo '$archivo' ha sido renombrado como '$nuevo_archivo'"
      fi
    fi
  done

  # Llamar recursivamente a esta función para renombrar los archivos en las subcarpetas
  for carpeta in "$1"/*; do
    if [[ -d "$carpeta" ]]; then
      renombrar_archivos "$carpeta"
    fi
  done
}

# Comprobamos que se haya especificado una ruta como argumento
if [[ $# -ne 1 ]]; then
  echo "Debe especificar una ruta como argumento."
  exit 1
fi

# Comprobamos que la ruta especificada exista y sea un directorio
if [[ ! -d "$1" ]]; then
  echo "La ruta especificada no existe o no es un directorio."
  exit 1
fi

# Renombrar los archivos de tipo mp4, avi y mkv que contengan espacios en blanco
renombrar_archivos "$1"



#     ./renombrar_archivos.sh /home/usuario/documentos