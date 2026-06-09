import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../services/translation_service.dart';
import '../screens/app_localizations.dart';

class TranslationScreen extends StatefulWidget {
  final String userLanguage;

  const TranslationScreen({required this.userLanguage, super.key});

  @override
  State<TranslationScreen> createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  late final AppLocalizations localizations;
  final TextEditingController _inputController = TextEditingController();
  String _translatedText = '';
  late stt.SpeechToText _speech;
  bool _isListening = false;

  @override
  void initState() {
    super.initState();
    localizations = AppLocalizations(widget.userLanguage);
    _speech = stt.SpeechToText();
  }

  void _translateText(String targetLang) {
    setState(() {
      String input = _inputController.text;
      _translatedText = TranslationService.translate(input, targetLang);
    });
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) => print('Status: $status'),
        onError: (error) => print('Error: $error'),
      );

      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (result) {
            setState(() {
              _inputController.text = result.recognizedWords;
            });
          },
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }

  @override
  void dispose() {
    _speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.translatorTitle),
        backgroundColor: Colors.green[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _inputController,
                    decoration: InputDecoration(
                      labelText: localizations.inputHint,
                      border: const OutlineInputBorder(),
                      hintText: _getExampleHint(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
                  color: _isListening ? Colors.red : Colors.green,
                  onPressed: _listen,
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Botones de traducción siempre activos
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTranslationButton('Español', 'es'),
                _buildTranslationButton('Aymara', 'ay'),
                _buildTranslationButton('Quechua', 'qu'),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              localizations.translationLabel,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Text(_translatedText, style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
      floatingActionButton: _isListening
          ? FloatingActionButton(
              onPressed: _listen,
              backgroundColor: Colors.red,
              child: const Icon(Icons.mic),
            )
          : null,
    );
  }

  String _getExampleHint() {
    switch (widget.userLanguage) {
      case 'ay':
        return 'Ej: Qampaq allin punchaw';
      case 'qu':
        return 'Ej: Aski uru churätam';
      default:
        return 'Ej: Que tenga buen día';
    }
  }

  Widget _buildTranslationButton(String language, String languageCode) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: _getButtonColor(languageCode),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      ),
      onPressed: () => _translateText(languageCode),
      child: Text(language, style: const TextStyle(color: Colors.white)),
    );
  }

  Color _getButtonColor(String languageCode) {
    switch (languageCode) {
      case 'es':
        return Colors.blue[700]!;
      case 'ay':
        return Colors.red[700]!;
      case 'qu':
        return Colors.orange[700]!;
      default:
        return Colors.grey;
    }
  }
}
