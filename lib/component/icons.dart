import 'package:flutter/material.dart';
class Iconmeta extends StatelessWidget {
  Icon icons;
  GestureTapCallback onTapCallback;
   Iconmeta({
    super.key,
     required this.icons,
     required this.onTapCallback
  });

  @override
  Widget build(BuildContext context, ) {
    return Container( 
        width: 45,
        height: 45,
        decoration: BoxDecoration( 
     shape: BoxShape.circle,
     color: Color.fromARGB(255, 209, 202, 202)),
     child:IconButton(onPressed: onTapCallback,icon:icons,)
    );
  }
}