import 'package:flutter/material.dart';
import 'package:portfolio001/constants/colors.dart';

class Skill extends StatelessWidget {
  const Skill({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth > 600 // If screen width is greater than 600, use 2 cards per row
        ? (screenWidth - 60) / 2
        : screenWidth - 40; // If smaller screen, make it 1 card per row

    return Container(
      padding: const EdgeInsets.all(20),
      color: MyColors.customblack,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text('Skills', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text('What I Can Do', style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(height: 20),

          // Wrap for responsiveness
          Wrap(
            spacing: 10.0,
            runSpacing: 20.0,
            children: [
              SkillCard(
                title: 'Programming Languages',
                skills: const ['Dart', 'HTML', 'CSS'],
                images: const ['dartlang-icon.png', 'html.png', 'css.png'],
                width: cardWidth,
                height: 150, // Set fixed height
              ),
              SkillCard(
                title: 'Frameworks & Tools',
                skills: const ['Flutter', 'Firebase', 'GitHub Actions'],
                images: const ['flutterio-icon.png', 'firebase-icon.png', 'github-icon.png'],
                width: cardWidth,
                height: 150,
              ),
              SkillCard(
                title: 'UI/UX Skills',
                skills: const ['• Responsive Design', '• Animations', '• Material Design'],
                images: const [], // No images for this section
                width: cardWidth,
                height: 150,
              ),
              SkillCard(
                title: 'Development Platforms',
                skills: const ['Android', 'iOS', 'Desktop', 'Web'],
                images: const ['android-icon.png', 'apple-icon.png', 'monitor.png', 'world-wide-web.png'],
                width: cardWidth,
                height: 150,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillCard extends StatelessWidget {
  final String title;
  final List<String> skills;
  final List<String> images;
  final double width;
  final double height;

  const SkillCard({
    Key? key,
    required this.title,
    required this.skills,
    required this.images,
    required this.width,
    required this.height, // Adding height property to the SkillCard
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height, // Set the height for the container
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: MyColors.darkBlueGrey1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
          const SizedBox(height: 10),

          // Display skills and icons in a Row, wrapped with Expanded for responsiveness
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Horizontal scrolling if content overflows
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(skills.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        if (images.isNotEmpty && index < images.length)
                          Image.asset(
                            'lib/images/${images[index]}', // Dynamic path to your local image
                            height: 20,
                            width: 20,
                          ),
                        if (images.isNotEmpty && index < images.length) const SizedBox(width: 5),
                        Text(
                          skills[index],
                          style: const TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
