import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/neon_background.dart';
import '../widgets/glass_card.dart';
import '../../services/ai_linguistic_engine.dart';
import 'topic_learning_screen.dart';

class DomainSelectorScreen extends StatelessWidget {
  final String userName;
  final String level;
  final int age;

  const DomainSelectorScreen({
    super.key,
    required this.userName,
    required this.level,
    required this.age,
  });

  IconData _getIcon(String domain) {
    if (domain.contains('Gaming')) return Icons.sports_esports_rounded;
    if (domain.contains('Computer')) return Icons.terminal_rounded;
    if (domain.contains('Electrical')) return Icons.electric_bolt_rounded;
    if (domain.contains('Culinary')) return Icons.restaurant_menu_rounded;
    return Icons.medical_services_rounded;
  }

  @override
  Widget build(BuildContext context) {
    final domains = AiLinguisticEngine.getAllDomains();

    return NeonBackground(
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    "DOMAINS",
                    style: GoogleFonts.orbitron(fontSize: 18, color: const Color(0xFF00FFCC), fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.1,
                ),
                itemCount: domains.length,
                itemBuilder: (ctx, idx) {
                  final domain = domains[idx];
                  return InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => TopicLearningScreen(
                            userName: userName,
                            topic: domain,
                            level: level,
                            age: age,
                          ),
                        ),
                      );
                    },
                    child: GlassCard(
                      neonBorderColor: idx % 2 == 0 ? const Color(0xFF00FFCC) : const Color(0xFFFF007F),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(_getIcon(domain), size: 36, color: idx % 2 == 0 ? const Color(0xFF00FFCC) : const Color(0xFFFF007F)),
                          const SizedBox(height: 10),
                          Text(
                            domain,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
