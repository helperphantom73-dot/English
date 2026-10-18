import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/neon_background.dart';
import '../widgets/glass_card.dart';
import 'domain_selector_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _nameCtrl = TextEditingController();
  final _ageCtrl = TextEditingController();
  String _level = 'Beginner (A1-A2)';

  @override
  Widget build(BuildContext context) {
    return NeonBackground(
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              Text(
                "NEXUS LINGO",
                textAlign: TextAlign.center,
                style: GoogleFonts.orbitron(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4,
                  color: const Color(0xFF00FFCC),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Autonomous AI • 100% Offline",
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontSize: 13, color: Colors.white70),
              ),
              const SizedBox(height: 36),
              GlassCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      controller: _nameCtrl,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person, color: Color(0xFF00FFCC)),
                        hintText: "Your Name",
                        hintStyle: TextStyle(color: Colors.white38),
                        border: InputBorder.none,
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    TextField(
                      controller: _ageCtrl,
                      keyboardType: TextInputType.number,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.cake, color: Color(0xFF00FFCC)),
                        hintText: "Age",
                        hintStyle: TextStyle(color: Colors.white38),
                        border: InputBorder.none,
                      ),
                    ),
                    const Divider(color: Colors.white24),
                    DropdownButton<String>(
                      value: _level,
                      isExpanded: true,
                      dropdownColor: const Color(0xFF131722),
                      underline: const SizedBox(),
                      style: const TextStyle(color: Colors.white),
                      items: ['Beginner (A1-A2)', 'Intermediate (B1-B2)', 'Advanced (C1-C2)']
                          .map((l) => DropdownMenuItem(value: l, child: Text(l)))
                          .toList(),
                      onChanged: (v) => setState(() => _level = v!),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00FFCC),
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => DomainSelectorScreen(
                        userName: _nameCtrl.text.isEmpty ? 'Cadet' : _nameCtrl.text,
                        level: _level,
                        age: int.tryParse(_ageCtrl.text) ?? 20,
                      ),
                    ),
                  );
                },
                child: Text(
                  "LAUNCH UNIVERSE ➔",
                  style: GoogleFonts.orbitron(color: Colors.black, fontWeight: FontWeight.bold, letterSpacing: 2),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
