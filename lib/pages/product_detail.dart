import 'package:flutter/material.dart';

import '../widget/support_widget.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfffef5f1),
      body: Container(
        padding: const EdgeInsets.only( top: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: const Icon(Icons.arrow_back_ios_new_outlined, size: 33,)),
              ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0),
                  child: Center(
                      child: Image.asset("lib/assets/images/headphone2.png", height: 400,)),
                )
            ]),

            Expanded(
              child: Container(
                padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Headphone", style: AppWidget.boldTextFeildStyle(),),
                        const Text("\$300",
                            style: TextStyle(
                                color: Color(0xFFfd6f3e),
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Text("Details", style: AppWidget.semiboldTextFeildsStyle(),),
                    const SizedBox(height: 10.0,),
                    const Text("These high-quality headphones offer exceptional sound clarity, even for the faintest sounds. Built with noise-canceling technology, they ensure an immersive listening experience. Enjoy comfort, durability, and a 1-year warranty."),
                    const SizedBox(height: 90.0,),

                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      decoration: BoxDecoration(
                        color: const Color(0xfffd6f3e),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: const Center(child: Text("Buy Now", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}
