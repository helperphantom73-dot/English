import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/neon_background.dart';
import '../widgets/glass_card.dart';
import '../../services/ai_linguistic_engine.dart';
import '../../services/self_contained_audio.dart';

class TopicLearningScreen extends StatefulWidget {
  final String userName;
  final String topic;
  final String level;
  final int age;

  const TopicLearningScreen({
    super.key,
    required this.userName,
    required this.topic,
    required this.level,
    required this.age,
  });

  @override
  State<TopicLearningScreen> createState() => _TopicLearningScreenState();
}

class _TopicLearningScreenState extends State<TopicLearningScreen> {
  late GeneratedLesson _lesson;
  int? _selected;
  bool _checked = false;
  int _xp = 0;

  @override
  void initState() {
    super.initState();
    SelfContainedAudio.init();
    _loadNext();
  }

  void _loadNext() {
    setState(() {
      _lesson = AiLinguisticEngine.generateDynamicLesson(widget.topic, widget.level, widget.age);
      _selected = null;
      _checked = false;
    });
    SelfContainedAudio.speak(_lesson.sentenceEn);
  }

  @override
  Widget build(BuildContext context) {
    return NeonBackground(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Flexible(
                    child: Text(
                      widget.topic.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.orbitron(color: const Color(0xFF00FFCC), fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text("⚡ $_xp XP", style: const TextStyle(color: Colors.amberAccent, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 8),
              GlassCard(
                neonBorderColor: const Color(0xFF00FFCC),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _lesson.targetTerm,
                          style: GoogleFonts.orbitron(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          icon: const Icon(Icons.volume_up_rounded, color: Color(0xFF00FFCC)),
                          onPressed: () => SelfContainedAudio.speak(_lesson.sentenceEn),
                        ),
                      ],
                    ),
                    Text("« ${_lesson.termDefinition} »", style: const TextStyle(color: Color(0xFF00FFCC), fontSize: 14)),
                    const Divider(color: Colors.white24, height: 16),
                    Text(
                      "“${_lesson.sentenceEn}”",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(fontSize: 14, color: Colors.white, fontStyle: FontStyle.italic),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      _lesson.sentenceFa,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white70, fontSize: 13),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: GlassCard(
                  neonBorderColor: const Color(0xFFFF007F),
                  child: Column(
                    children: [
                      Text(_lesson.quizQuestion, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: _lesson.quizOptions.length,
                          itemBuilder: (ctx, idx) {
                            Color c = Colors.white10;
                            if (_checked) {
                              if (idx == _lesson.correctOptionIndex) c = Colors.green.withOpacity(0.5);
                              else if (_selected == idx) c = Colors.red.withOpacity(0.5);
                            } else if (_selected == idx) {
                              c = const Color(0xFF00FFCC).withOpacity(0.3);
                            }
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: InkWell(
                                onTap: _checked ? null : () => setState(() => _selected = idx),
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(14)),
                                  child: Center(child: Text(_lesson.quizOptions[idx], style: const TextStyle(color: Colors.white))),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF7928CA)),
                        onPressed: _selected == null
                            ? null
                            : () {
                                if (!_checked) {
                                  setState(() {
                                    _checked = true;
                                    if (_selected == _lesson.correctOptionIndex) _xp += 25;
                                  });
                                } else {
                                  _loadNext();
                                }
                              },
                        child: Text(_checked ? "CONTINUE ➔" : "CHECK", style: const TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
