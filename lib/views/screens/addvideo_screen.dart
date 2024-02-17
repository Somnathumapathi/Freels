import 'dart:io';

import 'package:flutter/material.dart';
import 'package:freels/controllers/uploadReel_controller.dart';
import 'package:freels/views/screens/confirm_screen.dart';
import 'package:freels/views/screens/home_screen.dart';
import 'package:freels/views/widgets/textinputfield.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class AddvideoScreen extends StatefulWidget {
  AddvideoScreen({super.key});

  @override
  State<AddvideoScreen> createState() => _AddvideoScreenState();
}

class _AddvideoScreenState extends State<AddvideoScreen> {
  File? video;
  final TextEditingController _captionController = TextEditingController();

  String? videoPath;
  late VideoPlayerController _vcontroller;
  UploadReelController _uploadReelController = Get.put(UploadReelController());

  // @override
  // void initState() {
  //   super.initState();
  //   if (video != null) {
  //     _vcontroller = VideoPlayerController.file(video!);
  //     _vcontroller.initialize().then((_) {
  //       setState(() {});
  //       _vcontroller.play();
  //       _vcontroller.setVolume(1);
  //       _vcontroller.setLooping(true);
  //     });
  //   }
  // }

  @override
  void dispose() {
    super.dispose();
    _vcontroller.dispose();
    _captionController.dispose();
  }

  _pickVideo(ImageSource src, BuildContext context) async {
    final vid = await ImagePicker().pickVideo(source: src);
    if (vid != null) {
      setState(() {
        video = File(vid.path);
        videoPath = vid.path;
      });
      try {
        _vcontroller = VideoPlayerController.file(video!);
        await _vcontroller.initialize();
        print('INITIALISED');
        _vcontroller.play();
        _vcontroller.setVolume(1);
        _vcontroller.setLooping(true);
        setState(() {});
      } catch (error) {
        print('Error initializing video player: $error');
      }
      Navigator.of(context).pop();
    }
  }

  _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(Icons.photo),
                        onPressed: () =>
                            _pickVideo(ImageSource.gallery, context),
                      ),
                      IconButton(
                        icon: Icon(Icons.camera),
                        onPressed: () =>
                            _pickVideo(ImageSource.camera, context),
                      ),
                      IconButton(
                        icon: Icon(Icons.cancel_outlined),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Reel"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
              child: Column(
            children: [
              (video == null)
                  ? InkWell(
                      onTap: () => _showDialog(context),
                      child: Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "https://static.vecteezy.com/system/resources/thumbnails/002/492/342/small/35mm-film-reel-frames-free-vector.jpg"))),
                          child: Container(
                              height: 50,
                              width: 50,
                              // color: Colors.black,
                              child: Icon(
                                Icons.add_a_photo,
                                color: Colors.black,
                              ))),
                    )
                  : SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 1.5,
                      child: VideoPlayer(_vcontroller),
                    ),
              TextInputField(
                  controller: _captionController,
                  labelText: 'Enter caption',
                  icon: Icon(Icons.woo_commerce_outlined),
                  isObscure: false),
              (video != null)
                  ? ElevatedButton.icon(
                      onPressed: () {
                        print(videoPath);
                        _uploadReelController.uploadReel(
                            videoPath!, _captionController.text);
                        // setState(() {
                        //   video = null;
                        // });
                        // _captionController.text = '';
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      },
                      icon: Icon(Icons.send),
                      label: Text("Share"),
                    )
                  : SizedBox()
            ],
          )),
        ),
      ),
    );
  }
}
