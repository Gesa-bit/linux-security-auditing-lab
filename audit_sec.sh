#!/bin/bash
echo "=========================================="
echo "      REPORTE DE AUDITORÍA DE SEGURIDAD    "
echo "      Fecha: $(date)                      "
echo "=========================================="
echo ""
echo "[+] Espacio en Disco:"
df -h | grep '^/dev/'
echo ""
echo "[+] Puertos y Conexiones Activas:"
ss -tuln
echo ""
echo "[+] Usuarios Conectados Actualmente:"
who
echo ""
echo "[+] Intentos recientes de SUDO:"
journalctl _COMM=sudo -n 5 --no-pager
echo "=========================================="
