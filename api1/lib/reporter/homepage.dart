import 'dart:io';

import 'package:api1/reporter/apiservices.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<File>? files;
  List<XFile> multiImages = [];
  final ImagePicker imagesPick = ImagePicker();
  void pickImages() async {
    final List<XFile>? selectImage = await imagesPick.pickMultiImage();
    if (selectImage!.isNotEmpty) {
      setState(() {
        multiImages.addAll(selectImage);
        print(multiImages[0].path);
      });
    }
  }

  void pickAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      print(files[0].path);
    } else {
      print("error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              pickImages();
            },
            child: Text("Pick Images"),
          ),
          ElevatedButton(
            onPressed: () {
              pickAudio();
            },
            child: Text("Pick Audio"),
          ),
          ElevatedButton(
            onPressed: () {
              PostReview.submitReview(
                      ocrResult: "HELLO",
                      qrResult: "89601785",
                      experience: "Perfect",
                      size: "M",
                      looksRatting: "4",
                      smellRatings: "5",
                      product_title: "red rose",
                      product_description:
                          "The Red Rose Symbolizes Romance, Love, Beauty, And Courage. A Red Rosebud Signifies Beauty And Purity. A Thornless Red Rose Means Love At First Sight.",
                      product_id: "163",
                      user_id: "2841",
                      audioFile: files?[0].path,
                      flower: [multiImages[0].path, multiImages[1].path],
                      extraFile: multiImages[0].path)
                  .whenComplete(() => print("done"));
            },
            child: Text("Upload Data"),
          ),
        ],
      ),
    );
  }
}
