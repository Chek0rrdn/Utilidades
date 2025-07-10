import os
import argparse

def renombrar_archivos_recursivo(folder, patron):
    # Recorrer todos los directorios y subdirectorios
    for root, dirs, files in os.walk(folder):
        for filename in files:
            # Eliminar el patrón del nombre del archivo
            new_filename = filename.replace(patron, "")

            # Reemplazar los espacios en blanco por guiones bajos
            new_filename = new_filename.replace(" ", "_")

            old_filepath = os.path.join(root, filename)
            new_filepath = os.path.join(root, new_filename)

            # Renombrar el archivo si el nombre ha cambiado
            if old_filepath != new_filepath:
                os.rename(old_filepath, new_filepath)
                print(f'Renombrado: {old_filepath} -> {new_filepath}')

    print("Proceso de renombrado recursivo completado.")

if __name__ == "__main__":
    # Crear un parser de argumentos
    parser = argparse.ArgumentParser(description="Renombra archivos eliminando un patrón del nombre y reemplazando espacios por guiones bajos de manera recursiva.")

    # Argumento para la carpeta
    parser.add_argument("folder", type=str, help="Ruta de la carpeta que contiene los archivos.")

    # Argumento para el patrón a eliminar
    parser.add_argument("patron", type=str, help="Patrón de texto que se desea eliminar del nombre de los archivos.")

    # Parsear los argumentos
    args = parser.parse_args()

    # Llamar a la función con los argumentos proporcionados
    renombrar_archivos_recursivo(args.folder, args.patron)
