import 'package:flutter/material.dart';
import 'package:ecom_app/apicall.dart';

class buynow extends StatefulWidget {
  final phone;
  const buynow({super.key, required this.phone});

  @override
  State<buynow> createState() => _buynowState();
}

class _buynowState extends State<buynow> {
  Future? betaapi;
  var quantity = 0;
  @override
  void initState() {
    betaapi = callfun();
    super.initState();
  }

  callfun() async {
    var temp = await apicall.getproducts();

    return temp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.phone != null ? widget.phone['title'] : "title"),
      ),
      body: FutureBuilder(
          future: betaapi,
          builder: (context, snapshot) {
            return Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: widget.phone != null
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child:
                                      Image.network(widget.phone['thumbnail']),
                                )
                              : const SizedBox()),
                      const Divider(
                        thickness: 1,
                        color: Colors.black,
                        endIndent: 8,
                        indent: 8,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              const Padding(padding: EdgeInsets.only(right: 5)),
                              Expanded(
                                child: Text(
                                  widget.phone != null
                                      ? widget.phone['title']
                                      : "title",
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontStyle: FontStyle.italic,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Georgia'),
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.favorite))
                                ],
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      widget.phone != null
                                          ? widget.phone['brand']
                                          : "brand",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Georgia')),
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "Stock (${widget.phone != null ? widget.phone['stock'].toString() : "stock"})",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Georgia')),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                      "\$${widget.phone != null ? widget.phone["price"].toString() : "price"}",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Georgia')),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity != 0) {
                                              quantity--;
                                            }
                                          });
                                        },
                                        icon: const Icon(Icons.remove))
                                  ],
                                ),
                                Row(
                                  children: [Text(quantity.toString())],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                          });
                                        },
                                        icon: const Icon(Icons.add))
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                    "Rating : ${widget.phone != null ? widget.phone['rating'].toString() : "rating"}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Georgia')),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.star))
                                ],
                              ),
                            ],
                          ),
                          // const Padding(padding: EdgeInsets.only(left: 25)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  179, 2, 167, 24))),
                                  child: const Text(
                                    "  BUY NOW  ",
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.white),
                                  )),
                              ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              const Color.fromARGB(
                                                  216, 196, 4, 4))),
                                  child: const Text("  ADD TO CART  ",
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white))),
                            ],
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                for (int i = 0;
                                    i < widget.phone["images"].length;
                                    i++)
                                  widget.phone != null
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(right: 10),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.network(
                                                widget.phone["images"][i],
                                                width: 300,
                                                fit: BoxFit.fitHeight),
                                          ),
                                        )
                                      : const SizedBox()
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                    "Description : ${widget.phone != null ? widget.phone['description'] : "no description"}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Georgia')),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ));
          }),
    );
  }
}
