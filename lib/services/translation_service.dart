String removeDiacritics(String str) {
  const withDiacritics = 'áéíóúüñÁÉÍÓÚÜÑ';
  const withoutDiacritics = 'aeiouunAEIOUUN';

  for (int i = 0; i < withDiacritics.length; i++) {
    str = str.replaceAll(withDiacritics[i], withoutDiacritics[i]);
  }
  return str;
}

class TranslationService {
  // Diccionario bidireccional mejorado
  static final List<Map<String, String>> _dictionary = [
    {'es': 'uno', 'ay': 'maya', 'qu': 'huk'},
    {'es': 'dos', 'ay': 'paya', 'qu': 'iskay'},
    {'es': 'tres', 'ay': 'kimsa', 'qu': 'kimsa'},
    {'es': 'cuatro', 'ay': 'pusi', 'qu': 'tawa'},
    {'es': 'cinco', 'ay': 'phesqa', 'qu': 'pisqa'},
    {'es': 'seis', 'ay': 'sojjta', 'qu': 'suqta'},
    {'es': 'siete', 'ay': 'pakallko', 'qu': 'qanchis'},
    {'es': 'ocho', 'ay': 'kimsa sojjta', 'qu': 'pusaq'},
    {'es': 'nueve', 'ay': 'llaqtunka', 'qu': 'isqun'},
    {'es': 'diez', 'ay': 'tunka', 'qu': 'chunka'},
    {'es': 'once', 'ay': 'tunka mayani', 'qu': 'chunka hukniyoq'},
    {'es': 'doce', 'ay': 'tunka payani', 'qu': 'chunka iskayniyoq'},
    {'es': 'trece', 'ay': 'tunka kimsani', 'qu': 'chunka kimsaniyoq'},
    {'es': 'catorce', 'ay': 'tunka pusini', 'qu': 'chunka tawaniyoq'},
    {'es': 'quince', 'ay': 'tunka phesqani', 'qu': 'chunka pisqaniyoq'},
    {'es': 'dieciséis', 'ay': 'tunka sojjtani', 'qu': 'chunka suqtaniyoq'},
    {'es': 'diecisiete', 'ay': 'tunka pakallkoni', 'qu': 'chunka qanchisniyoq'},
    {
      'es': 'dieciocho',
      'ay': 'tunka kimsa sojjtani',
      'qu': 'chunka pusaqniyoq',
    },
    {'es': 'diecinueve', 'ay': 'tunka llaqtunkani', 'qu': 'chunka isqunniyoq'},
    {'es': 'veinte', 'ay': 'paya tunka', 'qu': 'iskay chunka'},
    {
      'es': 'veintiuno',
      'ay': 'paya tunka mayani',
      'qu': 'iskay chunka hukniyoq',
    },
    {
      'es': 'veintidós',
      'ay': 'paya tunka payani',
      'qu': 'iskay chunka iskayniyoq',
    },
    {
      'es': 'veintitrés',
      'ay': 'paya tunka kimsani',
      'qu': 'iskay chunka kimsaniyoq',
    },
    {
      'es': 'veinticuatro',
      'ay': 'paya tunka pusini',
      'qu': 'iskay chunka tawaniyoq',
    },
    {
      'es': 'veinticinco',
      'ay': 'paya tunka phesqani',
      'qu': 'iskay chunka pisqaniyoq',
    },
    {
      'es': 'veintiséis',
      'ay': 'paya tunka sojjtani',
      'qu': 'iskay chunka suqtaniyoq',
    },
    {
      'es': 'veintisiete',
      'ay': 'paya tunka pakallkoni',
      'qu': 'iskay chunka qanchisniyoq',
    },
    {
      'es': 'veintiocho',
      'ay': 'paya tunka kimsa sojjtani',
      'qu': 'iskay chunka pusaqniyoq',
    },
    {
      'es': 'veintinueve',
      'ay': 'paya tunka llaqtunkani',
      'qu': 'iskay chunka isqunniyoq',
    },
    {'es': 'treinta', 'ay': 'kimsa tunka', 'qu': 'kimsa chunka'},
    {
      'es': 'treinta y uno',
      'ay': 'kimsa tunka mayani',
      'qu': 'kimsa chunka hukniyoq',
    },
    {
      'es': 'treinta y dos',
      'ay': 'kimsa tunka payani',
      'qu': 'kimsa chunka iskayniyoq',
    },
    {
      'es': 'treinta y tres',
      'ay': 'kimsa tunka kimsani',
      'qu': 'kimsa chunka kimsaniyoq',
    },
    {
      'es': 'treinta y cuatro',
      'ay': 'kimsa tunka pusini',
      'qu': 'kimsa chunka tawaniyoq',
    },
    {
      'es': 'treinta y cinco',
      'ay': 'kimsa tunka phesqani',
      'qu': 'kimsa chunka pisqaniyoq',
    },
    {
      'es': 'treinta y seis',
      'ay': 'kimsa tunka sojjtani',
      'qu': 'kimsa chunka suqtaniyoq',
    },
    {
      'es': 'treinta y siete',
      'ay': 'kimsa tunka pakallkoni',
      'qu': 'kimsa chunka qanchisniyoq',
    },
    {
      'es': 'treinta y ocho',
      'ay': 'kimsa tunka kimsa sojjtani',
      'qu': 'kimsa chunka pusaqniyoq',
    },
    {
      'es': 'treinta y nueve',
      'ay': 'kimsa tunka llaqtunkani',
      'qu': 'kimsa chunka isqunniyoq',
    },
    {'es': 'cuarenta', 'ay': 'pusi tunka', 'qu': 'tawa chunka'},
    {
      'es': 'cuarenta y uno',
      'ay': 'pusi tunka mayani',
      'qu': 'tawa chunka hukniyoq',
    },
    {
      'es': 'cuarenta y dos',
      'ay': 'pusi tunka payani',
      'qu': 'tawa chunka iskayniyoq',
    },
    {
      'es': 'cuarenta y tres',
      'ay': 'pusi tunka kimsani',
      'qu': 'tawa chunka kimsaniyoq',
    },
    {
      'es': 'cuarenta y cuatro',
      'ay': 'pusi tunka pusini',
      'qu': 'tawa chunka tawaniyoq',
    },
    {
      'es': 'cuarenta y cinco',
      'ay': 'pusi tunka phesqani',
      'qu': 'tawa chunka pisqaniyoq',
    },
    {
      'es': 'cuarenta y seis',
      'ay': 'pusi tunka sojjtani',
      'qu': 'tawa chunka suqtaniyoq',
    },
    {
      'es': 'cuarenta y siete',
      'ay': 'pusi tunka pakallkoni',
      'qu': 'tawa chunka qanchisniyoq',
    },
    {
      'es': 'cuarenta y ocho',
      'ay': 'pusi tunka kimsa sojjtani',
      'qu': 'tawa chunka pusaqniyoq',
    },
    {
      'es': 'cuarenta y nueve',
      'ay': 'pusi tunka llaqtunkani',
      'qu': 'tawa chunka isqunniyoq',
    },
    {'es': 'cincuenta', 'ay': 'phesqa tunka', 'qu': 'pisqa chunka'},
    {
      'es': 'cincuenta y uno',
      'ay': 'phesqa tunka mayani',
      'qu': 'pisqa chunka hukniyoq',
    },
    {
      'es': 'cincuenta y dos',
      'ay': 'phesqa tunka payani',
      'qu': 'pisqa chunka iskayniyoq',
    },
    {
      'es': 'cincuenta y tres',
      'ay': 'phesqa tunka kimsani',
      'qu': 'pisqa chunka kimsaniyoq',
    },
    {
      'es': 'cincuenta y cuatro',
      'ay': 'phesqa tunka pusini',
      'qu': 'pisqa chunka tawaniyoq',
    },
    {
      'es': 'cincuenta y cinco',
      'ay': 'phesqa tunka phesqani',
      'qu': 'pisqa chunka pisqaniyoq',
    },
    {
      'es': 'cincuenta y seis',
      'ay': 'phesqa tunka sojjtani',
      'qu': 'pisqa chunka suqtaniyoq',
    },
    {
      'es': 'cincuenta y siete',
      'ay': 'phesqa tunka pakallkoni',
      'qu': 'pisqa chunka qanchisniyoq',
    },
    {
      'es': 'cincuenta y ocho',
      'ay': 'phesqa tunka kimsa sojjtani',
      'qu': 'pisqa chunka pusaqniyoq',
    },
    {
      'es': 'cincuenta y nueve',
      'ay': 'phesqa tunka llaqtunkani',
      'qu': 'pisqa chunka isqunniyoq',
    },
    {'es': 'sesenta', 'ay': 'sojjta tunka', 'qu': 'suqta chunka'},
    {
      'es': 'sesenta y uno',
      'ay': 'sojjta tunka mayani',
      'qu': 'suqta chunka hukniyoq',
    },
    {
      'es': 'sesenta y dos',
      'ay': 'sojjta tunka payani',
      'qu': 'suqta chunka iskayniyoq',
    },
    {
      'es': 'sesenta y tres',
      'ay': 'sojjta tunka kimsani',
      'qu': 'suqta chunka kimsaniyoq',
    },
    {
      'es': 'sesenta y cuatro',
      'ay': 'sojjta tunka pusini',
      'qu': 'suqta chunka tawaniyoq',
    },
    {
      'es': 'sesenta y cinco',
      'ay': 'sojjta tunka phesqani',
      'qu': 'suqta chunka pisqaniyoq',
    },
    {
      'es': 'sesenta y seis',
      'ay': 'sojjta tunka sojjtani',
      'qu': 'suqta chunka suqtaniyoq',
    },
    {
      'es': 'sesenta y siete',
      'ay': 'sojjta tunka pakallkoni',
      'qu': 'suqta chunka qanchisniyoq',
    },
    {
      'es': 'sesenta y ocho',
      'ay': 'sojjta tunka kimsa sojjtani',
      'qu': 'suqta chunka pusaqniyoq',
    },
    {
      'es': 'sesenta y nueve',
      'ay': 'sojjta tunka llaqtunkani',
      'qu': 'suqta chunka isqunniyoq',
    },
    {'es': 'setenta', 'ay': 'pakallko tunka', 'qu': 'qanchis chunka'},
    {
      'es': 'setenta y uno',
      'ay': 'pakallko tunka mayani',
      'qu': 'qanchis chunka hukniyoq',
    },
    {
      'es': 'setenta y dos',
      'ay': 'pakallko tunka payani',
      'qu': 'qanchis chunka iskayniyoq',
    },
    {
      'es': 'setenta y tres',
      'ay': 'pakallko tunka kimsani',
      'qu': 'qanchis chunka kimsaniyoq',
    },
    {
      'es': 'setenta y cuatro',
      'ay': 'pakallko tunka pusini',
      'qu': 'qanchis chunka tawaniyoq',
    },
    {
      'es': 'setenta y cinco',
      'ay': 'pakallko tunka phesqani',
      'qu': 'qanchis chunka pisqaniyoq',
    },
    {
      'es': 'setenta y seis',
      'ay': 'pakallko tunka sojjtani',
      'qu': 'qanchis chunka suqtaniyoq',
    },
    {
      'es': 'setenta y siete',
      'ay': 'pakallko tunka pakallkoni',
      'qu': 'qanchis chunka qanchisniyoq',
    },
    {
      'es': 'setenta y ocho',
      'ay': 'pakallko tunka kimsa sojjtani',
      'qu': 'qanchis chunka pusaqniyoq',
    },
    {
      'es': 'setenta y nueve',
      'ay': 'pakallko tunka llaqtunkani',
      'qu': 'qanchis chunka isqunniyoq',
    },
    {'es': 'ochenta', 'ay': 'kimsa sojjta tunka', 'qu': 'pusaq chunka'},
    {
      'es': 'ochenta y uno',
      'ay': 'kimsa sojjta tunka mayani',
      'qu': 'pusaq chunka hukniyoq',
    },
    {
      'es': 'ochenta y dos',
      'ay': 'kimsa sojjta tunka payani',
      'qu': 'pusaq chunka iskayniyoq',
    },
    {
      'es': 'ochenta y tres',
      'ay': 'kimsa sojjta tunka kimsani',
      'qu': 'pusaq chunka kimsaniyoq',
    },
    {
      'es': 'ochenta y cuatro',
      'ay': 'kimsa sojjta tunka pusini',
      'qu': 'pusaq chunka tawaniyoq',
    },
    {
      'es': 'ochenta y cinco',
      'ay': 'kimsa sojjta tunka phesqani',
      'qu': 'pusaq chunka pisqaniyoq',
    },
    {
      'es': 'ochenta y seis',
      'ay': 'kimsa sojjta tunka sojjtani',
      'qu': 'pusaq chunka suqtaniyoq',
    },
    {
      'es': 'ochenta y siete',
      'ay': 'kimsa sojjta tunka pakallkoni',
      'qu': 'pusaq chunka qanchisniyoq',
    },
    {
      'es': 'ochenta y ocho',
      'ay': 'kimsa sojjta tunka kimsa sojjtani',
      'qu': 'pusaq chunka pusaqniyoq',
    },
    {
      'es': 'ochenta y nueve',
      'ay': 'kimsa sojjta tunka llaqtunkani',
      'qu': 'pusaq chunka isqunniyoq',
    },
    {'es': 'noventa', 'ay': 'llaqtunka tunka', 'qu': 'isqun chunka'},
    {
      'es': 'noventa y uno',
      'ay': 'llaqtunka tunka mayani',
      'qu': 'isqun chunka hukniyoq',
    },
    {
      'es': 'noventa y dos',
      'ay': 'llaqtunka tunka payani',
      'qu': 'isqun chunka iskayniyoq',
    },
    {
      'es': 'noventa y tres',
      'ay': 'llaqtunka tunka kimsani',
      'qu': 'isqun chunka kimsaniyoq',
    },
    {
      'es': 'noventa y cuatro',
      'ay': 'llaqtunka tunka pusini',
      'qu': 'isqun chunka tawaniyoq',
    },
    {
      'es': 'noventa y cinco',
      'ay': 'llaqtunka tunka phesqani',
      'qu': 'isqun chunka pisqaniyoq',
    },
    {
      'es': 'noventa y seis',
      'ay': 'llaqtunka tunka sojjtani',
      'qu': 'isqun chunka suqtaniyoq',
    },
    {
      'es': 'noventa y siete',
      'ay': 'llaqtunka tunka pakallkoni',
      'qu': 'isqun chunka qanchisniyoq',
    },
    {
      'es': 'noventa y ocho',
      'ay': 'llaqtunka tunka kimsa sojjtani',
      'qu': 'isqun chunka pusaqniyoq',
    },
    {
      'es': 'noventa y nueve',
      'ay': 'llaqtunka tunka llaqtunkani',
      'qu': 'isqun chunka isqunniyoq',
    },
    {'es': 'cien', 'ay': 'pataka', 'qu': 'pachak'},
    {'es': 'blanco', 'ay': 'jani', 'qu': 'yuraq'},
    {'es': 'negro', 'ay': 'ch\'iyara', 'qu': 'yana'},
    {'es': 'rojo', 'ay': 'wila', 'qu': 'puka'},
    {'es': 'amarillo', 'ay': 'q\'illu', 'qu': 'q\'illu'},
    {'es': 'azul', 'ay': 'larama', 'qu': 'anqas'},
    {'es': 'verde', 'ay': 'ch\'uxña', 'qu': 'q\'umir'},
    {'es': 'marrón', 'ay': 'ch\'iyara ch\'uxña', 'qu': 'chumpi'},
    {'es': 'gris', 'ay': 'ch\'iyara jani', 'qu': 'raqra'},
    {'es': 'naranja', 'ay': 'wila q\'illu', 'qu': 'puka q\'illu'},
    {'es': 'rosado', 'ay': 'wila jani', 'qu': 'yuraq puka'},
    {'es': 'lunes', 'ay': 'lunes', 'qu': 'lunes'},
    {'es': 'martes', 'ay': 'martes', 'qu': 'martes'},
    {'es': 'miércoles', 'ay': 'mierkulesa', 'qu': 'miércoles'},
    {'es': 'jueves', 'ay': 'juwesa', 'qu': 'jueves'},
    {'es': 'viernes', 'ay': 'wiernisa', 'qu': 'viernes'},
    {'es': 'sábado', 'ay': 'sabadu', 'qu': 'k’uychichaw'},
    {'es': 'domingo', 'ay': 'tuminkura', 'qu': 'inti p’unchay'},
    {'es': 'enero', 'ay': 'janiru', 'qu': 'eñiru'},
    {'es': 'febrero', 'ay': 'phiwru', 'qu': 'fibriru'},
    {'es': 'marzo', 'ay': 'marzu', 'qu': 'marsu'},
    {'es': 'abril', 'ay': 'abril', 'qu': 'abril'},
    {'es': 'mayo', 'ay': 'mayu', 'qu': 'mayu'},
    {'es': 'junio', 'ay': 'junyu', 'qu': 'huniu'},
    {'es': 'julio', 'ay': 'juliyu', 'qu': 'huliyu'},
    {'es': 'agosto', 'ay': 'agustu', 'qu': 'agustu'},
    {'es': 'septiembre', 'ay': 'sitimri', 'qu': 'sitimri'},
    {'es': 'octubre', 'ay': 'uktuwri', 'qu': 'uktubri'},
    {'es': 'noviembre', 'ay': 'nuwimri', 'qu': 'nuwimbri'},
    {'es': 'diciembre', 'ay': 'disiwri', 'qu': 'disiembri'},
    {'es': 'madre', 'ay': 'tayka', 'qu': 'mama'},
    {'es': 'padre', 'ay': 'awki', 'qu': 'tayta'},
    {'es': 'hijo', 'ay': 'yuqa', 'qu': 'churi'},
    {'es': 'hija', 'ay': 'usiña', 'qu': 'ususi'},
    {'es': 'hermano', 'ay': 'jila', 'qu': 'wawqi'},
    {'es': 'hermana', 'ay': 'lala', 'qu': 'tura'},
    {'es': 'hermana', 'ay': 'panqara', 'qu': 'ñaña'},
    {'es': 'abuelo', 'ay': 'awicha', 'qu': 'hatun tayta'},
    {'es': 'abuela', 'ay': 'awichu', 'qu': 'hatun mama'},
    {'es': 'nieto', 'ay': 'allchhi', 'qu': 'willka'},
    {'es': 'nieta', 'ay': 'allchhi', 'qu': 'willka'},
    {'es': 'esposo', 'ay': 'chacha', 'qu': 'qhari'},
    {'es': 'esposa', 'ay': 'warmi', 'qu': 'warmi'},
    {'es': 'cabeza', 'ay': 'uma', 'qu': 'ukhu'},
    {'es': 'ojo', 'ay': 'nasa', 'qu': 'ñawi'},
    {'es': 'oreja', 'ay': 'wila', 'qu': 'runku'},
    {'es': 'nariz', 'ay': 'ch’alla', 'qu': 'sinqi'},
    {'es': 'boca', 'ay': 'jisk’a uta', 'qu': 'simi'},
    {'es': 'diente', 'ay': 'wara', 'qu': 'maki'},
    {'es': 'cuello', 'ay': 'muyu', 'qu': 'k’uchu'},
    {'es': 'hombro', 'ay': 'jach’a k’ara', 'qu': 'k’allpa'},
    {'es': 'brazo', 'ay': 'k’ara', 'qu': 'riq’chi'},
    {'es': 'mano', 'ay': 'maki', 'qu': 'maki'},
    {'es': 'pecho', 'ay': 'phuyu', 'qu': 'phuyu'},
    {'es': 'estómago', 'ay': 'ch’uqi', 'qu': 'k’uchu'},
    {'es': 'pierna', 'ay': 'sullu', 'qu': 'chaki'},
    {'es': 'rodilla', 'ay': 'utañi', 'qu': 'utañi'},
    {'es': 'pie', 'ay': 'ch’alla', 'qu': 'chaki'},
    {'es': 'espalda', 'ay': 'ch’ulla', 'qu': 'ch’ulla'},

    {'es': 'hola', 'ay': 'kamisaki', 'qu': 'rimaykullayki'},
    {'es': 'bien', 'ay': 'waliki', 'qu': 'allin'},
    {'es': '¿cómo estás?', 'ay': 'kunjamsa', 'qu': 'allinllachu kanki?'},
    {'es': 'muchas gracias', 'ay': 'jach\'a amuyt\'aña'},
    {'es': 'bueno', 'ay': 'suma'},

    {'es': 'buenos días', 'ay': 'aski alwakipana', 'qu': 'allin p’unchay'},
    {'es': 'buenas tardes', 'ay': 'aski urukipana', 'qu': 'allin ch’isi'},
    {'es': 'buenas noches', 'ay': 'aski arumakipana', 'qu': 'allin tuta'},
    {'es': 'estoy bien', 'qu': 'allinmi kani'},

    {
      'es': 'yo soy el doctor / la doctora',
      'ay': 'nayax qullirïtwa',
      'qu': 'ñuqaqa doctormi kani',
    },
    {
      'es': 'yo hablo poquito aymara',
      'ay': 'nayax mä juk’it aymar parlastwa',
      'qu': 'aymarata pisillatam rimani',
    },
    {
      'es': 'cuando te pregunte, me vas a decir sí o no',
      'ay': 'jiskt’äma ukhax, jïsa sitätawa jan ukax janiwa sitätawa',
      'qu': 'tapuptiyqa, arí niwankichu icha manachu niwanki',
    },
    {'es': '¿sí?', 'ay': 'jïsa?', 'qu': 'arí?'},
    {'es': '¿no?', 'ay': 'janiti?', 'qu': 'mana?'},
    {
      'es': '¿cómo te llamas?',
      'ay': 'sutimax kunasa?',
      'qu': 'imataq sutiyki?',
    },
    {
      'es': '¿cuántos años tienes?',
      'ay': 'qhawqha maranïta?',
      'qu': 'hayka watayuqtaq kanki?',
    },
    {
      'es': '¿comprendiste todo?',
      'qu': '¿tukuy imatachu entienderqanki?',
      'qu_pron': 'tú-kuy i-má-ta-chu en-ti-en-der-kán-ki',
      'ay': '¿taqi kunsa amuyawaytati?',
      'ay_pron': 'tá-ki kún-sa a-mu-ya-wáy-ta-ti',
    },
    {
      'es': 'sí entendí',
      'qu': 'arí entienderqani',
      'qu_pron': 'a-rí en-ti-en-der-ká-ni',
      'ay': 'jïsa, nayajj amuyäta',
      'ay_pron': 'jí-sa ná-yaj a-mu-yá-ta',
    },
    {
      'es': 'no entendí',
      'qu': 'mana entienderqanichu',
      'qu_pron': 'má-na en-ti-en-der-ka-ní-chu',
      'ay': 'nayajj janiw amuykäyti',
      'ay_pron': 'ná-yaj já-niw a-muy-káy-ti',
    },
    {
      'es': '¿tiene alguna pregunta?',
      'qu': '¿ima tapukuyniykipas kanchu?',
      'qu_pron': 'í-ma ta-pu-kuy-ni-yki-pas kán-chu',
      'ay': '¿kuna jiskt’anakas utji?',
      'ay_pron': 'kú-na jis-kta-ná-kas út-jí',
    },
    {
      'es': 'sí tengo una pregunta',
      'qu': 'sichus tapukuyniy kanman chayqa',
      'qu_pron': 'sí-chus ta-pu-kuy-niy kán-man cháy-ka',
      'ay': 'nayax mä jiskt’äwinïtwa',
      'ay_pron': 'ná-yaj ma jís-kta-wi-ní-twa',
    },
    {
      'es': 'no, ninguna pregunta',
      'qu': 'mana, mana tapukuykuna',
      'qu_pron': 'má-na má-na ta-pu-kuy-kú-na',
      'ay': 'janiwa, janiw jiskt’asiñas utjkiti',
      'ay_pron': 'já-ni-wa, já-niw jis-kta-sí-ñas út-ki-ti',
    },
    {
      'es': '¿le repito algo?',
      'qu': '¿imatapas yapamanta rimasaq?',
      'qu_pron': 'i-má-ta-pas ya-pa-mán-ta ri-má-sak',
      'ay': '¿kunsa mayamp lurañaja?',
      'ay_pron': 'kún-sa má-yam lu-ra-ña-já',
    },
    {
      'es': '¿cuándo debo tomar?',
      'qu': '¿hayka hampikunatataq upyanay?',
      'qu_pron': 'háy-ka jam-pi-ku-na-ta-tak up-ya-náy',
      'ay': '¿kunapachas umañajaxa?',
      'ay_pron': 'ku-na-pá-chas u-ma-nya-já-kha',
    },
    {
      'es': '¿cómo debo tomar?',
      'qu': '¿imaynatataq hampita upyanay?',
      'qu_pron': 'i-may-na-ta-tak jam-pi-ta up-ya-náy',
      'ay': '¿kunjamsa apsuñaja?',
      'ay_pron': 'kun-hám-sa ap-su-nya-já',
    },
    {
      'es': '¿qué tengo que tomar?',
      'qu': '¿ima hampikunatataq upyanay?',
      'qu_pron': 'í-ma jam-pi-ku-na-ta-tak up-ya-náy',
      'ay': '¿kunsa nayajj apasiñaja?',
      'ay_pron': 'kún-sa ná-yaj a-pa-si-nya-já',
    },
    {
      'es': '¿necesita algo más?',
      'qu': '¿imatapas necesitankichu?',
      'qu_pron': 'i-má-ta-pas ne-ce-si-tan-kí-chu',
      'ay': '¿yaqhanak munasmati?',
      'ay_pron': 'yak-ja-nák mu-nás-ma-ti',
    },
    {'es': 'sí / no', 'qu': 'arí / mana', 'ay': 'jïsa / janiwa'},
    {
      'es': 'gracias',
      'qu': 'añay / pay / sunqullay',
      'qu_pron': 'á-nay / páy / sun-ku-lyáy',
      'ay': 'añä / pay / sunkullay',
      'ay_pron': 'á-nya / páy / sun-ku-lyáy',
    },
    {
      'es': 'hasta luego',
      'qu': 'asllakama',
      'qu_pron': 'as-lya-ká-ma',
      'ay': 'ukat jikisiñani',
      'ay_pron': 'ú-kat ji-ki-si-ñá-ni',
    },
    {
      'es': 'que le vaya bien',
      'qu': 'suyakuy tukuy imapas allinta purinanta',
      'qu_pron': 'su-ya-kúy tú-kuy i-ma-pas a-lyin-ta pu-ri-nán-ta',
      'ay': 'taqi kunas sum sarañapataki suyt’añani',
      'ay_pron': 'tá-ki kú-nas súm sa-ra-nya-pa-tá-ki suy-ta-ña-ni',
    },
    {
      'es': 'tiene que cuidarse',
      'qu': 'kikiykitam cuidakunayki',
      'qu_pron': 'ki-kiy-ki-tam ku-ya-ku-náy-ki',
      'ay': 'juma pachpaw sum uñjasiñama',
      'ay_pron': 'jú-ma pach-paw sum uñ-ja-si-nya-ma',
    },
    {
      'es': 'que tenga buen día',
      'qu': 'qampaq allin punchaw',
      'qu_pron': 'kám-pak a-lyin pún-chaw',
      'ay': 'aski uru churätam',
      'ay_pron': 'ás-ki ú-ru chu-rá-tam',
    },
    {
      'es': '¿fumas?',
      'ay': '¿pitirïtati?',
      'ay_pron': 'pi-ti-rí-ta-ti',
      'qu': '¿qamchu cigarrota pitanki?',
      'qu_pron': 'kam-chu si-ga-ró-ta pi-tán-ki',
    },
    {
      'es': '¿tomas bebidas alcohólicas?',
      'ay': '¿machañ umañanak umirïtati?',
      'ay_pron': 'ma-cha-ñ u-ma-nya-nak u-mi-rí-ta-ti',
      'qu': '¿machaytachu ukyanki?',
      'qu_pron': 'ma-chay-ta-chu u-kyán-ki',
    },
    {
      'es': '¿en tu casa hay personas que tosen?',
      'ay': '¿utaman ujump usutanakax utjiti?',
      'ay_pron': 'u-ta-man u-júmp u-su-ta-na-kaj ut-jí-ti',
      'qu': '¿kanchu wasiykipi tosaq runakuna?',
      'qu_pron': 'kan-chu wa-si-ykí-pi tó-saq ru-na-kú-na',
    },
    {
      'es': '¿tomas medicamentos?',
      'ay': '¿qullanak umirïtati?',
      'ay_pron': 'ku-lya-nak u-mi-rí-ta-ti',
      'qu': '¿hampikunatachu tomanki?',
      'qu_pron': 'jam-pi-ku-na-ta-chu tó-man-ki',
    },
    {
      'es': '¿qué medicamentos?',
      'ay': '¿kawkïr qullanaka?',
      'ay_pron': 'kaw-kír ku-lya-na-ka',
      'qu': '¿imayna hampikunata?',
      'qu_pron': 'i-máy-na jam-pi-ku-na-ta',
    },
    {
      'es': '¿has estado enfermo de diabetes?',
      'ay': '¿diabetes usump usuntirïtati?',
      'ay_pron': 'día-bé-tes ú-sump u-sun-ti-rí-ta-ti',
      'qu': '¿diabetes onqoywanchu onqorqanki?',
      'qu_pron': 'día-bé-tes on-kóy-wan-chu on-kor-kán-ki',
    },
    {
      'es': '¿cuándo te cortas, sana bien?',
      'ay': '¿janch khart’asktä ukhax sumakit jaktam?',
      'ay_pron': 'jánch jar-t’as-kta ú-khaj sú-ma-kit jak-tám',
      'qu': 'kikiyki kuchukuspaykiqa, allintachu qhaliyapun?',
      'qu_pron': 'ki-kiy-ki ku-chu-ku-spay-ki-ka, a-lyin-ta-chu kha-li-ya-pún',
    },
    {
      'es': '¿en tu casa hay alguien enfermo?',
      'ay': '¿utaman usutax utjiti?',
      'ay_pron': 'u-ta-man u-su-taj ut-jí-ti',
      'qu': '¿wasiykipi pipas unquq kanchu?',
      'qu_pron': 'wa-si-ykí-pi pí-pas un-kúk kan-chu',
    },
    {
      'es': '¿de qué está enfermo?',
      'ay': '¿kunat usutasa?',
      'ay_pron': 'kú-nat u-su-tá-sa',
      'qu': '¿imawantaq unquchkan?',
      'qu_pron': 'i-ma-wán-taq un-kuch-kán',
    },
    {
      'es': '¿desde cuándo?',
      'ay': '¿kunapachata?',
      'ay_pron': 'ku-na-pa-chá-ta',
      'qu': '¿hayk’aqmantapacha?',
      'qu_pron': 'jai-k’aq-man-ta-pá-cha',
    },
    {
      'es': '¿cuántos días?',
      'ay': '¿qawqha urunaka?',
      'ay_pron': 'kaw-kha u-ru-ná-ka',
      'qu': '¿hayka punchawtaq?',
      'qu_pron': 'hái-ka pun-cháw-tak',
    },
    {
      'es': '¿un rato?',
      'ay': '¿mä juk’a pachakiti?',
      'ay_pron': 'ma ju-k’a pa-chá-ki-ti',
      'qu': '¿huk ratulla?',
      'qu_pron': 'juk ra-túl-lya',
    },
    {
      'es': '¿un día?',
      'ay': '¿mä uruti?',
      'ay_pron': 'má u-rú-ti',
      'qu': '¿huk punchawchu?',
      'qu_pron': 'juk pun-cháw-chu',
    },
    {
      'es': '¿dos días?',
      'ay': '¿pä uruti?',
      'ay_pron': 'pá u-rú-ti',
      'qu': 'iskay punchaw',
      'qu_pron': 'ís-kay pun-cháw',
    },
    {
      'es': '¿tres días?',
      'ay': '¿kimsa uruti?',
      'ay_pron': 'kím-sa u-rú-ti',
      'qu': 'kimsa punchaw',
      'qu_pron': 'kím-sa pun-cháw',
    },
    {
      'es': '¿una semana?',
      'ay': '¿mä paqüruti?',
      'ay_pron': 'má pa-kju-rú-ti',
      'qu': '¿huk semanachu?',
      'qu_pron': 'juk se-ma-ná-chu',
    },
    {
      'es': '¿dos semanas?',
      'ay': '¿pä paqüruti?',
      'ay_pron': 'pá pa-kju-rú-ti',
      'qu': '¿iskay semanachu?',
      'qu_pron': 'ís-kay se-ma-ná-chu',
    },
    {
      'es': '¿un mes?',
      'ay': '¿mä phaxsiti?',
      'ay_pron': 'má phak-si-tí',
      'qu': '¿huk killachu?',
      'qu_pron': 'juk kí-lya-chu',
    },
    {
      'es': '¿dos meses?',
      'ay': '¿pä phaxsiti?',
      'ay_pron': 'pá phak-si-tí',
      'qu': 'iskay killa',
      'qu_pron': 'ís-kay kí-lya',
    },
    {
      'es': '¿un año?',
      'ay': '¿mä marati?',
      'ay_pron': 'má ma-rá-ti',
      'qu': '¿huk watachu?',
      'qu_pron': 'juk wa-tá-chu',
    },
    {
      'es': '¿dos años?',
      'ay': '¿pä marati?',
      'ay_pron': 'pá ma-rá-ti',
      'qu': 'iskay wata',
      'qu_pron': 'ís-kay wa-tá',
    },
    {
      'es': '¿varios años?',
      'ay': '¿walja maranakati?',
      'ay_pron': 'wál-ha ma-ra-ná-ka-ti',
      'qu': '¿achka watakuna?',
      'qu_pron': 'ách-ka wa-ta-kú-na',
    },
    {
      'es': '¿cuándo empezó?',
      'ay': '¿kunapachats qallti?',
      'ay_pron': 'ku-na-pá-chats kál-ti',
      'qu': '¿hayk’aqmi qallarirqan?',
      'qu_pron': 'jai-k’ák-mi ka-lya-rír-kan',
    },
    {
      'es': '¿a qué hora del día?',
      'ay': '¿kuna horasarus urunxa?',
      'ay_pron': 'kú-na o-ra-sá-rus ú-run-kha',
      'qu': '¿ima horapitaq?',
      'qu_pron': 'í-ma o-ra-pí-tak',
    },
    {
      'es': '¿al amanecer?',
      'ay': '¿willjtaruti?',
      'ay_pron': 'wíl-lya-ta-rú-ti',
      'qu': '¿achikyaypi?',
      'qu_pron': 'a-chi-kyaý-pi',
    },
    {
      'es': '¿en la mañana?',
      'ay': '¿alwati?',
      'ay_pron': 'ál-wa-tí',
      'qu': '¿tutamanta?',
      'qu_pron': 'tu-ta-mán-ta',
    },
    {
      'es': '¿al mediodía?',
      'ay': '¿chika ururuti?',
      'ay_pron': 'chí-ka u-ru-rú-ti',
      'qu': '¿chawpi punchawpi?',
      'qu_pron': 'cháw-pi pun-cháw-pi',
    },
    {
      'es': '¿en la tarde?',
      'ay': '¿jayp’utuqiruti?',
      'ay_pron': 'jai-p’u-tú-ki-rú-ti',
      'qu': '¿tardetachu?',
      'qu_pron': 'tar-de-tá-chu',
    },
    {
      'es': '¿al anochecer?',
      'ay': '¿arumthapiruti?',
      'ay_pron': 'a-rúm-tha-pí-rú-ti',
      'qu': '¿ch’isiyaypichu?',
      'qu_pron': 'ch’i-si-yái-pi-chu',
    },
    {
      'es': '¿en la noche?',
      'ay': '¿arumati?',
      'ay_pron': 'a-ru-má-ti',
      'qu': '¿tutapi?',
      'qu_pron': 'tu-tá-pi',
    },
    {
      'es': '¿todo el día?',
      'ay': '¿urpachati?',
      'ay_pron': 'ur-pa-chá-ti',
      'qu': '¿tukuy punchawchu?',
      'qu_pron': 'tu-kúy pun-cháw-chu',
    },
    {
      "es": "¿Te está doliendo?",
      "ay": "¿Ususktamti?",
      "qu": "¿K’irichisunkichu?",
    },
    {
      "es": "¿Qué te duele?",
      "ay": "¿Kunas ustamxa?",
      "qu": "¿Imataq k’irisunki?",
    },
    {
      "es": "¿Desde cuándo te duele?",
      "ay": "¿Kunapachats ustamxa?",
      "qu": "¿Hayk’aqmantapachan k’irisunki?",
    },
    {
      "es": "¿Cuánto tiempo te duele?",
      "ay": "¿T’ajax qawch’apachaxisa?",
      "qu": "¿Hayk’aqkamataq nanawan?",
    },
    {"es": "¿Ha calmado?", "ay": "¿Samarxtamti?", "qu": "¿Hawkayarunñachu?"},
    {"es": "¿Ha aumentado?", "ay": "¿Juk’ampit ustamxa?", "qu": "¿Astasqachu?"},
    {
      "es": "¿Te duele la cabeza?",
      "ay": "¿P’iqix ustamti?",
      "qu": "¿Umayki nananchu?",
    },
    {
      "es": "¿Te duele en el cuello?",
      "ay": "¿Kunkax ustamti?",
      "qu": "¿Kunkayki nananchu?",
    },
    {
      "es": "¿Tienes fiebre?",
      "ay": "¿Chhuju usunïtati?",
      "qu": "¿Fiebreyuqchu kanki?",
    },
    {
      "es": "¿Tienes escalofríos?",
      "ay": "¿Thäjump’inïtati?",
      "qu": "¿Chirichiyuqchu kanki?",
    },
    {
      "es": "¿Sudas en la noche?",
      "ay": "¿Arumax jump’tati?",
      "qu": "¿Tutachu sudanki?",
    },
    {
      "es": "¿Estas comiendo bien?",
      "ay": "¿Walikt manq’asiskta?",
      "qu": "¿Allintachu mikhushanki?",
    },
    {
      "es": "¿Has enflaquecido?",
      "ay": "¿Tuxunttati?",
      "qu": "¿Llampuñachu kanki?",
    },
    {
      "es": "¿Estas durmiendo bien?",
      "ay": "¿Walikit ikiskta?",
      "qu": "¿Allintachu puñuchkanki?",
    },
    {
      "es": "¿Sientes escozor?",
      "ay": "¿Jastamti?",
      "qu": "¿Picazón sientenkichu?",
    },
    {
      "es": "¿Estas Tosiendo?",
      "ay": "¿Ujumpïtati?",
      "qu": "¿Tosaqchu kachkanki?",
    },
    {
      "es": "¿Desde cuándo estás tosiendo?",
      "ay": "¿Kunapachats ujta?",
      "qu": "¿Hayk’aqmantapachan tosashanki?",
    },
    {
      "es": "¿Te duele el pecho al toser?",
      "ay": "¿Ujktä ukhax lluquchuymax ustamti?",
      "qu": "¿Toskuspayki sinqayki nananchu?",
    },
    {
      "es": "¿Estás escupiendo flemas cuando toses?",
      "ay": "¿Ujktä ukhax jurmallawsanak thustati?",
      "qu": "¿Toskuspaqa flematachu thuqachkanki?",
    },
    {
      "es": "¿No puedes respirar?",
      "ay": "¿Janit samsuñ atkta?",
      "qu": "¿Manachu samayta atinki?",
    },
    {
      "es": "¿Se te hinchan los pies?",
      "ay": "¿Kayunakamax p’usunttamti?",
      "qu": "¿Chakiykikuna punkinchu?",
    },
    {
      "es": "¿Cómo era la diarrea?",
      "ay": "¿Wich’ux kunjamänsa?",
      "qu": "¿Imaynataq chay diarrea karqa?",
    },
    {
      "es": "¿No has podido defecar?",
      "ay": "¿Janit jumanakax defecañ puedipkta?",
      "qu": "¿Manachu defecakuyta atirqanki?",
    },
    {
      "es": "¿Cómo son tus heces?",
      "ay": "¿Kunjamsa heces ukanakamax utji?",
      "qu": "¿Imaynataq hecesniykikuna?",
    },
    {
      "es": "¿Has tenido ganas de vomitar?",
      "ay": "¿Waq’aqiñax purtamti?",
      "qu": "¿Vomitayta munarqankichu?",
    },
    {
      "es": "¿Cuántas veces al día has vomitado?",
      "ay": "¿Qawqhakutis urunx waq’aqsta?",
      "qu": "¿Hayka kutitataq sapa punchaw aqturqanki?",
    },
    {
      "es": "¿Te duele al orinar?",
      "ay": "¿Chhuxurktä ukhax ustamti?",
      "qu": "¿Nananchu urinakuspayki?",
    },
    {
      "es": "¿Cuántas veces al día orinas?",
      "ay": "¿Qawqhakutis urunx chhuxurta?",
      "qu": "¿Hayka kutitataq sapa punchaw urinanki?",
    },
    {
      "es": "¿Tu orina tiene mal olor?",
      "ay": "¿Chhuxumax thujsati?",
      "qu": "¿Mana allin asnaqchu urinayki?",
    },
    {'es': "laboratorio", 'ay': "uñachtʼawi utjañani", 'qu': "yachay wasicha"},
    {'es': "análisis", 'ay': "uñtʼawi", 'qu': "yachaykamay"},
    {'es': "muestra", 'ay': "uñtʼayawi", 'qu': "rikchʼay"},
    {'es': "sangre", 'ay': "wilani", 'qu': "yawar"},
    {'es': "orina", 'ay': "chʼiwa", 'qu': "urinay"},
    {'es': "resultado", 'ay': "uñtʼawi jakhthapiwi", 'qu': "rikhuchikuy"},
    {'es': "paciente", 'ay': "qullqa jaqi", 'qu': "hampiq runa"},
    {'es': "médico", 'ay': "qulliri", 'qu': "hampiq"},
    {'es': "inyección", 'ay': "qulli imantaña", 'qu': "ruqʼi hampi"},
    {'es': "ayuno", 'ay': "mankʼañ thakhi", 'qu': "manchariy"},
    {
      'es': "debe venir en ayunas",
      'ay': "mankʼañ thakhi jutama",
      'qu': "manchariywan hamuy",
    },
    {
      'es': "tome asiento, por favor",
      'ay': "asiento katuqama",
      'qu': "mayllanapaq tiyay",
    },
    {
      'es': "le tomaremos una muestra de sangre",
      'ay': "wilani uñtʼayawi aptʼañani",
      'qu': "yawar rikchʼay apachikuy",
    },
    {
      'es': "su resultado estará listo mañana",
      'ay': "uñtʼawi jakhthapiwi qharu utjani",
      'qu': "rikhuchikuy paqarinmi kachkan",
    },
    {
      'es': "espere un momento, por favor",
      'ay': "mä jachʼa kʼuchu suytʼama",
      'qu': "suyaykuy huk ratuchalla",
    },
    {
      'es': "tome una pastilla cada 8 horas",
      'ay': "kimsa ura pasada mä pastilla katuñamawa",
      'qu': "pusa horas saraq huk pilluta upyaykuy",
    },
    {
      'es': "tome el medicamento después de comer",
      'ay': "manq’atxa katuñamawa aka medicina",
      'qu': "mikhunakaymanta qhipa medicine upyaykuy",
    },
    {
      'es': "no tome con el estómago vacío",
      'ay': "janiw chuyma ch’usa katuñamti",
      'qu': "mana ch’usa sunquwan upyaykuychu",
    },
    {
      'es': "tome con bastante agua",
      'ay': "jach’a uma ch’ampampi katuñamawa",
      'qu': "aswan yakuwan upyaykuy",
    },
    {
      'es': "no mezcle con alcohol",
      'ay': "janiw alcoholampiwa ch’umiñamti",
      'qu': "mana alcoholwan qhurquychu",
    },
    {
      'es': "este jarabe es para la tos",
      'ay': "aka jarabe ukaxa jiqi ukatawa",
      'qu': "kay jarabeqa sikiypaqmi",
    },
    {
      'es': "si tiene efecto secundario, vuelva",
      'ay': "kunasa jani wali uñjasma ukaxa kutimjjam",
      'qu': "imapaqmi manchakuykiqa chayqa kutimuy",
    },
    {
      'es': "¿está embarazada?",
      'ay': "¿wawan irnaqañatakiti?",
      'qu': "¿wawa uywasqankichu?",
    },
    {
      'es': "tiene que completar todo el tratamiento",
      'ay': "janiw medicina tukusxañkamati, taqi katuñamawa",
      'qu': "llaqta terapiata tukuykuychu",
    },
    {
      'es': "buenos días",
      'ay': "aski uru / aski jayp’acha",
      'qu': "allin p'unchay / allin chawpi p'unchay",
    },
    {
      'es': "buenas tardes",
      'ay': "aski uru / aski jayp’acha",
      'qu': "allin p'unchay / allin chawpi p'unchay",
    },
    {
      'es': "¿cómo se siente?",
      'ay': "kunjamsa jikxatasma?",
      'qu': "imaynallan kashanki?",
    },
    {
      'es': "le vamos a hacer un examen de laboratorio",
      'ay': "laboratorio uñt’awi lurañäniwa",
      'qu': "laboratorio rikuyta ruwasunchis",
    },
    {
      'es': "le tomaré una muestra de sangre",
      'ay': "wila q’ipxt’äwiwa",
      'qu': "yawar apamusaq",
    },
    {
      'es': "por favor, siéntese",
      'ay': "jiskt’apxam, qunt’am",
      'qu': "allichu, tiariy",
    },
    {
      'es': "no se preocupe",
      'ay': "jan mayjt’asiñamti",
      'qu': "mana piñakuychu",
    },
    {
      'es': "le daremos el resultado en unas horas",
      'ay': "walja uranakapana utjaniwa",
      'qu': "hohaspi chayta willarqasunki",
    },
    {
      'es': "debe estar en ayunas",
      'ay': "jan manq’asina jut’am",
      'qu': "mana mikhuspa hamuy",
    },
    {
      'es': "le vamos a poner una inyección",
      'ay': "inyeksión churäniwa",
      'qu': "inyeksyonata churasaq",
    },
    {
      'es': "espere un momento, por favor",
      'ay': "särim, janiw wakt’ayapktati",
      'qu': "suyaykuy, ama piñakuychu",
    },
    {
      'es': "vamos a pasar al doctor",
      'ay': "doktorru sarñaniwa",
      'qu': "doktorman risun",
    },
    {
      'es': "necesitamos pesarle",
      'ay': "ukhamwa q’amart’asaña munta",
      'qu': "kichkuykuy, kachaykuy",
    },
    {
      'es': "¿le duele aquí?",
      'ay': "akhamana sint’isma?",
      'qu': "kaypi nanachkanki?",
    },
    {
      'es': "respire profundo",
      'ay': "jach’a samäñam sarnaqam",
      'qu': "suma samaykuy",
    },
    {
      'es': "gracias por su paciencia",
      'ay': "yuspagara, suma amuyt’asitaxa",
      'qu': "sulpayki, anchata allin hamuykuyki",
    },
    {
      'es': "no consumir bebidas alcohólicas el día anterior a los exámenes",
      'ay': "janiw uka urunak qhiparu trago (alcohol) umañakiti análisis layku",
      'qu': "mana umaychu trago (alcohol) ñawpaq p’unchawpi análisispaq",
    },
    {
      'es': "no realizar ejercicio 24 horas antes del examen",
      'ay':
          "janiw 24 horas nayrïr uru tuqin ejercicio lurapxañapäkti análisis layku",
      'qu': "mana ruwakuychu ejercicio 24 horas ñawpaqta, análisispaq",
    },
    {
      'es': "no fumar antes de realizarse el examen",
      'ay': "janiw iq’t’asiñapäkiti análisis lurañat nayraqata",
      'qu': "mana iq’iychu análisis ruwasqanmanta ñawpaqta",
    },
    {
      'es':
          "si está tomando algún medicamento informar en la toma de la muestra",
      'ay': "qullanaka apnaqasiski ukhaxa, wakichäwinx yatiyañawa",
      'qu': "qullaqa ukyaspaqa, muestrachaykama rimakuykachkanqa",
    },
    {
      'es': "le tomaremos una muestra para glucosa",
      'ay': "glukosa uñt’añataki wila apañaniwa",
      'qu': "glucosa rikuyta yawarwan ruwasunchis",
    },
    {
      'es': "necesita estar en ayunas",
      'ay': "manq’asa jutatamwa munta",
      'qu': "mana mikhuyta saqkuspa hamuy",
    },
    {
      'es': "por favor, no coma nada esta mañana",
      'ay': "aka uru jan manq’añamawa",
      'qu': "kay p’unchay mana mikhuychu",
    },
    {
      'es': "espere unos minutos, por favor",
      'ay': "janiw wakt’ayapktati",
      'qu': "suyaykuy, ama piñakuychu",
    },
    {
      'es': "le pondremos una inyección para el examen",
      'ay': "uñt’awi layku inyeksyon churaniwa",
      'qu': "ñawinchikpaq inyeksyonata churasaq",
    },
    {
      'es': "debe tomar mucha agua",
      'ay': "juk’ampi uma umañamawa",
      'qu': "yaku aswan upaykuy",
    },
    {
      'es': "su análisis de colesterol está listo",
      'ay': "kolesterol uñt’awim qillqt’atawa",
      'qu': "kolesteroltaq ñawinchik qhipanmi chaykunku",
    },
    {
      'es': "el resultado estará por la tarde",
      'ay': "jayp’achawa wakicht’atäni",
      'qu': "chawpi punchaytaqmi willarqasunki",
    },
    {
      'es': "vamos a hacerle un examen de orina",
      'ay': "ch’usa t’urka uñt’awi lurañäniwa",
      'qu': "ch’iri yaku ñawinchikta ruwasunchis",
    },
    {
      'es': "por favor, recoja su orina en este frasco",
      'ay': "aka fraskompixa ch’usa t’urkama apthapiñamawa",
      'qu': "kay q’ipipi ch’iri yakuyki apanaykichik",
    },
    {
      'es': "este frasco está limpio",
      'ay': "aka fraskoxa limpuwa",
      'qu': "kay q’ipiqa ch’uyanchasqam",
    },
    {
      'es': "no debe mezclar con agua ni jabón",
      'ay': "jan uma jamasampi ch’umiñamti",
      'qu': "ama yaku ni jamónwan qhurquychu",
    },
    {
      'es': "debe recoger la orina de la primera hora del día",
      'ay': "nayriri uru uratxa apthapiñamawa",
      'qu': "qayna punchay paqarin ch’iri yakuyki apanay",
    },
    {
      'es': "no toque el interior del frasco",
      'ay': "fraskon manqhanx janiw llamkt’añamti",
      'qu': "ama q’ipipi ukuman mañachkuychu",
    },
    {
      'es': "entregue el frasco después de llenar",
      'ay': "phuqaptaxa fraskox apayañamawa",
      'qu': "q’ipita phuqaykiptin churaykuy",
    },
    {
      'es': "gracias por su colaboración",
      'ay': "yuspagara, yanapt’ama",
      'qu': "sulpayki, yanapayninki",
    },
    {
      'es': "vamos a hacerle una prueba de tuberculosis",
      'ay': "tuberkulosis uñt’awi lurañäniwa",
      'qu': "tuberkulosispa rikch’ariyninta ruwasunchis",
    },
    {
      'es': "necesitamos su esputo / flema",
      'ay': "luqta (jach’a samana) munarakiwa",
      'qu': "asnuykita munanchik",
    },
    {
      'es': "por favor, escupa aquí por la mañana",
      'ay': "mä alwakipana aka fraskompixa luqtam",
      'qu': "paqarinkama kay q’ipipi asnuyta churaykuy",
    },
    {
      'es': "no debe haber comido antes",
      'ay': "janiw manq’añamti mä qhipha pachakama",
      'qu': "ama mikhuychu chaymanta",
    },
    {
      'es': "respire hondo antes de escupir",
      'ay': "jach’a samäñam sarnaqam, ukatxa luqtam",
      'qu': "suma samaykuy, chaymanta asnuy",
    },
    {
      'es': "es importante hacer el tratamiento completo",
      'ay': "askiwa taqi qullañani luraña",
      'qu': "allinmi llaqtaq kawsaykunapaq hampikuyta tukuyta ruwakuy",
    },
    {
      'es': "va a tomar pastillas por varios meses",
      'ay': "walja phaxsinakaxa tabletanakampi qullañaniwa",
      'qu': "qatiqkita killapi pillukuna uywasunki",
    },
    {
      'es': "no debe dejar el tratamiento",
      'ay': "janiw qullañani jayt’añamti",
      'qu': "ama hampikuyta saqiychu",
    },
    {
      'es': "tiene que venir a control",
      'ay': "controlaru jutam",
      'qu': "hampi qhawayman hamuy",
    },
    {
      'es': "gracias por su responsabilidad",
      'ay': "yuspagara suma irnaqawimataki",
      'qu': "sulpayki llank’ayki rayku",
    },
    {
      'es': "vamos a hacer una prueba para revisar sus defensas",
      'ay': "qhichhawi uñt’awi lurañäniwa",
      'qu': "defensakunata qhawayta ruwasunchis",
    },
    {
      'es': "esta prueba es para detectar enfermedades en la sangre",
      'ay': "aka uñt’awi wila usunak uñjañatakiwa",
      'qu': "kay rikuy yawarpi onqokuna kasqanta riqsichinapaqmi",
    },
    {
      'es': "necesitamos analizar su sangre",
      'ay': "wilam uñjañäniwa",
      'qu': "yawarkiyta qhawarqasunki",
    },
    {
      'es': "debe firmar su consentimiento",
      'ay': "aruskipt’añ munta",
      'qu': "kikin munaynikiwan qillqaykuy",
    },
    {
      'es': "¿está de acuerdo con la prueba?",
      'ay': "uñt’awi katuqtati?",
      'qu': "riqch’ariynita munankichu?",
    },
    {
      'es': "esta prueba es confidencial",
      'ay': "aka uñt’awi jamuqäwimpina mäqha",
      'qu': "kay rikuy mana willakuykuchu kashan",
    },
    {
      'es': "puede venir por su resultado la próxima semana",
      'ay': "qhipa semanankirusa jutam qillqt’ata katuñataki",
      'qu': "qhipa semanapi hamuy willakuyta chaskiyta",
    },
    {
      'es': "si es positivo, le explicaremos el tratamiento",
      'ay': "positivöt ukhaxa, qullañaniwa qhanancht’ani",
      'qu': "positivom chayqa hampiyta willarqasunki",
    },
    {
      'es': "es importante seguir con los controles",
      'ay': "askiwa kontrolleru sarantaña",
      'qu': "allinmi qhawakuyta qatimuyta",
    },
    {
      'es': "estamos para ayudarle",
      'ay': "yanapt’añatakiw jikxatskta",
      'qu': "yanapayta munanchik",
    },
  ];

  static String translate(String input, String targetLang) {
    final phrase = removeDiacritics(input.trim().toLowerCase());

    for (var entry in _dictionary) {
      final normalizedValues = entry.values.map(
        (val) => removeDiacritics(val.toLowerCase()),
      );

      if (normalizedValues.any((val) => val == phrase)) {
        return entry[targetLang] ?? 'Traducción no disponible';
      }
    }

    return 'Traducción no disponible';
  }

  // Nuevo método para obtener el idioma de origen detectado automáticamente
  static String? _detectLanguage(String phrase) {
    final normalizedPhrase = removeDiacritics(phrase.toLowerCase());

    for (var entry in _dictionary) {
      if (removeDiacritics(entry['es']?.toLowerCase() ?? '') ==
          normalizedPhrase)
        return 'es';
      if (removeDiacritics(entry['ay']?.toLowerCase() ?? '') ==
          normalizedPhrase)
        return 'ay';
      if (removeDiacritics(entry['qu']?.toLowerCase() ?? '') ==
          normalizedPhrase)
        return 'qu';
    }
    return null;
  }
}
