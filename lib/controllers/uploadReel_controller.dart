import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:freels/constants.dart';
import 'package:freels/models/video_model.dart';
import 'package:freels/views/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:video_compress/video_compress.dart';

class UploadReelController extends GetxController {
  compressVideo(String path) async {
    final compVid = await VideoCompress.compressVideo(path,
        quality: VideoQuality.MediumQuality);
    return compVid!.file;
  }

  Future<String> uploadToStorage(String id, String folder, String path) async {
    Reference ref = firebaseStorage.ref().child(folder).child(id);
    UploadTask up;
    if (folder == 'reels') {
      up = ref.putFile(await compressVideo(path));
    } else {
      up = ref.putFile(await thumbnail(path));
    }
    final snap = await up;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  thumbnail(String path) async {
    final thumbNail = await VideoCompress.getFileThumbnail(path);
    return thumbNail;
  }

  uploadReel(String vidPath, String caption) async {
    try {
      final uid = firebaseAuth.currentUser!.uid;
      DocumentSnapshot userDoc =
          await fireStore.collection('users').doc(uid).get();
      final dt = DateTime.now();
      final videoUrl = await uploadToStorage("reel-$dt", 'reels', vidPath);
      final thumbnail = await uploadToStorage("th-$dt", 'thumbnail', vidPath);

      Video video = Video(
          userName: (userDoc.data()! as Map<String, dynamic>)['name'],
          id: 'reel-$dt',
          uid: uid,
          vidUrl: videoUrl,
          thumbnail: thumbnail,
          caption: caption,
          likes: [],
          commentCount: 0,
          dp: (userDoc.data()! as Map<String, dynamic>)['profilePhoto']);
      await fireStore.collection('reels').doc('reel-$dt').set(video.toJson());
      Get.snackbar('Successfully', 'Uploaded');
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
