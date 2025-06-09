import mysql.connector
import subprocess
import datetime
from mysql.connector import Error

# Configuración de base de datos
DB_CONFIG = {
    'host': 'localhost',
    'database': 'tu_base_datos',
    'user': 'tu_usuario',
    'password': 'tu_password'
}

# Función para verificar conexión SSH y actualizar estado
def revisar_switch(dispositivo):
    id_dispositivo, nombre, ip = dispositivo
    print(f"Revisando {nombre} ({ip})...")

    try:
        # Intentar conexión SSH silenciosa
        resultado = subprocess.run(
            ["ssh", "-o", "BatchMode=yes", "-o", "ConnectTimeout=5", f"admin@{ip}", "exit"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL
        )

        if resultado.returncode == 0:
            print(f"✔️ Conexión exitosa a {ip}, actualizando estado.")
            actualizar_estado(id_dispositivo, 1)
            
        else:
            print(f"⚠️ No se pudo conectar a {ip}.")
    except Exception as e:
        print(f"❌ Error al revisar {ip}: {e}")

# Función para actualizar estado en la base de datos
def actualizar_estado(id_dispositivo, nuevo_estado):
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()
        now = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')

        query = "UPDATE Dispositivos SET Estado = %s, Ultima_Revision = %s WHERE Id = %s"
        cursor.execute(query, (nuevo_estado, now, id_dispositivo))
        conn.commit()

    except Error as e:
        print(f"Error al actualizar la base de datos: {e}")
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

# Función principal
def main():
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        cursor.execute("SELECT Id, Nombre, Ip FROM Dispositivos WHERE Estado = 0")
        dispositivos = cursor.fetchall()

        print(f"Se encontraron {len(dispositivos)} dispositivos por revisar.\n")

        for dispositivo in dispositivos:
            revisar_switch(dispositivo)

    except Error as e:
        print(f"Error al conectar con la base de datos: {e}")
    finally:
        if conn.is_connected():
            cursor.close()
            conn.close()

if __name__ == "__main__":
    main()
