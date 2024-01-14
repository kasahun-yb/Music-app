import 'package:flutter/material.dart';
Widget PaddingContainer(Widget  widget){
  return Padding
  (
padding: EdgeInsets.only( top: 45, bottom: 20,  left: 20,right: 20),
child:widget,
  );
}