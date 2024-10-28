import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:portfolio001/constants/colors.dart';

class ContactSection extends StatefulWidget {
  @override
  _ContactSectionState createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController messageController = TextEditingController();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode messageFocusNode = FocusNode();

  @override
  void dispose() {
    // Dispose controllers and focus nodes when the widget is removed from the widget tree
    nameController.dispose();
    emailController.dispose();
    messageController.dispose();
    nameFocusNode.dispose();
    emailFocusNode.dispose();
    messageFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        color: MyColors.customblack,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Contact Me',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'Get In Touch For more information',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: Container(
                width: screenWidth > 600 ? 500 : screenWidth * 0.9,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: MyColors.transparent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Name',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      controller: nameController,
                      focusNode: nameFocusNode,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your name',
                        filled: true,
                        fillColor: MyColors.white1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onEditingComplete: () => FocusScope.of(context).requestFocus(emailFocusNode),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Email',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      controller: emailController,
                      focusNode: emailFocusNode,
                      style: const TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        hintText: 'Enter your email',
                        filled: true,
                        fillColor: MyColors.white1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onEditingComplete: () => FocusScope.of(context).requestFocus(messageFocusNode),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Message',
                      style: TextStyle(color: Colors.white),
                    ),
                    TextFormField(
                      controller: messageController,
                      focusNode: messageFocusNode,
                      style: const TextStyle(color: Colors.black),
                      maxLines: 5,
                      decoration: InputDecoration(
                        hintText: 'Enter your message',
                        filled: true,
                        fillColor: MyColors.white1,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFEC4899),
                              Color(0xFFF87171),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            submitForm(
                              context,
                              nameController.text,
                              emailController.text,
                              messageController.text,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitForm(BuildContext context, String name, String email, String message) async {
    const String url = 'https://api.web3forms.com/submit';
    const String accessKey = 'd7551d8a-d582-4168-8fda-fe39580e8bfb';

    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "access_key": accessKey,
          "name": name,
          "email": email,
          "message": message,
        }),
      );

      if (response.statusCode == 200) {
        print('Form successfully submitted');
        nameController.clear();
        emailController.clear();
        messageController.clear();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Form successfully submitted!')),
        );
      } else {
        throw Exception('Failed to submit form: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $error')),
      );
    }
  }
}

