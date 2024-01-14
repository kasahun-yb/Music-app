import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../component/icons.dart';
import '../component/parabolicClippath.dart';
import '../controller/controller.dart';
class mainMusicPart extends StatelessWidget {
  final int index;
  const mainMusicPart({super.key ,required this.index});
  
  @override
  Widget build(BuildContext context) {
  final  _mycontroller=Get.find<MyController>();
    return  Scaffold(
    
    backgroundColor: Color.fromARGB(255, 13, 18, 22),
   body: Stack(children: [
     Container( 
      width: Get.width, 
     height: Get.height,
     decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/background/image1.jpg"))),   
     ),
     Container(
      width: Get.width,
      height: Get.height,
        color: Color.fromARGB(95, 54, 39, 90),
      child: BackdropFilter(  filter: ImageFilter.blur(sigmaX: 60, sigmaY: 60),
      child: ListView(
       children: [
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
         Iconmeta(icons: Icon(Icons.keyboard_arrow_down,color: Colors.purple,), onTapCallback: (
           ) {
      Get.back();
      
           }, ),
       Obx(() => _mycontroller.isplaying==true?Text("Now Playing",style:GoogleFonts.podkova(fontSize: 27,fontWeight: FontWeight.w500,color: Colors.white) ,):Text("Music Pause",style:GoogleFonts.podkova(fontSize: 27,fontWeight: FontWeight.w500,color: Colors.white) ,),),
          
          
          Iconmeta(icons: Icon(Icons.more_horiz,color: Colors.purple,), onTapCallback: () { 
        
          showCupertinoPopupMenu(context);
          } ),
          ], ),

         Container(
          margin: EdgeInsets.symmetric(vertical: 50),
          width: 270,
          height: 270,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            
            border: Border.all(width: 5 ,color:Colors.transparent.withOpacity(0.2))),
           child: Center(
             child: Obx(() => QueryArtworkWidget(id: _mycontroller.playingIndex.value,
               type: ArtworkType.AUDIO, 
               nullArtworkWidget: Container(  
              width: 230,
              height: 230,
              decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient:LinearGradient(
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                  Colors.black,
                  Colors.pink
                ]) ,
                ),
                child: Icon(Icons.music_note,size: 54,color: Colors.white,),
             ),
             ))
           ),
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          Icon(Icons.album,size: 40,color: Colors.white,) ,
         Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        
          children: [
   Container(

    width: 200,
    child:  Center(
      child: Obx(() =>   Text(_mycontroller.musicList[_mycontroller.playingIndex.value].displayNameWOExt,overflow: TextOverflow.ellipsis,style: GoogleFonts.mansalva(fontSize: 20,color: Colors.white),),
          ),
    ),
   ),
    Container(
      width: 200,
      child: Obx(() =>  Text(_mycontroller.musicList[_mycontroller.playingIndex.value].artist.toString(),overflow: TextOverflow.fade,style: GoogleFonts.poppins(fontSize: 16,color: Colors.white ,fontWeight:FontWeight.w400 ),),))
         ],),
           Icon(Icons.favorite,size: 40,color: Colors.white,)
          ],
         ),
         SizedBox(height: 20,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
        Container(
          width: 50,
           child:  Obx(() => Text(_mycontroller.possition.value,style: GoogleFonts.poppins( fontSize: 15,color: Colors.white),), ),),
          SizedBox(width: 10,),

           Obx(() => SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: Color.fromARGB(255, 243, 28, 117),
              inactiveTrackColor: Color.fromARGB(255, 48, 20, 65),
              trackShape: RectangularSliderTrackShape(),
              trackHeight: 4.0,
              thumbColor: Color.fromARGB(255, 141, 16, 158),
              thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
              overlayColor: Color.fromARGB(255, 67, 54, 244).withAlpha(32),
              overlayShape: RoundSliderOverlayShape(overlayRadius: 2.0),
            ),
            child: Container(
              width:200,
              child: Slider(
                min: 0,
                max:_mycontroller.durationTimeSlider.value,
                value:_mycontroller.possitionTimeslider.value,
                onChanged: (value) {
                 _mycontroller.musicSeek();
               _mycontroller.possitionTimeslider.value=value;
                 },
              )
              ,)
            )),
        
       SizedBox(width:10,),
   Container(
    width: 50,
    child:  Obx(() => Text(_mycontroller.duration.value,style:GoogleFonts.poppins(fontSize: 15,color: Colors.white)),)
,
   )
         ],),
         SizedBox(height: 20,),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           IconButton(onPressed: ()=>{ 
                  if(_mycontroller.possitionTimeslider.value-5>=0){
                   _mycontroller.possitionTimeslider.value=_mycontroller.possitionTimeslider.value-5.0,
                  _mycontroller.musicSeek()  
                  } 
                  else{
                    _mycontroller.possitionTimeslider.value=0,
                     _mycontroller.musicSeek()
                  }          

                      }, icon: Icon(Icons.replay_5_outlined, color: Colors.white,size: 30,)),
          

           Iconmeta(icons: Icon(Icons.skip_previous_outlined), onTapCallback: () {
 
          
              
             _mycontroller.PlayController(_mycontroller.playingIndex.value-1);
            

             },),
      
   
      
           GestureDetector(
         onTap: ()=>{
          _mycontroller.isplaying.isTrue?_mycontroller.PauseController():_mycontroller.ResumeController()
         },
             child: Container(
                     decoration: BoxDecoration(
              shape: BoxShape.circle,
               color: Color.fromARGB(255, 135, 138, 141),
              border: Border.all(width: 8 ,color: Colors.transparent )
                     ),child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration( border: Border.all(width: 2,color: Color.fromARGB(108, 83, 83, 83)),
                shape: BoxShape.circle,
             gradient: LinearGradient(colors: [
              Color.fromARGB(255, 177, 17, 192),
                Colors.pink, ]),),
              child: Obx(() =>Icon(_mycontroller.isplaying==false? Icons.play_arrow :Icons.pause_outlined,color: Colors.white, size: 43,)) ,),
                    ),
           ),

       Iconmeta(icons: Icon(Icons.skip_next_outlined), onTapCallback: () { 
        
        _mycontroller.PlayController(_mycontroller.playingIndex.value+1); 
       
       }, ),
      
       IconButton(onPressed: ()=>{
        if(_mycontroller.possitionTimeslider.value+5<=_mycontroller.durationTimeSlider.value){
          _mycontroller.possitionTimeslider.value=_mycontroller.possitionTimeslider.value+5.0,
                  _mycontroller.musicSeek()    
        }
        else{
          _mycontroller.possitionTimeslider.value=_mycontroller.durationTimeSlider.value-1,
          _mycontroller.musicSeek()   
        }

       }, icon: Icon(Icons.forward_5_outlined, color: Colors.white, size: 30,)),
      
      
      ],),
      ],
      ),
      ), 
     )
   ]),
    );
    
  }
  void showCupertinoPopupMenu(BuildContext context) {
  Get.bottomSheet(
    CupertinoActionSheet(
      title: Text('Select an option'),
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Get.back();
        },
        child: Text('Cancel'),
      ),
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            // Handle option 1 selection here
            Get.back(result: 'Option 1');
          },
          child: Text('Option 1'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            // Handle option 2 selection here
            Get.back(result: 'Option 2');
          },
          child: Text('Option 2'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            // Handle option 3 selection here
            Get.back(result: 'Option 3');
          },
          child: Text('Option 3'),
        ),
      ],
    ),
  ).then((value) {
    // This callback will be called when the bottom sheet is dismissed
    if (value != null) {
      print('Selected option: $value');
      // Perform actions based on the selected option here
    }
  });
}
}

