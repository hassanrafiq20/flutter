
import 'package:flutter/material.dart';
class BeveledButton extends StatelessWidget {
 const  BeveledButton({super.key, required this.title, required this.onTap});
  final String title;
  final VoidCallback  onTap;



  // required String title,
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
    style: ElevatedButton.styleFrom(
     // backgroundColor: Colors.black.withOpacity(0.4),
     backgroundColor:  Colors.blueGrey.withOpacity(0.4),
      foregroundColor: Colors.yellow,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      )
    ),
    onPressed: onTap, 
    child: Text(title,style: const TextStyle(fontFamily: "Gothic"),)
    );
  }
}