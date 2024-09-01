// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreenWidget extends StatefulWidget {
  const ProfileScreenWidget({super.key});

  @override
  State<ProfileScreenWidget> createState() => _ProfileScreenWidgetState();
}

class _ProfileScreenWidgetState extends State<ProfileScreenWidget> {
  List images = [
    'https://images.unsplash.com/photo-1716407406494-6ad6a8c16ad3?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTF8fHxlbnwwfHx8fHw=',
    'https://img.freepik.com/free-photo/beautiful-japanese-forest-scene_23-2151498074.jpg?size=626&ext=jpg',
    'https://img.freepik.com/free-photo/photorealistic-view-tree-nature-with-branches-trunk_23-2151478040.jpg?size=626&ext=jpg',
    'https://images.unsplash.com/photo-1716847214542-bc3d7f4b4212?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA==',
    'https://www.my-picture.co.uk/dynamicimage/product/libraryimages/image2/4628/passepartout-1-product-mobile-desktop-general.webp'
  ];
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          fileImage == null
              ? const Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://media.istockphoto.com/id/1450268558/photo/summer-selfie.webp?a=1&b=1&s=612x612&w=0&k=20&c=MduqR_Ln2Ee9nUY4ShDrC2YQQwZcntXyqczRCkmgHLI='),
                )
              : Image(
                  height: 200,
                  fit: BoxFit.cover,
                  image: FileImage(File(fileImage!.path))),
          const SizedBox(
            height: 20,
          ),
          CarouselSlider(
            items: [
              for (int i = 0; i < 5; i++)
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(images[i]),
                    ),
                  ),
                ),
            ],
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          CupertinoButton(
            color: Colors.blueAccent,
            child: const Text('Pick Image'),
            onPressed: () async {
              await showDialog(
                context: context,
                builder: (context) => AlertDialog(
                    content: SizedBox(
                  height: 200,
                  child: Column(
                    children: [
                      ListTile(
                        onTap: () {
                          openCamera();
                        },
                        leading: const Icon(Icons.camera_alt),
                        title: const Text('Camera'),
                      ),
                      const Divider(),
                      ListTile(
                        onTap: () {
                          openGallaryImage();
                        },
                        leading: const Icon(Icons.image),
                        title: const Text('Gallary'),
                      ),
                    ],
                  ),
                )),
              );
            },
          )
        ],
      ),
    );
  }

  void openGallaryImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      fileImage = File(image!.path);
    });
    Navigator.pop(context);
  }

  void openCamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      fileImage = File(image!.path);
    });
    Navigator.pop(context);
  }
}
