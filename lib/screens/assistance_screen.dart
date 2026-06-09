import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AssistanceScreen extends StatelessWidget {
  final String userLanguage;

  const AssistanceScreen({required this.userLanguage, super.key});

  final String whatsappUrl =
      'https://wa.me/message/2SKTJSH7QZDAK1'; // de prueba

  void _openWhatsApp() async {
    final Uri uri = Uri.parse(whatsappUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'No se pudo abrir el enlace de WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, String> texts = _getTexts(userLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(texts['title']!),
        backgroundColor: Colors.green[700],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.support_agent, size: 100, color: Colors.green),
              const SizedBox(height: 20),
              Text(
                texts['heading']!,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                texts['description']!,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                onPressed: _openWhatsApp,
                icon: const Icon(Icons.chat, color: Colors.white),
                label: Text(
                  texts['button']!,
                  style: const TextStyle(fontSize: 18, color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[800],
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Map<String, String> _getTexts(String lang) {
    switch (lang) {
      case 'ay':
        return {
          'title': 'Yanapt’awi',
          'heading': 'Yanaptʼam munta?',
          'description':
              'Aplicación apnaqañanx amuytʼawinïta ukhaxa, WhatsApp ukar yanaptʼataki qillqtʼam.',
          'button': 'Yanaptʼa qillqtʼam',
        };
      case 'qu':
        return {
          'title': 'Yanapay',
          'heading': '¿Yanapaykiqa munanki?',
          'description':
              'App ruwanaykipi mayqen chʼama kaptinqa, Whatsapppi yanapaykuy.',
          'button': 'Whatsapppi qillqay',
        };
      default:
        return {
          'title': 'Asistencia Personalizada',
          'heading': '¿Necesitas ayuda?',
          'description':
              'Si tienes dudas o problemas con la aplicación, puedes contactarte con nuestro equipo de soporte.',
          'button': 'Contáctanos',
        };
    }
  }
}
