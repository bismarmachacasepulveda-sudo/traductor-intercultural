import 'package:flutter/material.dart';
import 'package:traductor/screens/home_screen.dart';
import 'translation_screen.dart';
import '../screens/app_localizations.dart';
import '../screens/tutorials_screen.dart';
import '../screens/assistance_screen.dart';
import '../screens/education_screen.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations('es');

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.selectLanguageTitle),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildLanguageButton(context, 'Español', 'es'),
            _buildLanguageButton(context, 'Aymara', 'ay'),
            _buildLanguageButton(context, 'Quechua', 'qu'),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageButton(
    BuildContext context,
    String language,
    String code,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green[400],
          minimumSize: const Size(double.infinity, 60),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(userLanguage: code),
            ),
          );
        },
        child: Text(language, style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
