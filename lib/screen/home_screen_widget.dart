import 'package:flutter/material.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  List images = [
    'https://images.unsplash.com/photo-1716407406494-6ad6a8c16ad3?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8MTF8fHxlbnwwfHx8fHw=',
    'https://img.freepik.com/free-photo/beautiful-japanese-forest-scene_23-2151498074.jpg?size=626&ext=jpg',
    'https://img.freepik.com/free-photo/photorealistic-view-tree-nature-with-branches-trunk_23-2151478040.jpg?size=626&ext=jpg',
    'https://images.unsplash.com/photo-1716847214542-bc3d7f4b4212?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA==',
    'https://www.my-picture.co.uk/dynamicimage/product/libraryimages/image2/4628/passepartout-1-product-mobile-desktop-general.webp'
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      childAspectRatio: 10 / 14,
      children: [
        for (int i = 0; i < images.length; i++)
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Stack(
              children: [
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
                Positioned(
                  top: 5,
                  left: 5,
                  child: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.blueAccent, width: 2),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://media.istockphoto.com/id/1450268558/photo/summer-selfie.webp?a=1&b=1&s=612x612&w=0&k=20&c=MduqR_Ln2Ee9nUY4ShDrC2YQQwZcntXyqczRCkmgHLI='),
                        )),
                  ),
                )
              ],
            ),
          )
      ],
    );
  }
}
