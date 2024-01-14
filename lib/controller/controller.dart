import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:just_audio/just_audio.dart';

class MyController extends GetxController{
    
    
  final OnAudioQuery onaudioQuery=OnAudioQuery();
  final AudioPlayer audioPlayer=AudioPlayer();
   
   RxList<SongModel> musicList = <SongModel>[].obs;
  var atEdege=true.obs;
   var playingIndex=0.obs;
   var isplaying=false.obs;
   var  slidervalue =0.0.obs;
   var possition=''.obs;
   var durationTimeSlider=0.0.obs;
   var possitionTimeslider=0.0.obs;
   var duration=''.obs;
    var musicname=''.obs;
    var artistsname=''.obs;
    var isStop=true.obs;

Future feachmusic() async{
 
  musicList.value= await onaudioQuery.querySongs();
 return musicList;
}



  PlayController( int index,){
    try{
      audioPlayer.stop();
      audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(musicList[index].uri!)));
      audioPlayer.play();
      playingIndex.value=index;
      isplaying(true);
      isStop(false);
      musicname.value=musicList[index].displayNameWOExt;
      artistsname.value="${musicList[index].artist}";
      setPosttion();
    
      }
   on Exception catch(e){
      print(e.toString());
}
  }

  ResumeController() {
   audioPlayer.play();
  isplaying(true);
  }

  PauseController() {
  audioPlayer.pause();
  isplaying(false);
  }


  @override
  void onInit() {
    super.onInit();
  
     checkpermissionstrage();
  feachmusic();

    }

    void dispose() {
    super.dispose();
  } 
 



 checkpermissionstrage() async{
  var permisstion=await Permission.storage.request();
 if(permisstion.isGranted) {
 }
 else
 {
  checkpermissionstrage();
 }
  }

  musicSeek(){
     audioPlayer.seek(Duration(seconds: possitionTimeslider.toInt()));
  }
  
 setPosttion(){
 
    audioPlayer.durationStream.listen((d) {
      duration.value=d.toString().split(".")[0];
      durationTimeSlider.value=d!.inSeconds.toDouble();
     
    });
    audioPlayer.positionStream.listen((p) {
      possition.value=p.toString().split(".")[0];
      possitionTimeslider.value=p.inSeconds.toDouble();
     });
   
 }

}