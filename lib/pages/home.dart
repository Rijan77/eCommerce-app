import 'package:flutter/material.dart';
import '../widget/support_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "lib/assets/images/headphone_icon.png",
    "lib/assets/images/laptop.png",
    "lib/assets/images/watch.png",
    "lib/assets/images/TV.png",
    "lib/assets/images/mobile2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff2f2f2),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hey, Rijan",
                          style: AppWidget.boldTextFeildStyle(),
                        ),
                        Text("Good Morning",
                            style: AppWidget.lightTextFieldStyle()),
                      ],
                    ),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "lib/assets/images/boy.jpg",
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ))
                  ],
                ),
                const SizedBox(
                  height: 30.0,
                ),
                SingleChildScrollView(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search Products",
                            hintStyle: AppWidget.lightTextFieldStyle(),
                            prefixIcon: const Icon(
                              Icons.search,
                              color: Colors.black87,
                              size: 26.0,
                            )),
                      )),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Categories",
                        style: AppWidget.semiboldTextFeildsStyle()),
                    const Text("see all",
                        style: TextStyle(
                            color: Color(0xFFfd6f3e),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Container(
                      height: 130,
                        padding: const EdgeInsets.all(20.0),
                        margin: const EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                            color: const Color(0xFFFD6F3E),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                            child: Text(
                          "All",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ))),
                    Expanded(
                      child: SizedBox(
                        height: 130,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                            itemCount: categories.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return CategoryTile(image: categories[index]);
                            }),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("All Products",
                        style: AppWidget.semiboldTextFeildsStyle()),
                    const Text("see all",
                        style: TextStyle(
                            color: Color(0xFFfd6f3e),
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold))
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 240,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        margin: const EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("lib/assets/images/headphone2.png", height: 150, width: 150, fit: BoxFit.cover, ),
                            Text("Headphone", style: AppWidget.semiboldTextFeildsStyle(),),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                const Text("\$100", style: TextStyle(color: Color(0xfffd6f3e), fontSize: 22.0, fontWeight: FontWeight.bold),),
                                const SizedBox(width: 40.0,),
                                Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: const Color(0xfffd6f3e),
                                    borderRadius: BorderRadius.circular(7)
                                  ),
                                    child: const Icon(Icons.add, color: Colors.white,))
                              ],
                            )
                          ],
                        ),
                      ),
          
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        margin: const EdgeInsets.only(right: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("lib/assets/images/watch2.png", height: 150, width: 150, fit: BoxFit.cover, ),
                            Text("Apple Watch", style: AppWidget.semiboldTextFeildsStyle(),),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                const Text("\$350", style: TextStyle(color: Color(0xfffd6f3e), fontSize: 22.0, fontWeight: FontWeight.bold),),
                                const SizedBox(width: 40.0,),
                                Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xfffd6f3e),
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                    child: const Icon(Icons.add, color: Colors.white,))
                              ],
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset("lib/assets/images/laptop2.png", height: 150, width: 150, fit: BoxFit.cover, ),
                            Text("Laptop", style: AppWidget.semiboldTextFeildsStyle(),),
                            const SizedBox(height: 10.0,),
                            Row(
                              children: [
                                const Text("\$1500", style: TextStyle(color: Color(0xfffd6f3e), fontSize: 22.0, fontWeight: FontWeight.bold),),
                                const SizedBox(width: 40.0,),
                                Container(
                                     padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: const Color(0xfffd6f3e),
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                    child: const Icon(Icons.add, color: Colors.white,))
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

class CategoryTile extends StatelessWidget {
  String image;

  CategoryTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          const Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}
