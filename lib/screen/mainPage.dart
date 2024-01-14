
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../controller/controller.dart';
import '../controller/playcontroler.dart';
import 'main_music_part.dart';

class Homepage extends StatelessWidget   {
var _mycontroller=Get.find<MyController>();
   var isindex=1;
ScrollController _scrollController=ScrollController();
 

  // void onInit() {
  //   super
  
  // }
  Widget build(BuildContext context) {
     
     _scrollController.addListener((){
  
   if(_scrollController.position.pixels>0){
   
     _mycontroller.atEdege(false);
   }
   else{
    _mycontroller.atEdege(true);
   }
     } ,) ;
    return Scaffold(
      
      body: Stack(
        children: [
             Container( 
        width: Get.width, 
       height: Get.height,
       decoration: BoxDecoration(
        gradient: LinearGradient(
             begin:Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
         Color.fromARGB(163, 42, 40, 44),
         Colors.black,])),
      //  decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/background/image1.jpg"))),   
       ),
             Container(
     
      color: Color.fromARGB(38, 211, 209, 218),
      child: BackdropFilter(  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
     ),
      ),
             

              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: PaddingContainer(
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        topIcon(Icons.apps_sharp ),
                        topIcon( Icons.search_sharp)
                      ],),),
            ),
            
       Positioned( 
          top: 40,
          right: 0,
          left: 0,
          child:  Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [  
              
              
              Padding(
                padding: const EdgeInsets.only( top: 10, left:16.0, right: 16 ,bottom:16),
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recently Played",style: GoogleFonts.poppins(fontSize: 19,fontWeight: FontWeight.w700,color: Colors.white),),
                    Icon(Icons.keyboard_arrow_right,color: Colors.white, fill:1,)
                  ],
                ),
              ),
                 
                 
            Container(
            height: 90,
            padding: EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
              child: ListView.builder(
              physics: BouncingScrollPhysics(),
                 scrollDirection: Axis.horizontal,
                itemBuilder: (context,index)=>
                Column(
              children: [
                Container( 
                  
                  margin: EdgeInsets.only(right: 16),
              height: 60, 
              width: 60,
              child: Icon(Icons.music_note,color: Colors.white70,),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
               gradient: LinearGradient(colors: [
                Colors.black12,
                Color.fromARGB(125, 0, 0, 0)
               ]) ),
               
               ),
                      
          Padding(
                padding: const EdgeInsets.only(top:8.0),
                child:   Text("Music Title",style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14),),
                  )
                  ],
                  )
                  ),
            ),
                 
                 
               
                 Obx(() => _mycontroller.atEdege.value?   Padding(
                    padding: const EdgeInsets.only(top:16.0, left: 16,right: 16,bottom: 8),
                    child: Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      children: [
                        Text("You Might Like",style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Color.fromARGB(211, 255, 255, 255)),),
                        Icon(Icons.keyboard_arrow_right,color: Color.fromARGB(221, 255, 255, 255), fill:1,)
                      ],
                    ),
                  ):Container())
                  ],
                 ),),


        Positioned(
          top: 190,
          bottom: 0,
          left: 0,
          right: 0,
          child:   
          Obx(() => ListView.builder(
              controller: _scrollController,
                      physics: BouncingScrollPhysics(),
                      itemCount:_mycontroller.musicList.length,
                      itemBuilder:(context,index){
                           return Container(
                           decoration: BoxDecoration(
                             color: isindex==index?Colors.black45:Colors.black12
                             , borderRadius: BorderRadius.circular(50) ),
                            margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                             child: Center(
                               child: ListTile(
                                style: ListTileStyle.drawer,
                                 leading:QueryArtworkWidget(
                                    id:_mycontroller.musicList[index].id,
                                    type: ArtworkType.AUDIO,
                                    nullArtworkWidget:  Container(
                                   width: 50,
                                   height:50,
                                   decoration: BoxDecoration( 
                                    
                                      gradient: LinearGradient(colors: [
                                        Colors.black12,
                                        Colors.black38
                                         
                                      ]),
                                     shape: BoxShape.circle),
                                     child: Center(child: Icon(Icons.music_note,color: Color.fromARGB(206, 255, 255, 255),size: 20,)),
                                 ),
                                 ),
                               title: Text(_mycontroller.musicList[index].displayNameWOExt,overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins( fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),),
                               subtitle:Text(_mycontroller.musicList[index].artist.toString(),overflow: TextOverflow.ellipsis,style: GoogleFonts.poppins( fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),), 
                               trailing: Container(
                                 
                                 width: 47,
                                 height: 47,
                                 decoration: BoxDecoration(
                                  //  boxShadow: [
                                  //   //  BoxShadow(
                                  //   //    offset: Offset(0,3),
                                  //   //    blurRadius: 3,
                                  //   //    color: Colors.grey
                                  //   //  ),
                                  //   //  BoxShadow(
                                  //   //    offset: Offset(2,0),
                                  //   //    blurRadius: 3,
                                  //   //    color: Color.fromARGB(255, 39, 36, 36)
                                  //   //  )
                                  //  ],
                                   shape: BoxShape.circle,
                                   border: Border.all(width: 1,color: Color.fromARGB(87, 168, 165, 165)),
                                   gradient: LinearGradient(colors: [
                                     Colors.black38,
                                     Colors.black26
                                   ]
                                   ),
                                   
                                 ),
                                 child: Center(child: Icon( Icons.play_arrow_rounded,grade:24.3,color: Color.fromARGB(209, 255, 255, 255),  size: 31,)),
                               ),
                               onTap: () => {
                                               _mycontroller.playingIndex.value=index,
                                              _mycontroller.PlayController(_mycontroller.playingIndex.value),
                                     
                                         Get.to(()=> mainMusicPart(index:index,),)
                                         }),
                             ),
                           ); }
                           ))
          
          
        )
     
        ],
      ),
    );
  }

  Container topIcon( IconData icon) {
    return Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(167, 191, 193, 194),
              ),
              width: 40, height: 40,
              child: Center(child: Icon(icon, size: 14, color: Colors.black,)));

  }
}
