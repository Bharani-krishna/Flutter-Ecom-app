import 'package:flutter/material.dart';

import 'package:ecom_app/apicall.dart';
import 'package:ecom_app/buynow.dart';

class phonegallary extends StatefulWidget {
  const phonegallary({super.key, this.Title, required String title});
  final Title;
  @override
  State<phonegallary> createState() => _phonegallary();
}

class _phonegallary extends State<phonegallary> {
  Future? betaapi;
  List quantity = [];
  @override
  void initState() {
    betaapi = callfun();
    super.initState();
  }

  callfun() async {
    var temp = await apicall.getproducts();

    for (int i = 0; i < temp.length; i++) {
      quantity.add(0);
    }
    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X-Store'),
      ),
      body: FutureBuilder(
        future: betaapi,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                  itemCount: quantity.length,
                  itemBuilder: (context, i) {
                    return Card(
                      elevation: 5,
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Padding(
                                padding: EdgeInsets.only(
                                    top: 10, left: 10, right: 10)),
                            Image.network(snapshot.data[i]["thumbnail"]),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Expanded(
                                        child: Text(
                                            "Name: ${snapshot.data[i]["title"]}")),
                                    Row(
                                      children: [
                                        IconButton(
                                            onPressed: () {},
                                            icon: const Icon(Icons.favorite)),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Text("Brand: ${snapshot.data[i]["brand"]}"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(left: 10)),
                                    Text(
                                        '\$${snapshot.data[i]["price"].toString()}'),
                                    const Expanded(
                                        child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 20))),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (quantity[i] != 0) {
                                                quantity[i]--;
                                              }
                                            });
                                          },
                                          icon: const Icon(Icons.remove),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [Text(quantity[i].toString())],
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              quantity[i]++;
                                            });
                                          },
                                          icon: const Icon(Icons.add),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 20)),
                                Row(
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(left: 50)),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) => buynow(
                                                      phone:
                                                          snapshot.data[i])));
                                        },
                                        child: const Text("BUY NOW",
                                            style: TextStyle(fontSize: 16))),
                                    const Padding(
                                        padding: EdgeInsets.only(left: 20)),
                                    TextButton(
                                        onPressed: () {},
                                        child: const Text("ADD TO CART",
                                            style: TextStyle(fontSize: 16))),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
