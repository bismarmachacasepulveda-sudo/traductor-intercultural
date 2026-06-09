class AppLocalizations {
  final String languageCode;

  AppLocalizations(this.languageCode);

  // Textos generales de la aplicación
  String get appTitle {
    switch (languageCode) {
      case 'ay':
        return 'Qulliri Uta'; // Farmacia en aymara
      case 'qu':
        return 'Hampiq Wasì'; // Farmacia en quechua
      default:
        return 'Farmacia Intercultural';
    }
  }

  // Textos para LanguageSelectionScreen
  String get selectLanguageTitle {
    switch (languageCode) {
      case 'ay':
        return 'Aru ajllita'; // Selecciona tu idioma
      case 'qu':
        return 'Rimay akllay'; // Selecciona tu idioma
      default:
        return 'Selecciona tu idioma';
    }
  }

  // Textos para TranslationScreen
  String get translatorTitle {
    switch (languageCode) {
      case 'ay':
        return 'Aru t\'aqaña'; // Traductor
      case 'qu':
        return 'Tikraykachay'; // Traductor
      default:
        return 'Traductor Farmacéutico';
    }
  }

  String get inputHint {
    switch (languageCode) {
      case 'ay':
        return 'Qillqata chuymaña'; // Escribe o habla
      case 'qu':
        return 'Qillqay rimayta'; // Escribe o habla
      default:
        return 'Escribe o habla';
    }
  }

  String get translateButton {
    switch (languageCode) {
      case 'ay':
        return 'T\'aqaña'; // Traducir
      case 'qu':
        return 'Tikray'; // Traducir
      default:
        return 'Traducir';
    }
  }

  String get translationLabel {
    switch (languageCode) {
      case 'ay':
        return 'T\'aqata:'; // Traducción:
      case 'qu':
        return 'Tikrasqa:'; // Traducción:
      default:
        return 'Traducción:';
    }
  }

  // Textos para EducationScreen
  String get educationTitle {
    switch (languageCode) {
      case 'ay':
        return 'Yatichäwi'; // Educación
      case 'qu':
        return 'Yachachiy'; // Educación
      default:
        return 'Información de Medicamentos';
    }
  }

  String get searchMedicineHint {
    switch (languageCode) {
      case 'ay':
        return 'Qullirinaka thaqhawiña'; // Buscar medicamentos
      case 'qu':
        return 'Hampikunata maskay'; // Buscar medicamentos
      default:
        return 'Buscar medicamentos';
    }
  }

  String get usesLabel {
    switch (languageCode) {
      case 'ay':
        return 'Lurañanaka'; // Usos
      case 'qu':
        return 'Imapaq'; // Para qué sirve
      default:
        return 'Usos';
    }
  }

  String get doseLabel {
    switch (languageCode) {
      case 'ay':
        return 'Jila'; // Dosis
      case 'qu':
        return 'Hayñi'; // Dosis
      default:
        return 'Dosis';
    }
  }

  String get warningsLabel {
    switch (languageCode) {
      case 'ay':
        return 'Janiw lurañapakiti'; // Advertencias
      case 'qu':
        return 'Manallikuy'; // Precauciones
      default:
        return 'Advertencias';
    }
  }

  String get backToList {
    switch (languageCode) {
      case 'ay':
        return 'Qhipa mayjt\'ay'; // Volver a la lista
      case 'qu':
        return 'Listaman kutiy'; // Volver a la lista
      default:
        return 'Volver a la lista';
    }
  }

  // Textos para detalles de medicamentos
  String get medicineUsesTitle {
    switch (languageCode) {
      case 'ay':
        return 'Kawkiri luraña'; // Para qué se usa
      case 'qu':
        return 'Imapaqmi'; // Para qué es
      default:
        return 'Indicaciones';
    }
  }

  String get medicineDosageTitle {
    switch (languageCode) {
      case 'ay':
        return 'Kuna jila'; // Cuánto tomar
      case 'qu':
        return 'Hayk\'aqmi'; // Cuánto tomar
      default:
        return 'Posología';
    }
  }

  String get medicinePrecautionsTitle {
    switch (languageCode) {
      case 'ay':
        return 'Amtasiñanaka'; // Precauciones
      case 'qu':
        return 'Qhawaychana'; // Cuidados
      default:
        return 'Precauciones';
    }
  }

  // Textos genéricos
  String get searchHint {
    switch (languageCode) {
      case 'ay':
        return 'Thaqhawiña'; // Buscar
      case 'qu':
        return 'Maskay'; // Buscar
      default:
        return 'Buscar';
    }
  }

  String get noResultsFound {
    switch (languageCode) {
      case 'ay':
        return 'Janiw uñjkatiti'; // No se encontró
      case 'qu':
        return 'Manam tarikunchu'; // No se encontró
      default:
        return 'No se encontraron resultados';
    }
  }

  String get tabTranslate {
    switch (languageCode) {
      case 'ay':
        return 'Jaqukipaña'; // Ejemplo, ajusta a tu diccionario
      case 'qu':
        return 'Tijray'; // Ejemplo, ajusta a tu diccionario
      default:
        return 'Traducir';
    }
  }

  String get tabTutorials {
    switch (languageCode) {
      case 'ay':
        return 'Yatiqawi';
      case 'qu':
        return 'Yachachiy';
      default:
        return 'Tutoriales';
    }
  }

  String get tabAssistance {
    switch (languageCode) {
      case 'ay':
        return 'Yanapaña';
      case 'qu':
        return 'Yanapay';
      default:
        return 'Asistencia';
    }
  }

  String get tabEducation {
    switch (languageCode) {
      case 'ay':
        return 'Yatiqaña';
      case 'qu':
        return 'Yachay';
      default:
        return 'Educación';
    }
  }
}
