import 'package:flutter/material.dart';
import 'package:portfolio001/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth > 600 // For larger screens, 2 cards per row
        ? (screenWidth - 60) / 2
        : screenWidth - 40; // For smaller screens, 1 card per row

    return Container(
      padding: const EdgeInsets.all(20),
      color: MyColors.darkBlueGreyCustom,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text('Projects', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 15),
          const Center(
            child: Text('What I Have Built', style: TextStyle(fontSize: 24)),
          ),
          const SizedBox(height: 20),

          Wrap(
            spacing: 10.0,
            runSpacing: 20.0,
            children: [
              ProjectCard(
                title: 'Flutter Weather App',
                description: 'A beautiful weather app built using Flutter that shows real-time weather, forecasts, and animations. This app is designed to be responsive and offers various features such as location-based weather updates, temperature graphs, and more for a complete user experience.',
                technologies: const ['Flutter', 'Dart', 'Weather API'],
                projectLink: 'https://github.com/karthichan098/Weather-App.git',
                width: cardWidth,
              ),
              ProjectCard(
                title: 'Portfolio App',
                description: 'A personal portfolio app built using Flutter to showcase my skills, projects, and experience. The app features a sleek design, interactive elements, and sections for contact, blog, and downloadable resume.',
                technologies: const ['Flutter', 'Dart', 'Firebase'],
                projectLink: 'https://github.com/karthik/portfolio-app',
                width: cardWidth,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String projectLink;
  final double width;

  const ProjectCard({
    Key? key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.projectLink,
    required this.width,
  }) : super(key: key);

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: MyColors.darkBlueGrey1,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
          const SizedBox(height: 10),

          // Description with "Read More" toggle
          Text(
            isExpanded ? widget.description : widget.description.substring(0, 160) + '...',
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          if (widget.description.length > 160)
            GestureDetector(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                });
              },
              child: Text(
                isExpanded ? "Read Less" : "Read More",
                style: const TextStyle(color: MyColors.dodgerBlue, fontWeight: FontWeight.bold),
              ),
            ),
          const SizedBox(height: 10),

          // Horizontal scroll for technologies
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: widget.technologies.map((tech) => Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Chip(
                  label: Text(
                    tech,
                    style: const TextStyle(color: Colors.white),
                  ),
                  backgroundColor: MyColors.darkBlueGrey2,
                ),
              )).toList(),
            ),
          ),

          const SizedBox(height: 10), // Space for layout

          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () => _launchURL(widget.projectLink),
              style: ElevatedButton.styleFrom(
                backgroundColor: MyColors.dodgerBlue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('View Project', style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
