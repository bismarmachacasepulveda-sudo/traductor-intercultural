import 'package:flutter/material.dart';
import '../../../screens/translation_screen.dart';
import 'tutorials_screen.dart';
import 'assistance_screen.dart';
import 'education_screen.dart';
import '../screens/app_localizations.dart'; // 1. Agregamos tu import de traducciones

class HomeScreen extends StatefulWidget {
  final String userLanguage;

  const HomeScreen({required this.userLanguage, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late final List<Widget> _screens;
  late final AppLocalizations localizations; // 2. Declaramos la instancia

  @override
  void initState() {
    super.initState();
    localizations = AppLocalizations(
      widget.userLanguage,
    ); // 3. Inicializamos con el idioma
    _screens = [
      TranslationScreen(userLanguage: widget.userLanguage),
      TutorialsScreen(userLanguage: widget.userLanguage),
      AssistanceScreen(userLanguage: widget.userLanguage),
      EducationScreen(userLanguage: widget.userLanguage),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        type: BottomNavigationBarType
            .fixed, // Mantiene el menú estable con 4+ items
        items: [
          // 4. Quitamos el 'const' porque ahora usamos variables dinámicas
          BottomNavigationBarItem(
            icon: const Icon(Icons.translate),
            label: localizations.tabTranslate, // Texto dinámico
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.help_outline),
            label: localizations.tabTutorials, // Texto dinámico
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.support_agent),
            label: localizations.tabAssistance, // Texto dinámico
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.menu_book),
            label: localizations.tabEducation, // Texto dinámico
          ),
        ],
      ),
    );
  }
}
