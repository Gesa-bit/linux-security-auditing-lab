# 🛡️ Linux Security Administration & Hardening Lab

Este repositorio documenta la implementación de buenas prácticas de administración y seguridad en sistemas Linux (Ubuntu), aplicando el **principio de mínimo privilegio**, auditoría de eventos del sistema y automatización de reportes operativos.

---

## 📌 Objetivos del Laboratorio

- **Control de Acceso e Identidades:** Segmentación de usuarios y grupos para restringir el acceso a directorios sensibles.
- **Hardening de Permisos:** Configuración estricta de permisos POSIX (`chmod 600` / `chown`) para evitar exposición de credenciales y archivos críticos.
- **Análisis de Logs:** Inspección y filtrado de eventos de sistema y autenticación (`journalctl`, `/var/log/syslog`) para detección de anomalías.
- **Automatización de Auditoría:** Script en Bash para recopilación rápida de métricas de red, almacenamiento y sesiones activas.

---

## 🛠️ Implementación Técnica

### 1. Gestión de Permisos y Archivos Sensibles
Se configuró un grupo de seguridad (`sec_auditors`) y un usuario sin privilegios root (`analista_soc`), restringiendo la lectura y escritura de archivos sensibles exclusivamente al propietario:

```bash
# Creación de grupo y usuario de auditoría
sudo groupadd sec_auditors
sudo useradd -m -s /bin/bash -g sec_auditors analista_soc

# Restricción de permisos sobre archivo de configuración
sudo chmod 600 confidencial/claves_api.txt
sudo chown analista_soc:sec_auditors confidencial/claves_api.txt
```
### 2. Script de Auditoría Automatizada (`audit_sec.sh`)
Script desarrollado para ejecutar revisiones periódicas de estado en el servidor:
```bash
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
```
---

## 🔍 Habilidades Clave Demostradas

- **Administración de usuarios y grupos:** Control de acceso mediante el principio de mínimo privilegio.
- **Hardening de archivos:** Permisos restrictivos (`chmod 600`) para proteger credenciales.
- **Diagnóstico y Redes:** Inspección de sockets y puertos abiertos con `ss`.
- **Automatización en Bash:** Scripts orientados a monitoreo y soporte técnico N1/SOC.
