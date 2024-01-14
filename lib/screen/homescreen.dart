import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:musicapp/screen/main_music_part.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_audio_query/on_audio_query.dart';
import '../controller/controller.dart';

class homescreen extends StatelessWidget {
  
   homescreen({super.key});
 var _mycontroller=Get.find<MyController>();
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Color.fromARGB(255, 13, 18, 22),
       appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(icon:Icon(Icons.menu),
        onPressed: ()=>{
        
        },

        ),
        title: Text("OO747 Music "),
        centerTitle: true,
        actions: [
          IconButton(onPressed: ()=>{}, icon: Icon(Icons.more_vert))
        ]),
       body: FutureBuilder(
        future: _mycontroller.onaudioQuery.querySongs(),
        builder: (context, snapshot) {
          if(snapshot.data==null){
return Center(
  child: CircularProgressIndicator( color: Color.fromARGB(255, 161, 29, 73),),
);
          }
          else if(snapshot.data!.isEmpty){
      return Center(
        child: Text("No songs ",style:GoogleFonts.aclonica(fontSize: 21,color: Colors.white),),
      );
          }
          

          return ListView.builder(
        physics:BouncingScrollPhysics() ,
        itemCount: snapshot.data!.length,
        itemBuilder: (BuildContext context, int index) { 
        return Card(
        color: Color.fromARGB(255, 37, 45, 51),
 shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20.0),
            ),
          child: Obx(() => 
            ListTile(
              leading:QueryArtworkWidget(id: snapshot.data![index].id,type: ArtworkType.AUDIO,
              nullArtworkWidget:  Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                    color: Colors.transparent
                  ),
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                    Color.fromARGB(255, 255, 8, 160),
                    Color.fromARGB(255, 209, 157, 14),
                    Color.fromARGB(255, 250, 0, 250),
                    Color.fromARGB(255, 2, 175, 255),
                    ])
                     ),
            child: Container(decoration: BoxDecoration(shape: BoxShape.circle ,color:Color.fromARGB(255, 13, 18, 22)) , child: Icon(Icons.music_note ,size: 25,color: Colors.white,),)),
              ),
            title: Text(snapshot.data![index].displayNameWOExt,style: TextStyle(color: Colors.white),),
            subtitle: Text(snapshot.data![index].artist.toString(),style: TextStyle(color:Colors.white ),),
            trailing:_mycontroller.playingIndex==index && _mycontroller.isplaying==true? Icon(Icons.play_arrow_outlined,color: Colors.white,size: 32,):Text(""),
            onTap: () => {
              _mycontroller.PlayController(index),
              Get.to(
              mainMusicPart( index: snapshot.data![index].id,)
            ),
            }
            ),
          ),
        );
        },
     );
     },),
    );
  }
}