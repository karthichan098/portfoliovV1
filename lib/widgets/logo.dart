import 'package:flutter/material.dart';
import 'package:portfolio001/constants/colors.dart';

class logo extends StatelessWidget {
  const logo({super.key, this.onTap});
final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        onTap: onTap,
        child: Text('My Portfolio' , style: TextStyle(color: MyColors.tomato, fontWeight: FontWeight.bold, fontSize: 20), )
    );


  }
}
