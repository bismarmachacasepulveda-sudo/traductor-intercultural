import 'package:flutter/material.dart';
import 'screens/language_selection_screen.dart';
import 'screens/app_localizations.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Farmacia Intercultural',
      theme: ThemeData(primarySwatch: Colors.green, useMaterial3: true),
      home: const LanguageSelectionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
