import 'package:flutter/material.dart';
import 'package:portfolio001/constants/colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:url_launcher/url_launcher.dart';


class HomeSection extends StatelessWidget {
  final ItemScrollController scrollController; // Add scrollController parameter

  const HomeSection({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 650; // Detect mobile view

    return Container(
      height: 400,
      width: double.infinity,
      color: MyColors.darkBlueGreyCustom,
      padding: isMobile ? const EdgeInsets.all(20.0) : const EdgeInsets.all(50.0), // Adjust padding for mobile
      child: isMobile ? _buildMobileView() : _buildWebView(), // Switch layout based on screen size
    );
  }

  // Layout for Web/Desktop View
  Widget _buildWebView() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center, // Center content vertically
      children: [
        SizedBox(width: 100),
        // Image on the left
        Image.asset(
          'lib/images/bird.png', // Path to your local image
          height: 300,
          width: 300,
        ),
        const SizedBox(width: 30), // Space between image and text
        // Text and buttons on the right
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center, // Center text and buttons vertically
          children: [
            const Text(
              'Hi,\n'
                  "I'm Karthik\n"
                  "A Flutter Developer",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20), // Space between text and buttons

// "Get In Touch" button with gradient
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFF87171), // #f87171 red tone
                    Color(0xFFEC4899), // #ec4899 pink tone
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8), // Rounded corners for button
              ),
              child: TextButton(
                onPressed: () {
                  scrollController.scrollTo(
                    index: 3, // Index of ContactSection
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: Colors.transparent, // Transparent background to show gradient
                ),
                child: const Text(
                  'Get In Touch',
                  style: TextStyle(color: Colors.white), // Text color white for contrast
                ),
              ),
            ),

            const SizedBox(height: 20), // Space between the two buttons

// "Download My Resume" button with gradient
            Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFF87171), // #f87171 red tone
                    Color(0xFFEC4899), // #ec4899 pink tone
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(8), // Rounded corners for button
              ),
              child: TextButton(
                onPressed: () {
                  const url = 'https://www.canva.com/design/DAFL7aEjPgA/Zx1tB5zbpEfQ5ug8CR33qA/edit?utm_content=DAFL7aEjPgA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton';
                  launchURL(url);
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  backgroundColor: Colors.transparent, // Transparent background to show gradient
                ),
                child: const Text(
                  'Download My Resume',
                  style: TextStyle(color: Colors.white), // Text color white for contrast
                ),
              ),
            ),

          ],
        ),
      ],
    );
  }

// Function to handle the URL launch for downloading the resume
  void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


  // Layout for Mobile View
  // Layout for Mobile View
  Widget _buildMobileView() {
    return Padding(
      padding: const EdgeInsets.all(20.0), // Padding for some space from the edges
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensure the text is on the left and the image is on the right
        crossAxisAlignment: CrossAxisAlignment.center, // Vertically center both the text and image
        children: [
          // Text on the left
          Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align text and button to the left
            mainAxisAlignment: MainAxisAlignment.center, // Center the content vertically
            children: [
              const Text(
                'Hi,\n'
                    "I'm Karthik\n"
                    "A Flutter Developer",
                style: TextStyle(
                  fontSize: 22, // Font size for mobile
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20), // Space between text and buttons

// "Get In Touch" button with gradient
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF87171), // #f87171 red tone
                      Color(0xFFEC4899), // #ec4899 pink tone
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8), // Rounded corners for button
                ),
                child: TextButton(
                  onPressed: () {
                    scrollController.scrollTo(
                      index: 3, // Index of ContactSection
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: Colors.transparent, // Transparent background to show gradient
                  ),
                  child: const Text(
                    'Get In Touch',
                    style: TextStyle(color: Colors.white), // Text color white for contrast
                  ),
                ),
              ),

              const SizedBox(height: 20), // Space between the two buttons

// "Download My Resume" button with gradient
              Container(
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFF87171), // #f87171 red tone
                      Color(0xFFEC4899), // #ec4899 pink tone
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(8), // Rounded corners for button
                ),
                child: TextButton(
                  onPressed: () {
                    const url = 'https://www.canva.com/design/DAFL7aEjPgA/Zx1tB5zbpEfQ5ug8CR33qA/edit?utm_content=DAFL7aEjPgA&utm_campaign=designshare&utm_medium=link2&utm_source=sharebutton';
                    launchURL(url);
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: Colors.transparent, // Transparent background to show gradient
                  ),
                  child: const Text(
                    'Download My Resume',
                    style: TextStyle(color: Colors.white), // Text color white for contrast
                  ),
                ),
              ),

            ],
          ),

          // Image on the right with reduced opacity
          Opacity(
            opacity: 0.3, // Set opacity to a lower value for the image
            child: Image.asset(
              'lib/images/bird.png', // Path to your local image
              height: 200, // Slightly larger image size
              width: 200,
            ),
          ),
        ],
      ),
    );
  }


}
