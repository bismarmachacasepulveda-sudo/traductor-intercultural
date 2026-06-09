import 'package:flutter/material.dart';
import '../../screens/app_localizations.dart';

class EducationScreen extends StatefulWidget {
  final String userLanguage;

  const EducationScreen({required this.userLanguage, super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _filteredMedicines = [];
  late AppLocalizations localizations;

  // Base de datos de medicamentos con imágenes
  final List<Map<String, dynamic>> _medicines = [
    {
      'name': {
        'es': 'Aspirina',
        'ay': 'Aspirina',
        'qu': 'Aspirina',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/aspirina.jpg',
      'uses': {
        'es': 'Alivio del dolor, antiinflamatorio',
        'ay': 'Usu qulliri, janchi ch\'amanchasiña',
        'qu': 'Nanayta hampina, unquy hark\'aq',
      },
      'dose': {
        'es': 'Adultos: 300-600mg cada 4-6 horas',
        'ay': 'Jach\'a jaqinaka: 300-600mg sapa 4-6 uru',
        'qu': 'Hatun runakuna: 300-600mg 4-6 inti pachapi',
      },
      'warnings': {
        'es': 'Puede causar irritación estomacal',
        'ay': 'Purajani usuchiri',
        'qu': 'Purajani usuchiri',
      },
    },
    {
      'name': {
        'es': 'Ibuprofeno',
        'ay': 'Ibuprofeno',
        'qu': 'Ibuprofeno',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/Ibuprofeno.jpg',
      'uses': {
        'es': 'Antiinflamatorio, alivio del dolor',
        'ay': 'Janchi ch\'amanchasiña, usu qulliri',
        'qu': 'Unquy hark\'aq, nanayta hampina',
      },
      'dose': {
        'es': 'Adultos: 400-600mg cada 6-8 horas',
        'ay': 'Jach\'a jaqinaka: 400-600mg sapa 6-8 uru',
        'qu': 'Hatun runakuna: 400-600mg 6-8 inti pachapi',
      },
      'warnings': {
        'es': 'Tomar con alimentos. Evitar en embarazo.',
        'ay': 'Manq\'ampi. Janiw warminakampi.',
        'qu': 'Mikuywan. Ama warmi wachakusqanpipas.',
      },
    },
    {
      'name': {
        'es': 'Acetazolamida',
        'ay': 'Acetazolamida',
        'qu': 'Acetazolamida',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/acetazolamida.png',
      'uses': {
        'es': 'Tratamiento del glaucoma y edema',
        'ay': 'Glaucoma ukat edema tratamintu',
        'qu': 'Glaucoma y edema hampina',
      },
      'dose': {
        'es': 'Adultos: 250-1000mg al día en dosis divididas',
        'ay': 'Jach\'a jaqinaka: 250-1000mg sapa uru q\'uchunchawi',
        'qu': 'Hatun runakuna: 250-1000mg punchawpi rakisqa dosispi',
      },
      'warnings': {
        'es': 'Puede causar adormecimiento de extremidades',
        'ay': 'Kunka manqhana uñtawayata',
        'qu': 'Kunka manqhana uñtawayata',
      },
    },
    {
      'name': {
        'es': 'Acido fólico',
        'ay': 'Acido fólico',
        'qu': 'Acido fólico',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/ácido_fólico.jpg',
      'uses': {
        'es': 'Prevención de anemia y malformaciones en embarazo',
        'ay': 'Anemia jark\'aqaña ukat wawa usutawipa',
        'qu': 'Anemia hark\'ana y wawa usutawipa',
      },
      'dose': {
        'es': 'Adultos: 400-800μg al día',
        'ay': 'Jach\'a jaqinaka: 400-800μg sapa uru',
        'qu': 'Hatun runakuna: 400-800μg punchawpi',
      },
      'warnings': {
        'es': 'Importante en mujeres embarazadas',
        'ay': 'Warminaka wawachiri marka suma',
        'qu': 'Warmi wawachisqa marka suma',
      },
    },
    {
      'name': {
        'es': 'Alprazolam',
        'ay': 'Alprazolam',
        'qu': 'Alprazolam',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/alprazolam.jpg',
      'uses': {
        'es': 'Ansiedad y trastornos del sueño',
        'ay': 'Llaki usuchawi ukat ikiña manqhana',
        'qu': 'Llaki usuchawi y puñuna nanay',
      },
      'dose': {
        'es': 'Adultos: 0.25-0.5mg 2-3 veces al día',
        'ay': 'Jach\'a jaqinaka: 0.25-0.5mg 2-3 kuti sapa uru',
        'qu': 'Hatun runakuna: 0.25-0.5mg 2-3 kutilla punchawpi',
      },
      'warnings': {
        'es': 'Puede causar dependencia. No mezclar con alcohol',
        'ay': 'Dependencia uñtawayata. Janiw alcoholampi',
        'qu': 'Dependencia ruwayta atin. Ama alkulwanchu',
      },
    },
    {
      'name': {
        'es': 'Amlodipino',
        'ay': 'Amlodipino',
        'qu': 'Amlodipino',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/amlodipino.jpg',
      'uses': {
        'es': 'Hipertensión arterial y angina de pecho',
        'ay': 'Junt\'u presión ukat q\'asquru nanay',
        'qu': 'Junt\'u presión y q\'asquru nanay',
      },
      'dose': {
        'es': 'Adultos: 5-10mg una vez al día',
        'ay': 'Jach\'a jaqinaka: 5-10mg maya kuti sapa uru',
        'qu': 'Hatun runakuna: 5-10mg huk kutilla punchawpi',
      },
      'warnings': {
        'es': 'Puede causar hinchazón en piernas',
        'ay': 'Kayu hinchazón uñtawayata',
        'qu': 'Chaki hinchazón ruwayta atin',
      },
    },
    {
      'name': {
        'es': 'Amikacina',
        'ay': 'Amikacina',
        'qu': 'Amikacina',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/amikacina.jpg',
      'uses': {
        'es': 'Infecciones bacterianas graves',
        'ay': 'Janchi usuchawi bacteria ukaxa',
        'qu': 'Unancha bacteria nanay',
      },
      'dose': {
        'es': 'Adultos: 15mg/kg/día en 1-2 dosis',
        'ay': 'Jach\'a jaqinaka: 15mg/kg/uru 1-2 q\'uchu',
        'qu': 'Hatun runakuna: 15mg/kg/punchaw 1-2 rakina',
      },
      'warnings': {
        'es': 'Monitorizar función renal',
        'ay': 'Janiw riñon manqhana jilaña',
        'qu': 'Ama riñon nanayta ruwanchu',
      },
    },
    {
      'name': {
        'es': 'Amoxicilina + inhibidor betalactamasa',
        'ay': 'Amoxicilina + inhibidor betalactamasa',
        'qu': 'Amoxicilina + inhibidor betalactamasa',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/amoxicilina_acido_clavulanico.jpg',
      'uses': {
        'es': 'Infecciones bacterianas resistentes',
        'ay': 'Janchi usuchawi bacteria resistente ukaxa',
        'qu': 'Unancha bacteria resistente nanay',
      },
      'dose': {
        'es': 'Adultos: 500-875mg cada 12 horas',
        'ay': 'Jach\'a jaqinaka: 500-875mg sapa 12 uru',
        'qu': 'Hatun runakuna: 500-875mg 12 inti pachapi',
      },
      'warnings': {
        'es': 'Puede causar diarrea. Tomar con alimentos',
        'ay': 'Jisq\'a uñtawayata. Manq\'ampi munaña',
        'qu': 'Jisq\'a ruwayta atin. Mikhuypi upyay',
      },
    },
    {
      'name': {
        'es': 'Atorvastatina',
        'ay': 'Atorvastatina',
        'qu': 'Atorvastatina',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/atorvastatina.jpg',
      'uses': {
        'es': 'Reducción de colesterol',
        'ay': 'Colesterol jark\'aña',
        'qu': 'Colesterol jark\'aña',
      },
      'dose': {
        'es': 'Adultos: 10-80mg una vez al día',
        'ay': 'Jach\'a jaqinaka: 10-80mg maya kuti sapa uru',
        'qu': 'Hatun runakuna: 10-80mg huk kutilla punchawpi',
      },
      'warnings': {
        'es': 'Evitar durante el embarazo',
        'ay': 'Janiw wawachiri marka jilaña',
        'qu': 'Ama wawachisqa marka upyaychu',
      },
    },
    {
      'name': {
        'es': 'Bacitracina + Neomicina sulfato',
        'ay': 'Bacitracina + Neomicina sulfato',
        'qu': 'Bacitracina + Neomicina sulfato',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/bacitracina_neomicina.jpg',
      'uses': {
        'es': 'Infecciones cutáneas y oculares',
        'ay': 'Janchi usuchawi piel ukat ñawi',
        'qu': 'Unancha piel y ñawi nanay',
      },
      'dose': {
        'es': 'Aplicar 2-3 veces al día en zona afectada',
        'ay': '2-3 kuti sapa uru janchi usuchawi marka',
        'qu': '2-3 kutilla punchawpi nanay marka',
      },
      'warnings': {
        'es': 'Sólo para uso externo',
        'ay': 'Janiw ukaxa jark\'aq apaniña',
        'qu': 'Ama ukaxa jark\'aq apaniña',
      },
    },
    {
      'name': {
        'es': 'Betametasona (fosfato)',
        'ay': 'Betametasona (fosfato)',
        'qu': 'Betametasona (fosfato)',
      }, // Nombre sin traducción
      'image': 'assets/images/medicamentos/betametasona.png',
      'uses': {
        'es': 'Inflamación y reacciones alérgicas',
        'ay': 'Janchi usuchawi ukat alergia',
        'qu': 'Unancha y alergia nanay',
      },
      'dose': {
        'es': 'Adultos: 0.5-9mg al día según gravedad',
        'ay': 'Jach\'a jaqinaka: 0.5-9mg sapa uru janchi usuchawi',
        'qu': 'Hatun runakuna: 0.5-9mg punchawpi nanay suti',
      },
      'warnings': {
        'es': 'No usar por largos periodos',
        'ay': 'Janiw jach\'a tiempo jilaña',
        'qu': 'Ama hatun tiempo upyaychu',
      },
    },
    {
      'name': {'es': 'Benznidazol', 'ay': 'Benznidazol', 'qu': 'Benznidazol'},
      'image': 'assets/images/medicamentos/benznidazol.png',
      'uses': {
        'es': 'Tratamiento de la enfermedad de Chagas',
        'ay': 'Chagas usumpi qullaña',
        'qu': 'Chagas unquyta hampina',
      },
      'dose': {
        'es': '5-7 mg/kg/día en dos dosis por 60 días',
        'ay': '5-7 mg/kg/uru, 60 uru pacha, paya waktimpi',
        'qu': '5-7 mg/kg punchawman, 60 punchawkuna, iskay kutilla',
      },
      'warnings': {
        'es': 'Evitar en embarazo. Vigilar efectos adversos.',
        'ay': 'Wawan utjani janiw apnaqañati. Ch\'ama uñjañataki.',
        'qu': 'Wawa uywanpi ama apaychu. Ñawirichiy llatunkuykuna.',
      },
    },
    {
      'name': {
        'es': 'Bupivacaína clorhidrato',
        'ay': 'Bupivacaína clorhidrato',
        'qu': 'Bupivacaína clorhidrato',
      },
      'image': 'assets/images/medicamentos/bupivacaína_clorhidrato.jpg',
      'uses': {
        'es': 'Anestesia local o regional',
        'ay': 'Anestesia ch\'ikata jan ukaxa',
        'qu': 'Anestesia llaqtapi utaq suyuypi',
      },
      'dose': {
        'es': 'Según procedimiento, hasta 2 mg/kg',
        'ay': 'Lurawinaka lurañataki, 2 mg/kg ukakamaraki',
        'qu': 'Rurayninkupi, 2 mg/kg kamarakama',
      },
      'warnings': {
        'es': 'Supervisar signos de toxicidad cardiovascular.',
        'ay': 'Ch\'ama qollqe luqtawi uñjaña.',
        'qu': 'Sonqon qʼomachiy rikhuykuna qhawariy.',
      },
    },
    {
      'name': {
        'es': 'Carbamazepina',
        'ay': 'Carbamazepina',
        'qu': 'Carbamazepina',
      },
      'image': 'assets/images/medicamentos/carbamazepina.jpg',
      'uses': {
        'es': 'Tratamiento de epilepsia y neuralgia',
        'ay': 'Epilepsia ukhamaraki nervionaka usumpi qullaña',
        'qu': 'Epilepsia wan ñut’umpi hampina',
      },
      'dose': {
        'es': '200-400 mg 2-3 veces al día',
        'ay': '200-400 mg 2-3 kuti sapa uru',
        'qu': '200-400 mg iskay-kimsa kutilla punchawpi',
      },
      'warnings': {
        'es': 'Monitorear función hepática. Evitar alcohol.',
        'ay': 'Janchi uñjaña wakispa. Janiw alcoholampi.',
        'qu': 'Rikuy wiksayuq llamkaynin. Ama alkulwanchu.',
      },
    },
    {
      'name': {'es': 'Cefazolina', 'ay': 'Cefazolina', 'qu': 'Cefazolina'},
      'image': 'assets/images/medicamentos/cefazolina.jpg',
      'uses': {
        'es': 'Infecciones bacterianas sensibles',
        'ay': 'Bakteria usunaka qullaña',
        'qu': 'Bakteriapi unquykuna hampina',
      },
      'dose': {
        'es': '500 mg a 1 g cada 8 horas IV o IM',
        'ay': '500 mg ukat 1 g sapa 8 ura, IV jan ukax IM',
        'qu': '500 mg utaq 1 g 8 urapi, IV utaq IM',
      },
      'warnings': {
        'es': 'Evitar en alergia a cefalosporinas.',
        'ay': 'Cefalosporina jani munañani jan apnaqaña.',
        'qu': 'Cefalosporinakuta manam munqakuykuchu.',
      },
    },
    {
      'name': {
        'es': 'Clindamicina',
        'ay': 'Clindamicina',
        'qu': 'Clindamicina',
      },
      'image': 'assets/images/medicamentos/clindamicina.jpg',
      'uses': {
        'es': 'Infecciones graves por bacterias anaerobias',
        'ay': 'Ch\'ama bakteria usunaka qullaña',
        'qu': 'Kani bakteriamanta unquykuna hampina',
      },
      'dose': {
        'es': '150-450 mg cada 6-8 horas',
        'ay': '150-450 mg sapa 6-8 ura',
        'qu': '150-450 mg 6-8 urapi',
      },
      'warnings': {
        'es': 'Riesgo de colitis pseudomembranosa.',
        'ay': 'Colitis ukjamaki jan wali usumpi k\'arisïna.',
        'qu': 'Colitis ch’ama llakiyuqmi kanan.',
      },
    },
    {
      'name': {
        'es': 'Clorfenamina',
        'ay': 'Clorfenamina',
        'qu': 'Clorfenamina',
      },
      'image': 'assets/images/medicamentos/clorfenamina.jpg',
      'uses': {
        'es': 'Alergias y resfriados',
        'ay': 'Alergianaka ukat usuchawi',
        'qu': 'Alergiyakuna wan chiri unquy',
      },
      'dose': {
        'es': '4 mg cada 4-6 horas',
        'ay': '4 mg sapa 4-6 ura',
        'qu': '4 mg 4-6 urapi',
      },
      'warnings': {
        'es': 'Puede causar somnolencia.',
        'ay': 'Ispaña jani wali ikthapiña churaña.',
        'qu': 'Puede ñawirichiy puñuyta.',
      },
    },
    {
      'name': {
        'es': 'Cotrimoxazol',
        'ay': 'Cotrimoxazol',
        'qu': 'Cotrimoxazol',
      },
      'image': 'assets/images/medicamentos/cotrimoxazol.jpg',
      'uses': {
        'es': 'Infecciones urinarias, respiratorias y gastrointestinales',
        'ay': 'Q’umi, samka ukat manq’a thakhi usunaka',
        'qu': 'Wiksay, samay wan mikuy ñanpi unquykuna',
      },
      'dose': {
        'es': '1 tableta cada 12 horas',
        'ay': '1 tableta sapa 12 ura',
        'qu': '1 pillku 12 urapi',
      },
      'warnings': {
        'es': 'Evitar en alergias a sulfas.',
        'ay': 'Sulfa munañanakanxa jani apnaqaña.',
        'qu': 'Sulfa manam munqakuykunapita ama apaychu.',
      },
    },
    {
      'name': {
        'es': 'Cianocobalamina',
        'ay': 'Cianocobalamina',
        'qu': 'Cianocobalamina',
      },
      'image': 'assets/images/medicamentos/Cianocobalamina.jpg',
      'uses': {
        'es': 'Tratamiento de deficiencia de vitamina B12',
        'ay': 'Vitamin B12 jani wali uñjasiñampi qullaña',
        'qu': 'Vitamin B12 pisi kaptin hampina',
      },
      'dose': {
        'es': '1000 mcg IM mensual o según indicación médica',
        'ay': '1000 mcg IM sapa phaxsi jan ukax qollan arunakampi',
        'qu': '1000 mcg IM killa sapa kuti utaq hampikuq willayninta',
      },
      'warnings': {
        'es': 'Puede causar enrojecimiento o dolor en el sitio de inyección.',
        'ay': 'Ch’ankha, wali ch’amanchawi injekción utjki ukana.',
        'qu': 'Ch’umpiykuy utaq nanay injeksyón llaqtanpi.',
      },
    },
    {
      'name': {
        'es': 'Dexametasona',
        'ay': 'Dexametasona',
        'qu': 'Dexametasona',
      },
      'image': 'assets/images/medicamentos/dexametasona.jpg',
      'uses': {
        'es': 'Inflamación, alergias y enfermedades autoinmunes',
        'ay': 'Phuyt’awi, alergianaka ukat jani wali janchi apnaqawi',
        'qu': 'Phutuy, alergiyakunawan janchipa ch’usaq llamkaynin',
      },
      'dose': {
        'es': '0.5 a 10 mg al día según necesidad',
        'ay': '0.5-10 mg sapa uru, wakisiñatakixa',
        'qu': '0.5-10 mg punchawman, munasqankama',
      },
      'warnings': {
        'es': 'Uso prolongado puede causar efectos adversos graves.',
        'ay': 'Juk’ampi apnaqawinxa ch’ama jan wali uñjañaniwa.',
        'qu': 'Sasalla apaykiptinqa ch’ama llatunkuykuna kanan.',
      },
    },
    {
      'name': {'es': 'Diazepam', 'ay': 'Diazepam', 'qu': 'Diazepam'},
      'image': 'assets/images/medicamentos/diazepam.png',
      'uses': {
        'es': 'Ansiedad, convulsiones, relajante muscular',
        'ay': 'Pisht’a, ch’ajwaña, ukat ch’ama jaqañataki',
        'qu': 'Pishtay, chinkachiy, kallpachayuk jamuqachiy',
      },
      'dose': {
        'es': '2-10 mg 2-4 veces al día',
        'ay': '2-10 mg 2-4 kuti sapa uru',
        'qu': '2-10 mg iskay-tawa kutilla punchawpi',
      },
      'warnings': {
        'es': 'Puede causar dependencia. No mezclar con alcohol.',
        'ay': 'Janiw wakiskiti walja kuti apnaqaña. Janiw alcoholampi.',
        'qu': 'Rikuy manchakuyta apachiy. Ama alkulwan mistuychu.',
      },
    },
    {
      'name': {'es': 'Diclofenaco', 'ay': 'Diclofenaco', 'qu': 'Diclofenaco'},
      'image': 'assets/images/medicamentos/diclofenaco.png',
      'uses': {
        'es': 'Dolor e inflamación',
        'ay': 'Ch\'amanchawi ukat phuyt’awi',
        'qu': 'Nanay wan phutuy',
      },
      'dose': {
        'es': '50-100 mg 2-3 veces al día',
        'ay': '50-100 mg 2-3 kuti sapa uru',
        'qu': '50-100 mg iskay-kimsa kutilla punchawpi',
      },
      'warnings': {
        'es': 'Evitar en úlceras gástricas o sangrado digestivo.',
        'ay': 'Estómago usunaka ukaxa janiw apnaqañati.',
        'qu': 'Wiksay unquywan utaq yawarninwan ama apaychu.',
      },
    },
    {
      'name': {
        'es': 'Dicloxacilina sódica',
        'ay': 'Dicloxacilina sódica',
        'qu': 'Dicloxacilina sódica',
      },
      'image': 'assets/images/medicamentos/dicloxacilina.jpg',
      'uses': {
        'es': 'Infecciones por bacterias gram positivas',
        'ay': 'Bakterianaka (gram +) usunaka qullaña',
        'qu': 'Gram positivo bakteriamanta unquykuna',
      },
      'dose': {
        'es': '250-500 mg cada 6 horas',
        'ay': '250-500 mg sapa 6 ura',
        'qu': '250-500 mg 6 urapi',
      },
      'warnings': {
        'es': 'Tomar con el estómago vacío.',
        'ay': 'Manq’a jani utjki ukjaw churaña.',
        'qu': 'Mana mikhuspa churay.',
      },
    },
    {
      'name': {
        'es': 'Enalapril maleato',
        'ay': 'Enalapril maleato',
        'qu': 'Enalapril maleato',
      },
      'image': 'assets/images/medicamentos/enalapril_maleato.jpg',
      'uses': {
        'es': 'Hipertensión y enfermedades cardíacas',
        'ay': 'Jach’a wila ch\'amampi ukat chuymampi usunaka',
        'qu': 'Wilanakuy jach’a, sonqon unquykuna',
      },
      'dose': {
        'es': '5-20 mg una vez al día',
        'ay': '5-20 mg sapa uru, mä kuti',
        'qu': '5-20 mg punchawman huk kuti',
      },
      'warnings': {
        'es': 'Vigilar presión arterial. Puede causar tos.',
        'ay': 'Wila ch\'am uñjaña. Asunaka utjaniwa.',
        'qu': 'Ñawirichiy wilanakuy. Asiyta apamullaq.',
      },
    },
    {
      'name': {
        'es': 'Espironolactona',
        'ay': 'Espironolactona',
        'qu': 'Espironolactona',
      },
      'image': 'assets/images/medicamentos/Espironolactona.jpg',
      'uses': {
        'es': 'Hipertensión y retención de líquidos',
        'ay': 'Jach’a wila ch’ama ukat uma jark’awi',
        'qu': 'Wilanakuy jach’a wan yaku jamuy',
      },
      'dose': {
        'es': '25-100 mg al día según necesidad',
        'ay': '25-100 mg sapa uru, wakisiñatakixa',
        'qu': '25-100 mg punchawman, munasqankama',
      },
      'warnings': {
        'es': 'Monitorear niveles de potasio.',
        'ay': 'Potasiona ch’ama uñjaña.',
        'qu': 'Kallpa qallwin qhatuña rikuy.',
      },
    },
    {
      'name': {'es': 'Fenitoína', 'ay': 'Fenitoína', 'qu': 'Fenitoína'},
      'image': 'assets/images/medicamentos/fenitoina.jpg',
      'uses': {
        'es': 'Control de convulsiones (epilepsia)',
        'ay': 'Ch’ajwañanakana kontrol',
        'qu': 'Chinkachiy (epilepsia) chʼuray',
      },
      'dose': {
        'es': '100 mg 2-3 veces al día',
        'ay': '100 mg 2-3 kuti sapa uru',
        'qu': '100 mg iskay-kimsa kutilla punchawpi',
      },
      'warnings': {
        'es': 'Puede causar somnolencia y alteraciones de encías.',
        'ay': 'Ikthapiña ukat laq’anakan jan wali uñjañani.',
        'qu': 'Puñuyta wan kirupi wakichiyta apamullaq.',
      },
    },
    {
      'name': {'es': 'Fentanilo', 'ay': 'Fentanilo', 'qu': 'Fentanilo'},
      'image': 'assets/images/medicamentos/fentanilo.png',
      'uses': {
        'es': 'Dolor severo, anestesia',
        'ay': 'Ch’amanchawi jach’a, anestesia',
        'qu': 'Jach’a nanay, anestesia',
      },
      'dose': {
        'es': 'Según indicación médica (IV o parche)',
        'ay': 'Qollan arunakampi, IV jan ukax parche',
        'qu': 'Hampikuq willayninta, IV utaq parchepi',
      },
      'warnings': {
        'es': 'Riesgo de depresión respiratoria y dependencia.',
        'ay': 'Samka jark’aña jan wali, ukat wakiskiriña.',
        'qu': 'Samay jark’aykuywan wan manchakuyta apamullaq.',
      },
    },
    {
      'name': {'es': 'Fluconazol', 'ay': 'Fluconazol', 'qu': 'Fluconazol'},
      'image': 'assets/images/medicamentos/fluconazol.jpg',
      'uses': {
        'es': 'Infecciones por hongos (candidiasis)',
        'ay': 'Hongonaka usunaka (candidiasis)',
        'qu': 'K’allampa unquykuna (candidiasis)',
      },
      'dose': {
        'es': '150 mg dosis única oral',
        'ay': '150 mg mä kuti ñut’awi',
        'qu': '150 mg huk kutilla ñut’uy',
      },
      'warnings': {
        'es': 'Evitar con otros medicamentos hepatotóxicos.',
        'ay': 'Janiw janchi usuchiri qullinaka apnaqaña.',
        'qu': 'Ama wiksachay qullinakawan mistuychu.',
      },
    },
    {
      'name': {'es': 'Fluoxetina', 'ay': 'Fluoxetina', 'qu': 'Fluoxetina'},
      'image': 'assets/images/medicamentos/fluoxetina.jpg',
      'uses': {
        'es': 'Depresión, ansiedad, trastornos obsesivos',
        'ay': 'Manchawi, pisht’a, ukat jamuqaña usunaka',
        'qu': 'Llaki, pishtay, jamuqay unquykuna',
      },
      'dose': {
        'es': '20-60 mg al día',
        'ay': '20-60 mg sapa uru',
        'qu': '20-60 mg punchawman',
      },
      'warnings': {
        'es': 'Puede tardar semanas en hacer efecto.',
        'ay': 'Juk’ampi simananakan ch’amaniwa.',
        'qu': 'Sapa semana llamk’anapaq chaylla.',
      },
    },
    {
      'name': {'es': 'Furosemida', 'ay': 'Furosemida', 'qu': 'Furosemida'},
      'image': 'assets/images/medicamentos/furosemida.png',
      'uses': {
        'es': 'Diurético, elimina exceso de líquidos',
        'ay': 'Diurético, uma jilt\'ata apaqaña',
        'qu': 'Diurético, yaku juk’ampi apachiy',
      },
      'dose': {
        'es': '20-80 mg al día según respuesta',
        'ay': '20-80 mg sapa uru, k’umata uñjañampi',
        'qu': '20-80 mg punchawman, rikuykunaman chura',
      },
      'warnings': {
        'es': 'Controlar electrolitos y presión arterial.',
        'ay': 'Elektrólito ukat wila ch\'am uñjaña.',
        'qu': 'Elektrolitokuna wan wilanakuy qhatuña.',
      },
    },
    {
      'name': {
        'es': 'Heparina sódica',
        'ay': 'Heparina sódica',
        'qu': 'Heparina sódica',
      },
      'image': 'assets/images/medicamentos/heparina_sodica.jpg',
      'uses': {
        'es': 'Prevención de coágulos sanguíneos',
        'ay': 'Wilanaka q’añuchawi jark’aña',
        'qu': 'Yawarnin qhuchuy jark’ay',
      },
      'dose': {
        'es': '5000 UI cada 8-12 horas SC o IV',
        'ay': '5000 UI sapa 8-12 ura, SC jan ukax IV',
        'qu': '5000 UI 8-12 urapi, SC utaq IV',
      },
      'warnings': {
        'es': 'Riesgo de sangrado. Monitorear coagulación.',
        'ay': 'Wilanaka mistuña ch’ama. Qhuchuy uñjaña.',
        'qu': 'Yawarnin mistuyta ch’ama. Qhuchuykuy qhatuña.',
      },
    },
    {
      'name': {
        'es': 'Hidrocortisona succinato sódico',
        'ay': 'Hidrocortisona succinato sódico',
        'qu': 'Hidrocortisona succinato sódico',
      },
      'image': 'assets/images/medicamentos/hidrocortisona_succinato_sodico.jpg',
      'uses': {
        'es': 'Inflamación severa, alergias, crisis suprarrenal',
        'ay': 'Jach’a phuyt’awi, alergianaka, suprarrenal chiji',
        'qu': 'Jach’a phutuy, alérgico unquy, ñañay urayñiq ruq’uy',
      },
      'dose': {
        'es': '100-500 mg IV según indicación',
        'ay': '100-500 mg IV, qollan arunakampi',
        'qu': '100-500 mg IV hampiq willayninta',
      },
      'warnings': {
        'es': 'Usar con control médico. Puede causar inmunosupresión.',
        'ay': 'Qollan uñjawi ukampi apnaqaña. Janchi jark’aña ch’amancht’i.',
        'qu': 'Hampiq qhatuypi apay. Imnuy ch’ullquyta qochuy.',
      },
    },
    {
      'name': {
        'es': 'Hidroclorotiazida',
        'ay': 'Hidroclorotiazida',
        'qu': 'Hidroclorotiazida',
      },
      'image': 'assets/images/medicamentos/hidroclorotiazida.jpg',
      'uses': {
        'es': 'Hipertensión y retención de líquidos',
        'ay': 'Wila jach’achawi ukat uma jark’awi',
        'qu': 'Wilanakuy jach’a wan yaku jamuy',
      },
      'dose': {
        'es': '12.5-50 mg al día',
        'ay': '12.5-50 mg sapa uru',
        'qu': '12.5-50 mg punchawman',
      },
      'warnings': {
        'es': 'Controlar electrolitos y presión arterial.',
        'ay': 'Elektrólitonaka ukat wila ch’amampi uñjaña.',
        'qu': 'Elektrolitokuna wan wilanakuy qhatuña.',
      },
    },
    {
      'name': {'es': 'Ibuprofeno', 'ay': 'Ibuprofeno', 'qu': 'Ibuprofeno'},
      'image': 'assets/images/medicamentos/Ibuprofeno.jpg',
      'uses': {
        'es': 'Dolor, fiebre e inflamación',
        'ay': 'Ch’amanchawi, jakhu ukat phuyt’awi',
        'qu': 'Nanay, rupha, phutuy',
      },
      'dose': {
        'es': '200-400 mg cada 6-8 horas',
        'ay': '200-400 mg sapa 6-8 ura',
        'qu': '200-400 mg 6-8 urapi',
      },
      'warnings': {
        'es': 'Evitar uso prolongado. Puede afectar estómago.',
        'ay': 'Janiw juk’a pachakama apnaqañati. Estómagota usuchiy.',
        'qu': 'Ama llasaqta apaychu. Wiksayta unquychiyta atin.',
      },
    },
    {
      'name': {
        'es': 'Insulina recombinante humana NPH',
        'ay': 'Insulina recombinante humana NPH',
        'qu': 'Insulina recombinante humana NPH',
      },
      'image':
          'assets/images/medicamentos/insulina_recombinante_humana_nph.jpg',
      'uses': {
        'es': 'Control de diabetes',
        'ay': 'Diabetes usuchaña',
        'qu': 'Diabetes unquyta qhatuña',
      },
      'dose': {
        'es': 'Dosis individual según glicemia',
        'ay': 'Glicemianakampi uñjaña, sapa jaqinpachpa',
        'qu': 'Ñañay yawarninmanta chura, sapa runaman',
      },
      'warnings': {
        'es': 'Controlar azúcar en sangre. Riesgo de hipoglicemia.',
        'ay': 'Wilanaka q’amani uñjaña. Glicemia jani utjkaspasa.',
        'qu': 'Ñañay yawarnin qhatuña. Hipoglucemia manchari.',
      },
    },
    {
      'name': {'es': 'Ketorolaco', 'ay': 'Ketorolaco', 'qu': 'Ketorolaco'},
      'image': 'assets/images/medicamentos/ketorolaco.jpg',
      'uses': {
        'es': 'Dolor moderado a severo',
        'ay': 'Tantiyäwi ch’ama ukat jach’a',
        'qu': 'Ñawpaq nanay, jach’a nanay',
      },
      'dose': {
        'es': '10 mg cada 6 horas (oral o IM)',
        'ay': '10 mg sapa 6 ura, ñut’awi jan ukax IM',
        'qu': '10 mg 6 urapi, ñut’uy utaq IM',
      },
      'warnings': {
        'es': 'Evitar en pacientes con úlceras o sangrado.',
        'ay': 'Janiw estómago usuni jaqinakataki apnaqañati.',
        'qu': 'Ama wiksay unquykunapi apaychu.',
      },
    },
    {
      'name': {
        'es': 'Levodopa + Carbidopa',
        'ay': 'Levodopa + Carbidopa',
        'qu': 'Levodopa + Carbidopa',
      },
      'image': 'assets/images/medicamentos/levodopa_carbidopa.jpg',
      'uses': {
        'es': 'Tratamiento de Parkinson',
        'ay': 'Parkinson usuta qullaña',
        'qu': 'Parkinson unquyta hampiy',
      },
      'dose': {
        'es': '250/25 mg 3-4 veces al día',
        'ay': '250/25 mg 3-4 kuti sapa uru',
        'qu': '250/25 mg kimsa-tawa kutilla punchawpi',
      },
      'warnings': {
        'es': 'Puede causar movimientos involuntarios y náuseas.',
        'ay': 'Jani munañamp ch’iqtawi ukat chuyma chhijchhisiña.',
        'qu': 'Mana munaywan kuyuy, chhinkayta apamullaq.',
      },
    },
    {
      'name': {
        'es': 'Levofloxacina',
        'ay': 'Levofloxacina',
        'qu': 'Levofloxacina',
      },
      'image': 'assets/images/medicamentos/levofloxacina.jpg',
      'uses': {
        'es': 'Infecciones respiratorias, urinarias y de piel',
        'ay': 'Samka, ch\'aqui ukat uma thakhi usunaka',
        'qu': 'Samay ñan, yakupi, llaqsakunapi unquykuna',
      },
      'dose': {
        'es': '250-750 mg al día según infección',
        'ay': '250-750 mg sapa uru, usuta uñjaña',
        'qu': '250-750 mg punchawman, unquyman qhatuña',
      },
      'warnings': {
        'es': 'Evitar exposición al sol. Puede dañar tendones.',
        'ay': 'Inti qhantati jani apnaqaña. T’iqinaka usuchiy.',
        'qu':
            'Inti qhantapi ama sutinchiychu. Ch’iqchi qillqakuna unquychiyta atin.',
      },
    },
    {
      'name': {'es': 'Metformina', 'ay': 'Metformina', 'qu': 'Metformina'},
      'image': 'assets/images/medicamentos/metformina.jpg',
      'uses': {
        'es': 'Diabetes tipo 2',
        'ay': 'Diabetes tipo 2 qullaña',
        'qu': 'Diabetes kasta 2 hampiy',
      },
      'dose': {
        'es': '500-1000 mg 2-3 veces al día con comida',
        'ay': '500-1000 mg 2-3 kuti manq’añampi',
        'qu': '500-1000 mg iskay-kimsa kutilla mikhunawan',
      },
      'warnings': {
        'es': 'Tomar con alimentos. Puede causar malestar estomacal.',
        'ay': 'Manq’anakampi churaña. Estómagota jan wali uñjañani.',
        'qu': 'Mikhunawan churay. Wiksapi ch’inkayta apamullaq.',
      },
    },
    {
      'name': {
        'es': 'Metoclopramida',
        'ay': 'Metoclopramida',
        'qu': 'Metoclopramida',
      },
      'image': 'assets/images/medicamentos/metoclopramida.jpg',
      'uses': {
        'es': 'Náuseas y vómitos',
        'ay': 'Chhijchhisiña ukat lunthataña',
        'qu': 'Ch’inkay ukat wiksuy',
      },
      'dose': {
        'es': '10 mg 3 veces al día antes de comidas',
        'ay': '10 mg 3 kuti sapa uru manq’añata qhipa',
        'qu': '10 mg kimsa kuti punchawpi mikhunata ñawpaq',
      },
      'warnings': {
        'es': 'Puede causar somnolencia y movimientos anormales.',
        'ay': 'Ikthapiñani ukat jan wali kuyunakani.',
        'qu': 'Puñuyta, kuyurikuqkunata apamullaq.',
      },
    },
    {
      'name': {'es': 'Midazolam', 'ay': 'Midazolam', 'qu': 'Midazolam'},
      'image': 'assets/images/medicamentos/midazolam.jpg',
      'uses': {
        'es': 'Sedación, ansiedad, convulsiones',
        'ay': 'Saminchawi, manchawi, ch’ajwaña',
        'qu': 'Samachiy, manchakuy, chinkachiy',
      },
      'dose': {
        'es': '0.5-2 mg IV o IM según necesidad',
        'ay': '0.5-2 mg IV jan ukax IM, wakisiñata',
        'qu': '0.5-2 mg IV utaq IM, munasqankama',
      },
      'warnings': {
        'es': 'Puede deprimir respiración. Uso hospitalario.',
        'ay': 'Samka jark’aña ch’ama. Hospitalan apnaqaña.',
        'qu': 'Samay jark’ayta apamullaq. Qollana wasipi apay.',
      },
    },
    {
      'name': {'es': 'Morfina', 'ay': 'Morfina', 'qu': 'Morfina'},
      'image': 'assets/images/medicamentos/morfina.jpg',
      'uses': {
        'es': 'Dolor severo, cuidados paliativos',
        'ay': 'Jach’a ch’amanchawi, qullaña apnaqawi',
        'qu': 'Jach’a nanay, ñawinchay hampiy',
      },
      'dose': {
        'es': '2.5-10 mg cada 4 horas (IV/IM/SC)',
        'ay': '2.5-10 mg sapa 4 ura (IV/IM/SC)',
        'qu': '2.5-10 mg tawa urapi (IV/IM/SC)',
      },
      'warnings': {
        'es': 'Riesgo de depresión respiratoria y adicción.',
        'ay': 'Samka jark’awi ukat usuchawi ch’aman.',
        'qu': 'Samay jark’ay, manchakuy ima ch’ullquyta apamullaq.',
      },
    },
    {
      'name': {
        'es': 'Nafazolina clorhidrato',
        'ay': 'Nafazolina clorhidrato',
        'qu': 'Nafazolina clorhidrato',
      },
      'image': 'assets/images/medicamentos/nafazolina_clorhidrato.jpg',
      'uses': {
        'es': 'Congestión nasal, irritación ocular',
        'ay': 'Nasa jisk’achawi, nayra ch’akhaña',
        'qu': 'Sinqa phukuy, ñawi ch’aki',
      },
      'dose': {
        'es': '1-2 gotas en cada ojo o fosa nasal cada 6 horas',
        'ay': '1-2 gota sapa nayrampi jan ukax sinqampi',
        'qu': '1-2 qataru sapa ñawiman utaq sinqaman',
      },
      'warnings': {
        'es': 'Evitar uso prolongado. Puede causar rebote.',
        'ay': 'Janiw juk’a pachakama apnaqañati. Kutt’añani.',
        'qu': 'Ama llasaqta apaychu. Kutt’ariyta apamullaq.',
      },
    },
    {
      'name': {
        'es': 'Nitazoxanida',
        'ay': 'Nitazoxanida',
        'qu': 'Nitazoxanida',
      },
      'image': 'assets/images/medicamentos/nitazoxanida.jpg',
      'uses': {
        'es': 'Parasitosis intestinal',
        'ay': 'Chaka parasitonaka',
        'qu': 'Wiksay supaykuna',
      },
      'dose': {
        'es': '500 mg cada 12 horas por 3 días',
        'ay': '500 mg sapa 12 ura kimsa uru',
        'qu': '500 mg iskay chunka urapi kimsa punchaw',
      },
      'warnings': {
        'es': 'Tomar con alimentos. Puede causar náuseas.',
        'ay': 'Manq’añampi churaña. Chhijchhisiñani.',
        'qu': 'Mikhunawan churay. Ch’inkayta apamullaq.',
      },
    },
    {
      'name': {
        'es': 'Nitrofurantoína',
        'ay': 'Nitrofurantoína',
        'qu': 'Nitrofurantoína',
      },
      'image': 'assets/images/medicamentos/nitrofurantoina.jpg',
      'uses': {
        'es': 'Infecciones urinarias',
        'ay': 'Uma thakhi usunaka',
        'qu': 'Yakuñan unquykuna',
      },
      'dose': {
        'es': '100 mg cada 6 horas por 7 días',
        'ay': '100 mg sapa 6 ura, paqallqo uru',
        'qu': '100 mg suqta urapi, qanchis punchaw',
      },
      'warnings': {
        'es': 'No usar en insuficiencia renal severa.',
        'ay': 'Janiw jach’a umampi q’iwisanakata apnaqañati.',
        'qu': 'Ama juk’uy yaku sunquykunapi apaychu.',
      },
    },
    {
      'name': {'es': 'Nifedipino', 'ay': 'Nifedipino', 'qu': 'Nifedipino'},
      'image': 'assets/images/medicamentos/nifedipino.jpg',
      'uses': {
        'es': 'Hipertensión, angina de pecho',
        'ay': 'Wila jach’achawi, amaya chuymani',
        'qu': 'Wilanakuy jach’a, sunqu ñawchay',
      },
      'dose': {
        'es': '10-30 mg cada 8-12 horas',
        'ay': '10-30 mg sapa 8-12 ura',
        'qu': '10-30 mg 8-12 urapi',
      },
      'warnings': {
        'es': 'Puede causar dolor de cabeza, enrojecimiento.',
        'ay': 'Pichu ch’amanchawi, chuyma wila.',
        'qu': 'Uma nanay, k’ayra puka kachkan.',
      },
    },
    {
      'name': {'es': 'Omeprazol', 'ay': 'Omeprazol', 'qu': 'Omeprazol'},
      'image': 'assets/images/medicamentos/omeprazol.jpg',
      'uses': {
        'es': 'Gastritis, reflujo, úlcera gástrica',
        'ay': 'Estómago usuchawi, q’iwita kuttaña',
        'qu': 'Wiksa unquy, kutiykuy, umay ukhuña',
      },
      'dose': {
        'es': '20-40 mg una vez al día antes del desayuno',
        'ay': '20-40 mg sapa uru, manq’aña qhipa',
        'qu': '20-40 mg sapa punchawmi, mikhunata ñawpaq',
      },
      'warnings': {
        'es': 'Uso prolongado puede causar deficiencia de B12.',
        'ay': 'Juk’a pachakama apnaqawi, B12 ch’amanchawin jani.',
        'qu': 'Llasaqta apaykaspas, B12 mana ch’ulla kani.',
      },
    },
    {
      'name': {'es': 'Paracetamol', 'ay': 'Paracetamol', 'qu': 'Paracetamol'},
      'image': 'assets/images/medicamentos/paracetamol.jpg',
      'uses': {
        'es': 'Fiebre y dolor leve a moderado',
        'ay': 'Jakhu ukat tantiyäwi suyt’a',
        'qu': 'Rupha wan ñawpaq nanay',
      },
      'dose': {
        'es': '500-1000 mg cada 6-8 horas',
        'ay': '500-1000 mg sapa 6-8 ura',
        'qu': '500-1000 mg 6-8 urapi',
      },
      'warnings': {
        'es': 'No exceder 4g/día. Puede dañar el hígado.',
        'ay': 'Janiw 4g uru sapa apnaqañati. Q’iwita usuchiy.',
        'qu': 'Ama 4g punchaw pachapi ch’usaychu. Q’iwiyta unquychiy.',
      },
    },
    {
      'name': {'es': 'Prednisona', 'ay': 'Prednisona', 'qu': 'Prednisona'},
      'image': 'assets/images/medicamentos/prednisona.jpg',
      'uses': {
        'es': 'Inflamaciones, alergias, autoinmunes',
        'ay': 'Phuyt’awinaka, alergianaka, janchi jark’aña',
        'qu': 'Phutuy, alérgico, janchita jark’ariy',
      },
      'dose': {
        'es': '5-60 mg al día según enfermedad',
        'ay': '5-60 mg sapa uru, usuta uñjaña',
        'qu': '5-60 mg punchawman, unquyman qhatuña',
      },
      'warnings': {
        'es': 'Usar bajo control médico. No suspender de golpe.',
        'ay': 'Qollan uñjawi ukampi apnaqaña. Janiw alay chhaqt’añati.',
        'qu': 'Hampiqnin uyariwan apay. Ama kutkatamanta saqeychu.',
      },
    },
    {
      'name': {'es': 'Propranolol', 'ay': 'Propranolol', 'qu': 'Propranolol'},
      'image': 'assets/images/medicamentos/propranolol.jpg',
      'uses': {
        'es': 'Hipertensión, arritmia, ansiedad',
        'ay': 'Wila jach’achawi, jani wali chuyma purt’awi, manchawi',
        'qu': 'Wilanakuy jach’a, sunqu qullqiqa manaraq, manchakuy',
      },
      'dose': {
        'es': '20-40 mg 2-3 veces al día',
        'ay': '20-40 mg 2-3 kuti sapa uru',
        'qu': '20-40 mg iskay-kimsa kuti punchawpi',
      },
      'warnings': {
        'es': 'Evitar en asma y bradicardia.',
        'ay': 'Janiw asma ukat chuyma lasi purt’awinakata apnaqañati.',
        'qu': 'Ama asmayuqkunapi, sunqu samichaykunapi apaychu.',
      },
    },
    {
      'name': {
        'es': 'Quinina (bisulfato o sulfato)',
        'ay': 'Quinina',
        'qu': 'Quinina',
      },
      'image': 'assets/images/medicamentos/quinina.png',
      'uses': {
        'es': 'Malaria (paludismo)',
        'ay': 'Paludismo qullaña',
        'qu': 'Malaria hampiy',
      },
      'dose': {
        'es': '500-650 mg cada 8 horas por 7 días',
        'ay': '500-650 mg sapa 8 ura, paqallqo uru',
        'qu': '500-650 mg 8 urapi, qanchis punchaw',
      },
      'warnings': {
        'es': 'Puede causar zumbido, náuseas, visión borrosa.',
        'ay': 'P’iqi suyt’awi, chuyma chhijchhisiña, jani wali uñjaña.',
        'qu': 'Umasiñawi, ch’inkay, ñawiyta chhinkachiy.',
      },
    },
    {
      'name': {'es': 'Ranitidina', 'ay': 'Ranitidina', 'qu': 'Ranitidina'},
      'image': 'assets/images/medicamentos/ranitidina.jpg',
      'uses': {
        'es': 'Úlceras gástricas, reflujo, acidez',
        'ay': 'Umampi ch’akhañawi, q’iwita kuttaña',
        'qu': 'Umay ukhuña, kutiykuy, k’allchay',
      },
      'dose': {
        'es': '150 mg 2 veces al día',
        'ay': '150 mg paya kuti sapa uru',
        'qu': '150 mg iskay kuti punchawpi',
      },
      'warnings': {
        'es': 'Uso prolongado debe ser supervisado.',
        'ay': 'Juk’a pachakama apnaqawi uñjatañapa.',
        'qu': 'Llasaqta apaykaspas hampiqnin uñjanan.',
      },
    },
    {
      'name': {'es': 'Rifampicina', 'ay': 'Rifampicina', 'qu': 'Rifampicina'},
      'image': 'assets/images/medicamentos/rifampicina.jpg',
      'uses': {
        'es': 'Tuberculosis, infecciones bacterianas',
        'ay': 'Chhijchhi usuchawi, bacterianaka usuchawi',
        'qu': 'Q’iqicha, bakteria unquykuna',
      },
      'dose': {
        'es': '600 mg una vez al día en ayunas',
        'ay': '600 mg sapa uru manq’at janïr',
        'qu': '600 mg punchawman mana mikhuykuyta',
      },
      'warnings': {
        'es':
            'Puede teñir la orina de color rojo. Interacciones medicamentosas.',
        'ay': 'Q’iwita wila uñt’ayapxani. Kulli jikxatasiwa.',
        'qu': 'Yaku pukaña tukuchkan. Hampiykuna ch’iqchiynin.',
      },
    },
    {
      'name': {'es': 'Salbutamol', 'ay': 'Salbutamol', 'qu': 'Salbutamol'},
      'image': 'assets/images/medicamentos/salbutamol.png',
      'uses': {
        'es': 'Asma, broncoespasmo',
        'ay': 'Asma, samka jark’aña',
        'qu': 'Asma, samay jark’ay',
      },
      'dose': {
        'es': '1-2 inhalaciones cada 4-6 horas',
        'ay': '1-2 samka manq’awi sapa 4-6 ura',
        'qu': '1-2 samay mikhuna 4-6 urapi',
      },
      'warnings': {
        'es': 'Puede causar temblores o palpitaciones.',
        'ay': 'Thayaña ukat chuyma ch’iwjañani.',
        'qu': 'Tukuykuy, sunqu k’illikuyta apamullaq.',
      },
    },
    {
      'name': {'es': 'Sildenafil', 'ay': 'Sildenafil', 'qu': 'Sildenafil'},
      'image': 'assets/images/medicamentos/sildenafil.jpg',
      'uses': {
        'es': 'Disfunción eréctil, hipertensión pulmonar',
        'ay': 'Jani wali qamasawi, samka wila jach’achawi',
        'qu': 'Manaraq kallpay, samay ñiqi jach’a',
      },
      'dose': {
        'es': '50 mg 1 hora antes de la actividad sexual',
        'ay': '50 mg 1 ura nayrïri qamasawi ukata',
        'qu': '50 mg huk ura ñawpaq munanakuyta',
      },
      'warnings': {
        'es': 'No usar con nitratos. Riesgo de hipotensión.',
        'ay': 'Janiw nitrato ukampi apnaqañati. Wila jani ch’amani.',
        'qu': 'Ama nitratowan apaychu. Llullasapa ñiqi ch’ulla.',
      },
    },
    {
      'name': {'es': 'Simeticona', 'ay': 'Simeticona', 'qu': 'Simeticona'},
      'image': 'assets/images/medicamentos/simeticona.jpg',
      'uses': {
        'es': 'Gases intestinales, distensión abdominal',
        'ay': 'Chaka jach’a phuyu, purapanka phuqaña',
        'qu': 'Wiksay phuyu, wiksapay p’uchuy',
      },
      'dose': {
        'es': '40-125 mg después de las comidas',
        'ay': '40-125 mg manq’añat qhipa',
        'qu': '40-125 mg mikhuykuna qhipapi',
      },
      'warnings': {
        'es': 'No exceder la dosis indicada.',
        'ay': 'Janiw juk’ampi churapxañati.',
        'qu': 'Ama allinta churaqta jithikiymuychu.',
      },
    },
    {
      'name': {
        'es': 'Tetraciclina',
        'ay': 'Tetraciclina',
        'qu': 'Tetraciclina',
      },
      'image': 'assets/images/medicamentos/tetraciclina.jpg',
      'uses': {
        'es': 'Infecciones bacterianas, acné',
        'ay': 'Bacteria usuchawi, ch’akha ch’unu',
        'qu': 'Bakteria unquy, ñawi ch’unu',
      },
      'dose': {
        'es': '250-500 mg cada 6 horas',
        'ay': '250-500 mg sapa 6 ura',
        'qu': '250-500 mg suqta urapi',
      },
      'warnings': {
        'es': 'Evitar en embarazo y niños menores de 8 años.',
        'ay': 'Janiw ususi ukat wawankama 8 mara apnaqañati.',
        'qu': 'Ama ususiwan, ñawpaq 8 wata wawakunapi.',
      },
    },
    {
      'name': {
        'es': 'Timolol maleato',
        'ay': 'Timolol maleato',
        'qu': 'Timolol maleato',
      },
      'image': 'assets/images/medicamentos/timolol_maleato.jpg',
      'uses': {
        'es': 'Glaucoma, presión ocular alta',
        'ay': 'Nayra jach’a jiwra, wila nayra',
        'qu': 'Ñawi qollari, ñawi jach’a ñiqi',
      },
      'dose': {
        'es': '1 gota en cada ojo 2 veces al día',
        'ay': '1 gota sapa nayrampi paya kuti sapa uru',
        'qu': '1 qataru sapa ñawiman iskay kuti punchawpi',
      },
      'warnings': {
        'es': 'Evitar en asma y bradicardia.',
        'ay': 'Asmanaka ukat chuyma lasi purt’anaka jani.',
        'qu': 'Asmawan utaq sunqu lliw kaykunapi ama apaychu.',
      },
    },
    {
      'name': {'es': 'Valproato', 'ay': 'Valproato', 'qu': 'Valproato'},
      'image': 'assets/images/medicamentos/valproato.png',
      'uses': {
        'es': 'Epilepsia, trastorno bipolar',
        'ay': 'Kallta ch’ajwaña, paya chuyma',
        'qu': 'Kallpay, iskay sunqu ch’uyanchay',
      },
      'dose': {
        'es': '10-15 mg/kg/día (ajustado)',
        'ay': '10-15 mg/kg/uru (wakt’ata)',
        'qu': '10-15 mg/kg/punchaw (uyarichiq)',
      },
      'warnings': {
        'es': 'Puede afectar el hígado y causar somnolencia.',
        'ay': 'Q’iwita usuchiyani, llakt’aña churaraki.',
        'qu': 'Q’iwiyta unquychiy, puñuyta munachiy.',
      },
    },
    {
      'name': {'es': 'Warfarina', 'ay': 'Warfarina', 'qu': 'Warfarina'},
      'image': 'assets/images/medicamentos/warfarina.jpg',
      'uses': {
        'es': 'Prevención de coágulos (anticoagulante)',
        'ay': 'Wilanak jark’aña (wila jani q’ipht’iri)',
        'qu': 'Ch’uñu willay jark’ay (jamuq kamayuq)',
      },
      'dose': {
        'es': 'Dosis individualizada según INR',
        'ay': 'Sapa janchimpi wakt’ata dosis',
        'qu': 'Sapa runa qhatuyniyuq dosis',
      },
      'warnings': {
        'es': 'Riesgo de sangrado. Controlar INR frecuentemente.',
        'ay': 'Wila mistuñani. INR wakicht’aña.',
        'qu': 'Willay muyuchiy. INR uñjapayay.',
      },
    },
    {
      'name': {
        'es': 'Zinc (como sulfato)',
        'ay': 'Zinc (sulfato)',
        'qu': 'Zinc (sulfato)',
      },
      'image': 'assets/images/medicamentos/zinc.jpg',
      'uses': {
        'es': 'Diarrea, refuerzo del sistema inmune',
        'ay': 'Ch’ankha, janchi ch’amañchawi',
        'qu': 'Ch’aki, janchita sinchi ch’uyanchay',
      },
      'dose': {
        'es': '10-20 mg al día según edad',
        'ay': '10-20 mg sapa uru, maranakampi wakicht’ata',
        'qu': '10-20 mg punchawpi, wataykuna qhatuyniyuq',
      },
      'warnings': {
        'es': 'Puede causar náuseas si se toma con el estómago vacío.',
        'ay': 'Jan manq’añampi churatasa, chhijchhisiñani.',
        'qu': 'Mana mikhuykuywan churakuchkan, ch’inkayta apamullaq.',
      },
    },
    {
      'name': {
        'es': 'Amitriptilina',
        'ay': 'Amitriptilina',
        'qu': 'Amitriptilina',
      },
      'image': 'assets/images/medicamentos/amitriptilina.jpg',
      'uses': {
        'es': 'Depresión, dolor neuropático',
        'ay': 'Pena chuyma, amuyu jiwaki',
        'qu': 'Sunqupi llaki, ñiqi nanay',
      },
      'dose': {
        'es': '25-75 mg al día en la noche',
        'ay': '25-75 mg sapa aruma',
        'qu': '25-75 mg tuta punchawpi',
      },
      'warnings': {
        'es': 'Puede causar somnolencia, no conducir.',
        'ay': 'Puñuta munachiniwa, janiw manejkañamäkiti.',
        'qu': 'Puñuyta munachiy, ama manejuychu.',
      },
    },
    {
      'name': {'es': 'Amoxicilina', 'ay': 'Amoxicilina', 'qu': 'Amoxicilina'},
      'image': 'assets/images/medicamentos/amoxicilina.jpg',
      'uses': {
        'es': 'Infecciones respiratorias y urinarias',
        'ay': 'Samka ukat q’iwita usuchawi',
        'qu': 'Samay ch’ixi ukat yakupi unquy',
      },
      'dose': {
        'es': '500 mg cada 8 horas',
        'ay': '500 mg sapa 8 ura',
        'qu': '500 mg pusaq urapi',
      },
      'warnings': {
        'es': 'Completar el tratamiento para evitar resistencia.',
        'ay': 'Hampita tukuyapxañapawa, jani utjiñapataki.',
        'qu': 'Hampiy tukuy, manaraq ch’iqchiq tukuchkanpaq.',
      },
    },
    {
      'name': {'es': 'Cefixima', 'ay': 'Cefixima', 'qu': 'Cefixima'},
      'image': 'assets/images/medicamentos/cefixima.jpg',
      'uses': {
        'es': 'Infecciones urinarias y respiratorias',
        'ay': 'Q’iwita ukat samka usuchawi',
        'qu': 'Yakupi ukat samay unquy',
      },
      'dose': {
        'es': '200-400 mg al día, según infección',
        'ay': '200-400 mg sapa uru, usuchawimpi wakicht’ata',
        'qu': '200-400 mg punchawpi, unquyman qhatuyniyuq',
      },
      'warnings': {
        'es': 'Puede causar diarrea.',
        'ay': 'Ch’ankha churaniwa.',
        'qu': 'Ch’aki apamullaq.',
      },
    },
    {
      'name': {
        'es': 'Dextrometorfano bromhidrato',
        'ay': 'Dextrometorfano',
        'qu': 'Dextrometorfano',
      },
      'image': 'assets/images/medicamentos/dextrometorfano_bromhidrato.jpg',
      'uses': {
        'es': 'Tos seca',
        'ay': 'Jani phuju, kasilla thuru',
        'qu': 'Thuruchay mana yakuwan',
      },
      'dose': {
        'es': '10-20 mg cada 4-6 horas',
        'ay': '10-20 mg sapa 4-6 ura',
        'qu': '10-20 mg tawa suqta urapi',
      },
      'warnings': {
        'es': 'No usar en menores de 6 años.',
        'ay': 'Janiw 6 maranak uñt’ayapxañati.',
        'qu': 'Ama 6 wata wawakunapi apaychu.',
      },
    },
    {
      'name': {
        'es': 'Dimenhidrinato',
        'ay': 'Dimenhidrinato',
        'qu': 'Dimenhidrinato',
      },
      'image': 'assets/images/medicamentos/dimenhidrinato.jpg',
      'uses': {
        'es': 'Náuseas, vómitos y mareo',
        'ay': 'Chhijchhi, jakaña, muyuña',
        'qu': 'Ch’inkay, willay, muyuy',
      },
      'dose': {
        'es': '50-100 mg cada 4-6 horas',
        'ay': '50-100 mg sapa 4-6 ura',
        'qu': '50-100 mg 4-6 urapi',
      },
      'warnings': {
        'es': 'Puede causar sueño, evitar manejar.',
        'ay': 'Puñut churaraki, janiw manejkañamäkiti.',
        'qu': 'Puñuy apamullaq, ama manejuychu.',
      },
    },
    {
      'name': {
        'es': 'Dopamina clorhidrato',
        'ay': 'Dopamina clorhidrato',
        'qu': 'Dopamina clorhidrato',
      },
      'image': 'assets/images/medicamentos/dopamina.jpg',
      'uses': {
        'es': 'Shock, insuficiencia cardíaca',
        'ay': 'Jani ch’ama chuyma, jucha sunqu',
        'qu': 'Ñiqi ch’ulla, sunqu mana allin',
      },
      'dose': {
        'es': '2-20 mcg/kg/min IV',
        'ay': '2-20 mcg/kg/min intravenoso',
        'qu': '2-20 mcg/kg/min via ñiqin janchi',
      },
      'warnings': {
        'es': 'Monitorear presión y ritmo cardíaco.',
        'ay': 'Wila ukat chuyma laphimpi uñjaña.',
        'qu': 'Ñiqi ukat sunqu puriynin qhaway.',
      },
    },
    {
      'name': {
        'es': 'Eritromicina',
        'ay': 'Eritromicina',
        'qu': 'Eritromicina',
      },
      'image': 'assets/images/medicamentos/eritromicina.jpg',
      'uses': {
        'es': 'Infecciones respiratorias, de piel y oídos',
        'ay': 'Samka, laq’u, ist’a usuchawi',
        'qu': 'Samay, kara, rinri unquy',
      },
      'dose': {
        'es': '250-500 mg cada 6-8 horas',
        'ay': '250-500 mg sapa 6-8 ura',
        'qu': '250-500 mg suqta-pusaq urapi',
      },
      'warnings': {
        'es': 'Puede causar malestar estomacal.',
        'ay': 'Manq’añ utjani, usuyani.',
        'qu': 'Wiksapi llaki apamullaq.',
      },
    },
    {
      'name': {'es': 'Flunarizina', 'ay': 'Flunarizina', 'qu': 'Flunarizina'},
      'image': 'assets/images/medicamentos/flunarizina.jpg',
      'uses': {
        'es': 'Migraña, vértigo',
        'ay': 'Uma p’iqi, muyuña jani suma',
        'qu': 'Uma ñawiy, muyuy ch’ulla',
      },
      'dose': {
        'es': '5-10 mg por la noche',
        'ay': '5-10 mg aruma',
        'qu': '5-10 mg tuta',
      },
      'warnings': {
        'es': 'Puede causar somnolencia.',
        'ay': 'Puñut churaraki.',
        'qu': 'Puñuyta apamullaq.',
      },
    },
    {
      'name': {'es': 'Ketamina', 'ay': 'Ketamina', 'qu': 'Ketamina'},
      'image': 'assets/images/medicamentos/ketamina.png',
      'uses': {
        'es': 'Anestesia general, dolor severo',
        'ay': 'Jach’a llakit amtayawi, ch’ama nanay',
        'qu': 'Tukuypu amuyay, sinchi nanay',
      },
      'dose': {
        'es': '0.5-2 mg/kg IV o IM',
        'ay': '0.5-2 mg/kg janq’u uñtayawi',
        'qu': '0.5-2 mg/kg ñiqin janchiwan',
      },
      'warnings': {
        'es': 'Monitoreo constante, posibles alucinaciones.',
        'ay': 'Uñjañani, amuyt’awi jan chiqaña.',
        'qu': 'Qhawayman, amuya ñawirichiykuna.',
      },
    },
    {
      'name': {'es': 'Metamizol', 'ay': 'Metamizol', 'qu': 'Metamizol'},
      'image': 'assets/images/medicamentos/metamizol.jpg',
      'uses': {
        'es': 'Dolor, fiebre',
        'ay': 'Nanay, pharasiña',
        'qu': 'Nanay, q’incha',
      },
      'dose': {
        'es': '500-1000 mg cada 6-8 horas',
        'ay': '500-1000 mg sapa 6-8 ura',
        'qu': '500-1000 mg suqta-pusaq urapi',
      },
      'warnings': {
        'es': 'Puede afectar glóbulos blancos.',
        'ay': 'Janq’u wilanakamp jan wali.',
        'qu': 'Yuraq willayta llakispa tukuchkan.',
      },
    },
  ];
  @override
  void initState() {
    super.initState();
    localizations = AppLocalizations(widget.userLanguage);
    _filteredMedicines = _medicines;
    _searchController.addListener(_filterMedicines);
  }

  void _filterMedicines() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredMedicines = _medicines.where((medicine) {
        final nameEs = medicine['name']['es'].toString().toLowerCase();
        final nameAy = medicine['name']['ay'].toString().toLowerCase();
        final nameQu = medicine['name']['qu'].toString().toLowerCase();
        return nameEs.contains(query) ||
            nameAy.contains(query) ||
            nameQu.contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.educationTitle),
        backgroundColor: Colors.green[700],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: localizations.searchMedicineHint,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredMedicines.isEmpty
                ? Center(
                    child: Text(
                      localizations.noResultsFound,
                      style: const TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: _filteredMedicines.length,
                    itemBuilder: (context, index) {
                      final medicine = _filteredMedicines[index];
                      return _buildMedicineCard(medicine, context);
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildMedicineCard(
    Map<String, dynamic> medicine,
    BuildContext context,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 3,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MedicineDetailScreen(
                medicine: medicine,
                userLanguage: widget.userLanguage,
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              // Imagen del medicamento
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(medicine['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      medicine['name'][widget.userLanguage] ??
                          medicine['name']['es'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      medicine['uses'][widget.userLanguage] ??
                          medicine['uses']['es'],
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class MedicineDetailScreen extends StatelessWidget {
  final Map<String, dynamic> medicine;
  final String userLanguage;

  const MedicineDetailScreen({
    required this.medicine,
    required this.userLanguage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations(userLanguage);

    return Scaffold(
      appBar: AppBar(
        title: Text(medicine['name'][userLanguage] ?? medicine['name']['es']),
        backgroundColor: Colors.green[700],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Imagen con manejo de errores
            Container(
              height: 200,
              width: double.infinity,
              color: const Color.fromARGB(
                255,
                255,
                255,
                255,
              ), // Color de fondo si falla la imagen
              child: medicine['image'] != null
                  ? Image.asset(
                      medicine['image'],
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildImagePlaceholder();
                      },
                    )
                  : _buildImagePlaceholder(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    localizations.usesLabel,
                    medicine['uses'][userLanguage],
                    icon: Icons.medical_services,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    localizations.doseLabel,
                    medicine['dose'][userLanguage],
                    icon: Icons.schedule,
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    localizations.warningsLabel,
                    medicine['warnings'][userLanguage],
                    icon: Icons.warning,
                    color: Colors.orange[700],
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green[700],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                      ),
                      onPressed: () => Navigator.pop(context),
                      child: Text(localizations.backToList),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.medication, size: 50, color: Colors.grey[400]),
          const SizedBox(height: 8),
          Text(
            'Imagen no disponible',
            style: TextStyle(color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(
    String title,
    String content, {
    IconData? icon,
    Color? color,
  }) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (icon != null)
                  Icon(icon, color: color ?? Colors.green[700], size: 20),
                if (icon != null) const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: color ?? Colors.green[700],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(content),
          ],
        ),
      ),
    );
  }
}
