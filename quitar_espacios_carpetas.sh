#!/bin/bash

# Función para renombrar carpetas
function renombrar_carpetas {
  for carpeta in "$1"/*; do
    if [[ -d "$carpeta" ]]; then
      # Renombrar la carpeta cambiando los espacios por guiones bajos
      nueva_carpeta=${carpeta// /_}
      if [[ "$carpeta" != "$nueva_carpeta" ]]; then
        mv "$carpeta" "$nueva_carpeta"
        echo "La carpeta '$carpeta' ha sido renombrada como '$nueva_carpeta'"
      fi
      # Llamar recursivamente a esta función para renombrar las subcarpetas
      renombrar_carpetas "$nueva_carpeta"
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

# Renombrar las carpetas y subcarpetas que contengan espacios en blanco cambiándolos por guiones bajos
renombrar_carpetas "$1"



#     ./renombrar_carpetas.sh /home/usuario/documentos