import 'package:flutter/material.dart';
import '/screens/app_localizations.dart';

class TutorialsScreen extends StatelessWidget {
  final String userLanguage;

  const TutorialsScreen({required this.userLanguage, super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations(userLanguage);

    final List<Map<String, dynamic>> tutorialItems = _getTutorialItems(
      userLanguage,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(_getTitle(userLanguage)),
        backgroundColor: Colors.green[700],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: tutorialItems
            .map(
              (item) => TutorialCard(
                icon: item['icon'] as IconData,
                title: item['title'] as String,
                description: item['desc'] as String,
              ),
            )
            .toList(),
      ),
    );
  }

  String _getTitle(String lang) {
    switch (lang) {
      case 'ay':
        return 'Apnaqañataki yatiyäwi';
      case 'qu':
        return 'Ruwanakuyta yachachiy';
      default:
        return 'Guía de uso';
    }
  }

  List<Map<String, dynamic>> _getTutorialItems(String lang) {
    switch (lang) {
      case 'ay':
        return [
          {
            'icon': Icons.language,
            'title': '1. Aru ajlliña',
            'desc':
                'Qalltkasa, ajlliñama: Castellano, Aymara jan ukax Quechua.',
          },
          {
            'icon': Icons.translate,
            'title': '2. T’aqaña',
            'desc': '“T’aqaña” chimpumankiwa qillqataxa t’aqatañataki.',
          },
          {
            'icon': Icons.mic,
            'title': '3. Arus qhananchaña',
            'desc': 'Mikrofononx clickañamawa aruta qhananchañataki.',
          },
          {
            'icon': Icons.menu_book,
            'title': '4. Qullirinaka yatiyäwi',
            'desc': 'Qullirinak uñakiptam: luräwi, jila, amuyt’äwinaka.',
          },
          {
            'icon': Icons.support_agent,
            'title': '5. Yanapt’äwi',
            'desc': 'Whatsapp ukan jiskt’asiñataki yanapt’ata.',
          },
          {
            'icon': Icons.lock,
            'title': '6. Jark’aqawi',
            'desc': 'Yaqha qullirinakarux amuyt’asa uñt’ayasiña.',
          },
        ];
      case 'qu':
        return [
          {
            'icon': Icons.language,
            'title': '1. Rimay akllay',
            'desc':
                'Aplicación qallarqaykipi, akllay: Español, Quechua uta Aymara.',
          },
          {
            'icon': Icons.translate,
            'title': '2. Tikray',
            'desc': '“Tikray” lapanpi rimayta qillqayta tikraykuy.',
          },
          {
            'icon': Icons.mic,
            'title': '3. Rimarinakuy',
            'desc': 'Micrófono ñit’iy rimayta rimarinakunapaq.',
          },
          {
            'icon': Icons.menu_book,
            'title': '4. Hampiq yachay',
            'desc': 'Hampikuna uñakuy: ima hina, hayk’aq, manallikuy.',
          },
          {
            'icon': Icons.support_agent,
            'title': '5. Yanapay',
            'desc': 'Whatsapp-manta yanapayaykita chaskiy.',
          },
          {
            'icon': Icons.lock,
            'title': '6. Allin uso',
            'desc': 'Appmanta ruwanakuyta yachay, hampiq rimanakuyqa ñawpaqmi.',
          },
        ];
      default: // Español
        return [
          {
            'icon': Icons.language,
            'title': '1. Selección de idioma',
            'desc': 'Al iniciar la app, selecciona Español, Quechua o Aymara.',
          },
          {
            'icon': Icons.translate,
            'title': '2. Uso del traductor',
            'desc':
                'En la pestaña "Traducir", escribe o habla y selecciona el idioma.',
          },
          {
            'icon': Icons.mic,
            'title': '3. Reconocimiento de voz',
            'desc': 'Presiona el micrófono para dictar una frase.',
          },
          {
            'icon': Icons.menu_book,
            'title': '4. Información de medicamentos',
            'desc': 'Consulta usos, dosis y advertencias de los medicamentos.',
          },
          {
            'icon': Icons.support_agent,
            'title': '5. Asistencia y soporte',
            'desc': 'Accede a ayuda personalizada desde la sección Asistencia.',
          },
          {
            'icon': Icons.lock,
            'title': '6. Uso seguro y ético',
            'desc': 'Consulta siempre con un farmacéutico. La app es de apoyo.',
          },
        ];
    }
  }
}

class TutorialCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const TutorialCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.green[800]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(description),
        ),
      ),
    );
  }
}
