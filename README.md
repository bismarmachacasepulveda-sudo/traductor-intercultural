# 🌿 AyniMed - Traductor Farmacéutico Intercultural

![Framework: Flutter](https://img.shields.io/badge/Framework-Flutter-blue)
![Lenguaje: Dart](https://img.shields.io/badge/Lenguaje-Dart-blue)
![Plataforma: Android](https://img.shields.io/badge/Plataforma-Android-green)
![Estado: MVP Funcional](https://img.shields.io/badge/Estado-MVP_Funcional_Offline-success)

**AyniMed** es una aplicación móvil nativa diseñada para romper las barreras lingüísticas en la dispensación de medicamentos y atención clínica en comunidades de La Paz y el occidente de Bolivia. Permite la comunicación fluida, técnica y culturalmente respetuosa entre profesionales de la salud hispanohablantes y pacientes cuya lengua materna es el **Quechua** o el **Aymara**.

La aplicación garantiza operatividad offline, adaptándose a entornos rurales u hospitalarios con nulo acceso a internet o areas rurales.

---

## ✨ Funcionalidades Principales

* 🌐 **Internacionalización (i18n) Dinámica:** La interfaz de usuario (UI), los tutoriales y las guías de uso se traducen al Español, Quechua y Aymara mediante un gestor de estado.
* 🏥 **Vademécum Farmacéutico Offline:** Base de datos local integrada con **71 medicamentos esenciales**. Incluye información detallada sobre usos, dosificación y advertencias (ej. interacciones en embarazo o consumo con alimentos).
* 🗣️ **Motor de Traducción Bidireccional:** Sistema de traducción clínica validada por documentación farmacéutica. Incorpora un banco de datos estático enfocado en síntomas, posología y frases de laboratorio clínico.
* 🎙️ **Reconocimiento de Voz (Speech-to-Text):** Captura de entrada por dictado para agilizar la atención en mostrador.
* 🔍 **Búsqueda Normalizada:** Algoritmo de búsqueda insensible a mayúsculas y signos diacríticos (tildes), mejorando la tolerancia a errores de escritura del usuario.
* 💬 **Asistencia y Soporte Remoto:** Integración de *Deep Linking* (`url_launcher`) para derivar consultas complejas directamente a un canal de WhatsApp de soporte técnico/clínico.

---

## 🛠️ Stack Tecnológico

* **Frontend & Lógica:** Flutter, Dart.
* **Arquitectura de Datos:** Estructuras de datos locales (Mapas/Listas estáticas) para garantizar el funcionamiento sin consumo de datos móviles (Offline First).
* **Dependencias Clave:** `speech_to_text` (Microfonía), `url_launcher` (Deep links).
* **Despliegue:** Android (APK).

---

## 📸 Interfaz de Usuario (UI)

| 🌍 Selección de Idioma | 🎙️ Traductor Interactivo | 💊 Vademécum (Lista) |
| :---: | :---: | :---: |
| ![Selección](docs/screenshots/SeleccionIdioma.png) | ![Traductor](docs/screenshots/Traductor.png) | ![Lista Medicamentos](docs/screenshots/ListaMedicamentos.png) |
| **Detalles (Español)** | **Detalles (Traducción Quechua)** | **Guía de Uso (Español)** |
| ![Detalles ES](docs/screenshots/DetallesMedicamentos.png) | ![Detalles QU](docs/screenshots/DetallesMedicamentosQuechua.png) | ![Guía ES](docs/screenshots/GuiaUso.png) |
| **Guía de Uso (Traducción Aymara)** | **Asistencia Remota** | |
| ![Guía AY](docs/screenshots/GuiaUsoAymara.png) | ![Asistencia](docs/screenshots/Asistencia.png) | |
---

## 📦 Instalación y Despliegue

### Opción 1: Probar la Aplicación (Usuario Final)
1. Ve a la carpeta `apk/` en este repositorio.
2. Descarga el archivo `AyniMed.apk`.
3. Cópialo a tu dispositivo Android, otorga permisos de instalación desde fuentes desconocidas y ejecuta la aplicación. No requiere conexión a internet posterior.

### Opción 2: Compilar desde el Código Fuente (Desarrolladores)
Asegúrate de tener instalado el SDK de Flutter. Clona este repositorio y ejecuta los siguientes comandos en la raíz del proyecto:

```bash
# 1. Obtener dependencias
flutter pub get

# 2. Conectar un dispositivo físico o emulador Android y ejecutar
flutter run

# 3. Para compilar un nuevo APK de producción
flutter build apk --release
```
---

📄 Documentación de Respaldo
El banco de datos lingüístico utilizado en el código base fue extraído y validado a partir de documentación académica de Farmacia Clínica. Puedes consultar el archivo fuente en la carpeta docs/Banco_Palabras_AyniMed.pdf.
---

