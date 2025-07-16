#!/bin/bash

DB_NAME="AWS_TEMP"
TABLE_DB="Temp_general"
DB_USER="root"
DB_PASS="p@ssw0rdTEwiwynn3095"
DB_HOST="32.0.1.55"
IP="172.17.254.25"
LOCATION="Bay_6"

# Credenciales
SSH_USER="te"
passwd="p@ssw0rd"

# Login MySQL
MYSQL_CMD="mysql -u${DB_USER} -p${DB_PASS} -h${DB_HOST} ${DB_NAME}"

# Función para obtener datos N9K
get_n9k_data() {
    local IP=$IP
    local LOCATION=$LOCATION

    #Funciones para N9K-C9336C-FX2
    SN=$(sshpass -p p@ssw0rd ssh te@${IP} 'show inventory' | grep -i sn | head -n 1 | awk '{print$8}')
    FRONT_TEMP=$(sshpass -p p@ssw0rd ssh te@${IP} 'sh env temp' | grep -i 'Front' | awk '{print$5}')
    BACK_TEMP=$(sshpass -p p@ssw0rd ssh te@${IP} 'sh env temp' | grep -i 'Back' | awk '{print$5}')
    CPU_TEMP=$(sshpass -p p@ssw0rd ssh te@${IP} 'sh env temp' | grep -i 'cpu' | awk '{print$5}')
    HEAVENLY_TEMP=$(sshpass -p p@ssw0rd ssh te@${IP} 'sh env temp' | grep -i 'Heavenly' | awk '{print$5}')

    [ -z "$SN" ] && SN=NULL || SN="${SN}"
    [ -z "$FRONT_TEMP" ] && FRONT_TEMP=NULL || FRONT_TEMP="${FRONT_TEMP}"
    [ -z "$BACK_TEMP" ] && BACK_TEMP=NULL || BACK_TEMP="${BACK_TEMP}"
    [ -z "$CPU_TEMP" ] && CPU_TEMP=NULL || CPU_TEMP="${CPU_TEMP}"
    [ -z "$HEAVENLY_TEMP" ] && HEAVENLY_TEMP=NULL || HEAVENLY_TEMP="${HEAVENLY_TEMP}"

    # Insertar datos en la base de datos modelo N9K-C9336C-FX2
    ${MYSQL_CMD} <<EOF
INSERT INTO ${TABLE_DB} (Location, SN, S1, S2, S3, S4, created_at, MODEL, ping)
VALUES ('${LOCATION}', '${SN}', '${FRONT_TEMP}', '${BACK_TEMP}', '${CPU_TEMP}', '${HEAVENLY_TEMP}', NOW(), 'N9K_C9336C_FX2', 'Online');
EOF
}

get_fae_temp() {

    SN=$(sshpass -p p@ssw0rd ssh te@172.34.185.254 'show inventory' | grep -i sn | head -n 1 | awk '{print$8}')
    S1=$(sshpass -p p@ssw0rd ssh te@172.34.185.254 'sh env temp' | grep -i left | head -n 1 | awk '{print$6}')
    S2=$(sshpass -p p@ssw0rd ssh te@172.34.185.254 'sh env temp' | grep -i back | awk '{print$6}')
    S3=$(sshpass -p p@ssw0rd ssh te@172.34.185.254 'sh env temp' | grep -i asic | awk '{print$5}')
    S4=$(sshpass -p p@ssw0rd ssh te@172.34.185.254 'sh env temp' | grep -i middle | awk '{print$5}')

    ${MYSQL_CMD} <<EOF
INSERT INTO ${TABLE_DB} (Location, SN, S1, S2, S3, S4, created_at, MODEL, ping) 
VALUES ('BAY21_FAE', '${SN}', '${S1}', '${S2}', '${S3}', '${S4}', NOW(), 'N3K-C3132Q-40GX', 'Online');
EOF
}


get_n9k_data
get_fae_temp
