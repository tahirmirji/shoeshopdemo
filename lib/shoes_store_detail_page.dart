import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'shoes_store_page.dart';

class ShoesStoreDetailPage extends StatelessWidget {
  final Shoe shoe;

  const ShoesStoreDetailPage({Key key, this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: shoe.color,
        child: Icon(Icons.shopping_basket),
        onPressed: () {
          // AlertDialog(
          //   title: Text('Products In Cart'),
          //   content: Text('Product Name: $shoe.name | Price: $shoe.price'),
          //   actions: [
          //     TextButton(onPressed: ()
          //     {
          //       Navigator.pop(context);
          //     }, child: null),
          //   ],

          // );
        },
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: -size.width / 2,
            right: -size.width / 3,
            width: size.width * 1.4,
            height: size.width * 1.4,
            child: Hero(
              tag: 'hero_background_${shoe.name}',
              child: Container(
                decoration: BoxDecoration(
                  color: shoe.color,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
                height: kToolbarHeight + 20,
                child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Text(
                      shoe.name.split(' ').first,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w700),
                    ),
                    actions: [
                      Padding(
                        padding: const EdgeInsets.only(right: 14.0),
                        child: Material(
                          elevation: 10,
                          shape: CircleBorder(
                              side: BorderSide(
                            color: shoe.color,
                          )),
                          color: shoe.color,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Icon(Icons.favorite_border),
                          ),
                        ),
                      ),
                    ]),
              )),
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: size.height * 0.1),
                  child: Hero(
                    tag: 'hero_image_${shoe.name}',
                    child: Image.asset(
                      shoe.image,
                      height: MediaQuery.of(context).size.width / 1.2,
                    ),
                  ),
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${shoe.name}',
                      style: GoogleFonts.roboto(
                          fontSize: 30.0,
                          color: shoe.color,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0),
                    ),
                    Text(
                      'Rs. ${shoe.price}',
                      style: GoogleFonts.roboto(
                          fontSize: 30.0,
                          color: shoe.color,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
