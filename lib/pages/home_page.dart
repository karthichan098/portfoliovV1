import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:portfolio001/constants/colors.dart';
import 'package:portfolio001/widgets/logo.dart';
import 'package:portfolio001/pages/home_section.dart';
import 'package:portfolio001/pages/skill.dart';
import 'package:portfolio001/pages/projects.dart';
import 'package:portfolio001/pages/contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> navTitles = ['Home', 'Skill', 'Projects', 'Contact', 'Blog'];

  // Controller for ScrollablePositionedList
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionsListener = ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 600;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.customblack,
        title: logo(
          onTap: () {
            // No navigation function here
          },
        ),
        iconTheme: const IconThemeData(color: Colors.white), // Drawer icon color
        elevation: 0,
        actions: isMobile ? null : _buildNavButtons(), // Show buttons only in web view
      ),
      drawer: isMobile ? Drawer(child: _buildDrawerMenu()) : null, // Drawer only for mobile
      body: ScrollablePositionedList.builder(
        itemCount: 4, // Number of sections
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return HomeSection(scrollController: _itemScrollController); // Pass scrollController here
            case 1:
              return const Skill(); // Skill Section
            case 2:
              return const Projects(); // Projects Section
            case 3:
              return  ContactSection(); // Contact Section
            default:
              return const SizedBox(); // Fallback
          }
        },
        itemScrollController: _itemScrollController, // Scroll controller for navigating between sections
        itemPositionsListener: _itemPositionsListener,
      ),
    );
  }

  // Build AppBar buttons with icons and scroll functionality
  List<Widget> _buildNavButtons() {
    return navTitles.map((title) {
      return TextButton.icon(
        onPressed: () => _scrollToSection(title), // Scroll to respective section by index
        icon: _getIconForTitle(title),
        label: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      );
    }).toList();
  }

  // Build Drawer menu for mobile view with scroll functionality
  Widget _buildDrawerMenu() {
    return ListView(
      padding: EdgeInsets.zero,
      children: navTitles.map((title) {
        return ListTile(
          leading: _getIconForTitle(title),
          title: Text(title),
          onTap: () {
            Navigator.pop(context); // Close drawer
            _scrollToSection(title); // Scroll to section
          },
        );
      }).toList(),
    );
  }

  // Scroll to section based on title
  void _scrollToSection(String title) {
    switch (title) {
      case 'Home':
        _itemScrollController.scrollTo(
          index: 0,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Skill':
        _itemScrollController.scrollTo(
          index: 1,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Projects':
        _itemScrollController.scrollTo(
          index: 2,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      case 'Contact':
        _itemScrollController.scrollTo(
          index: 3,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        break;
      default:
        break;
    }
  }

  // Helper function to get the appropriate icon for each navigation item
  Icon _getIconForTitle(String title) {
    switch (title) {
      case 'Home':
        return const Icon(Icons.home, color: Colors.white);
      case 'Skill':
        return const Icon(Icons.school, color: Colors.white);
      case 'Projects':
        return const Icon(Icons.folder_copy, color: Colors.white);
      case 'Contact':
        return const Icon(Icons.contact_mail, color: Colors.white);
      case 'Blog':
        return const Icon(Icons.article, color: Colors.white);
      default:
        return const Icon(Icons.circle, color: Colors.white); // Fallback icon
    }
  }
}
