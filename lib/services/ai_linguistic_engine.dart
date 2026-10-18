import 'dart:math';

class GeneratedLesson {
  final String domain;
  final String targetTerm;
  final String termDefinition;
  final String sentenceEn;
  final String sentenceFa;
  final String grammarFocus;
  final String quizQuestion;
  final List<String> quizOptions;
  final int correctOptionIndex;

  GeneratedLesson({
    required this.domain,
    required this.targetTerm,
    required this.termDefinition,
    required this.sentenceEn,
    required this.sentenceFa,
    required this.grammarFocus,
    required this.quizQuestion,
    required this.quizOptions,
    required this.correctOptionIndex,
  });
}

class AiLinguisticEngine {
  static final Random _random = Random();

  static final Map<String, List<Map<String, dynamic>>> domainKnowledge = {
    'Minecraft & Gaming': [
      {
        'term': 'Crafting Table',
        'trans': 'میز کار و ساخت ابزار',
        'subjects': ['Seasoned survivors', 'Minecraft players', 'Creative builders'],
        'verbs': [{'v': 'craft', 'fa': 'می‌سازند'}, {'v': 'assemble', 'fa': 'سرهم می‌کنند'}],
        'actions': [
          {'en': 'diamond armor to survive the Nether', 'fa': 'زره الماسی را برای بقا در ندر'},
          {'en': 'essential pickaxes before mining deep underground', 'fa': 'کلنگ‌های حیاتی را قبل از استخراج در اعماق زمین'}
        ],
        'distractors': ['Furnace', 'Brewing Stand', 'Enchanting Table']
      },
      {
        'term': 'Redstone Repeater',
        'trans': 'تکرارکننده و رله ردستون',
        'subjects': ['Engineers', 'Contraption designers'],
        'verbs': [{'v': 'wire', 'fa': 'سیم‌کشی می‌کنند'}, {'v': 'install', 'fa': 'نصب می‌کنند'}],
        'actions': [
          {'en': 'to delay signals and extend current range', 'fa': 'سیگنال‌ها را برای ایجاد تاخیر و افزایش برد جریان'},
          {'en': 'inside automated crop harvesting farms', 'fa': 'درون مزارع اتوماتیک برداشت محصول'}
        ],
        'distractors': ['Observer', 'Piston', 'Dispenser']
      }
    ],
    'Computer Science & AI': [
      {
        'term': 'Neural Network',
        'trans': 'شبکه عصبی مصنوعی',
        'subjects': ['Data scientists', 'AI researchers', 'Modern algorithms'],
        'verbs': [{'v': 'train', 'fa': 'آموزش می‌دهند'}, {'v': 'optimize', 'fa': 'بهینه‌سازی می‌کنند'}],
        'actions': [
          {'en': 'to detect hidden fraudulent transactions in real time', 'fa': 'تراکنش‌های مخفی کلاهبرداری را در زمان واقعی'},
          {'en': 'using millions of high-dimensional matrix vectors', 'fa': 'با استفاده از میلیون‌ها بردار ماتریسی چندبعدی'}
        ],
        'distractors': ['Binary Tree', 'Relational Table', 'Memory Heap']
      },
      {
        'term': 'Asynchronous Loop',
        'trans': 'حلقه رویداد ناهمگام (غیرمسدودکننده)',
        'subjects': ['Backend services', 'High-throughput APIs'],
        'verbs': [{'v': 'prevent', 'fa': 'جلوگیری می‌کنند از'}, {'v': 'resolve', 'fa': 'حل می‌کنند'}],
        'actions': [
          {'en': 'bottlenecks while processing concurrent network packets', 'fa': 'گلوگاه‌ها را هنگام پردازش بسته‌های همزمان شبکه'},
          {'en': 'thread blocking during intensive database queries', 'fa': 'مسدود شدن تِردها را در زمان کوئری‌های سنگین'}
        ],
        'distractors': ['Deadlock Mutex', 'Static Stack', 'Garbage Collector']
      }
    ],
    'Electrical & Hardware': [
      {
        'term': 'Oscilloscope',
        'trans': 'دستگاه اسیلوسکوپ (نوسان‌نما)',
        'subjects': ['Hardware technicians', 'Embedded systems engineers'],
        'verbs': [{'v': 'probe', 'fa': 'اندازه‌گیری و بررسی می‌کنند'}, {'v': 'calibrate', 'fa': 'کالیبره می‌کنند'}],
        'actions': [
          {'en': 'to analyze transient voltage waveforms accurately', 'fa': 'شکل موج‌های گذرا ولتاژ را با دقت بالا'},
          {'en': 'checking PWM signals on microcontroller pins', 'fa': 'سیگنال‌های PWM را روی پایه‌های میکروکنترلر'}
        ],
        'distractors': ['Digital Multimeter', 'Soldering Iron', 'Variable Transformer']
      },
      {
        'term': 'Capacitor',
        'trans': 'خازن ذخیره‌کننده بار الکتریکی',
        'subjects': ['Power filter circuits', 'Analog boards'],
        'verbs': [{'v': 'filter', 'fa': 'فیلتر می‌کنند'}, {'v': 'smooth', 'fa': 'صاف و یکدست می‌کنند'}],
        'actions': [
          {'en': 'rapid voltage fluctuations before reaching delicate chips', 'fa': 'نوسانات ناگهانی ولتاژ را قبل از رسیدن به تراشه‌های حساس'},
          {'en': 'unwanted alternating noise in the power supply line', 'fa': 'نویزهای ناخواسته AC را در خط تغذیه مدار'}
        ],
        'distractors': ['Resistor', 'Inductor', 'Diode']
      }
    ],
    'Culinary & Gastronomy': [
      {
        'term': 'Sous-Vide',
        'trans': 'روش پخت تحت خلاء (سو-وید)',
        'subjects': ['Michelin-star chefs', 'Modern gastronomers'],
        'verbs': [{'v': 'utilize', 'fa': 'به کار می‌برند'}, {'v': 'prefer', 'fa': 'ترجیح می‌دهند'}],
        'actions': [
          {'en': 'to lock in juicy aromatic flavors at precise temperatures', 'fa': 'طعم‌های آبدار و معطر را در دماهای کاملاً دقیق'},
          {'en': 'ensuring delicate meat cuts remain perfectly tender', 'fa': 'تکه‌های گوشت لطیف را تا کاملاً نرم و یکنواخت باقی بمانند'}
        ],
        'distractors': ['Deep Frying', 'Flash Boiling', 'Dry Smoking']
      }
    ],
    'Medicine & Clinical': [
      {
        'term': 'Intravenous Cannula',
        'trans': 'کانولای داخل وریدی (آنژیوکت)',
        'subjects': ['Emergency doctors', 'Clinical nurses'],
        'verbs': [{'v': 'insert', 'fa': 'وارد می‌کنند'}, {'v': 'secure', 'fa': 'تثبیت می‌کنند'}],
        'actions': [
          {'en': 'to administer vital medications into the bloodstream instantly', 'fa': 'داروهای حیاتی را سریعاً به جریان خون بیمار'},
          {'en': 'for rapid hydration during acute trauma management', 'fa': 'مایعات را برای هیدراتاسیون سریع در تروما'}
        ],
        'distractors': ['Stethoscope', 'Scalpel Blade', 'Centrifuge Tube']
      }
    ]
  };

  static GeneratedLesson generateDynamicLesson(String domain, String level, int age) {
    final domainKey = domainKnowledge.containsKey(domain) ? domain : 'Minecraft & Gaming';
    final items = domainKnowledge[domainKey]!;
    final item = items[_random.nextInt(items.length)];

    final sub = (item['subjects'] as List<String>)[_random.nextInt((item['subjects'] as List).length)];
    final verb = (item['verbs'] as List<Map<String, String>>)[_random.nextInt((item['verbs'] as List).length)];
    final action = (item['actions'] as List<Map<String, String>>)[_random.nextInt((item['actions'] as List).length)];

    String sentenceEn = "";
    String sentenceFa = "";
    String grammarFocus = "";

    if (level.contains('Beginner') || age < 14) {
      sentenceEn = "$sub ${verb['v']} the ${item['term']} ${action['en']}.";
      sentenceFa = "$sub ${action['fa']} با «${item['trans']}» ${verb['fa']}.";
      grammarFocus = "Simple Present Structure (فاعل + فعل + مفعول تخصصی)";
    } else {
      sentenceEn = "By utilizing the ${item['term']}, $sub have managed to ${verb['v']} ${action['en']}.";
      sentenceFa = "با استفاده از «${item['trans']}»، $sub موفق شده‌اند تا ${action['fa']} ${verb['fa']}.";
      grammarFocus = "Gerund Clauses & Complex Modifiers (عبارت‌های مصدری پیشرفته)";
    }

    final options = List<String>.from(item['distractors'] as List<String>);
    options.add(item['term'] as String);
    options.shuffle(_random);

    return GeneratedLesson(
      domain: domainKey,
      targetTerm: item['term'] as String,
      termDefinition: item['trans'] as String,
      sentenceEn: sentenceEn,
      sentenceFa: sentenceFa,
      grammarFocus: grammarFocus,
      quizQuestion: "What primary tool or element is used: \"... ${action['en']}\"?",
      quizOptions: options,
      correctOptionIndex: options.indexOf(item['term'] as String),
    );
  }

  static List<String> getAllDomains() => domainKnowledge.keys.toList();
}
