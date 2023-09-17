#!/bin/bash

# Compilar el código fuente de Java
javac -cp .:lib/* src/*.java -d build

# Empaquetar la aplicación en un archivo JAR
jar -cf myapp.jar -C build/ .

# Mover el JAR a la ubicación deseada
mv myapp.jar /usr/share/
