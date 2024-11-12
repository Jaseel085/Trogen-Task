import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;
import 'package:trogen/data_model.dart';
import 'package:trogen/feature/product/productDetails.dart';

import '../main.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String store='';
  List decoded=[];
  List<DataModel> dataModel = [];
  bool isloading=true;

  List category=["Arrivals", "Trending"];
  getData() async {
    isloading=true;
    try {
      final response = await http.get(Uri.parse("https://fake-store-api.mock.beeceptor.com/api/products"));

      final List<dynamic> decodedList = jsonDecode(response.body);

      dataModel = decodedList.map((item) => DataModel.fromMap(item)).toList();

      print(decodedList);

      setState(() {
        isloading=false;
      });

    } catch (e) {
      print(e.toString());
    }
  }
List images=[
  "asset/images/smart_phone.png",
  "asset/images/laptop.png",
  "asset/images/headphone.png",
  "asset/images/smartwatch.png",
  "asset/images/camer.png",
  "asset/images/tv.png",
  "asset/images/tablet.png",
  "asset/images/gaming.png",
  "asset/images/refirigator.png",
];
  @override
  void initState() {
    getData();

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text("TROGEN",style: GoogleFonts.urbanist(
            fontSize: wi*0.08,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
            centerTitle: true
          ,
        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                isloading==true?Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 150,),
                      Text("Please wait a moment....",
                        style: GoogleFonts.urbanist(
                        fontWeight: FontWeight.bold,
                        color: Colors.teal,
                        fontSize: wi*0.05,
                      ),),
                      CircularProgressIndicator(),
                    ],
                  ),
                ):
                Container(
                  height: wi*1.8,
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: dataModel.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () async {
                          await showDialog(
                            context: context,
                            builder: (context) => Productdetails(
                              product: dataModel[index],
                              image: images[index],
                              review: dataModel.map((product) => product.reviews).toList(), //
                            ),
                          );
                        },
                        child: Container(
                          height: wi*0.9,
                          width: wi*0.1,
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(color: Colors.teal, width: 1),
                          ),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(8,0,0,0),
                              child: Column(
                                children: [
                                  Container(
                                    height: wi*0.37,
                                    width: wi*0.3,
                                    // color: Colors.red,
                                    child: Image.asset(images[index]),
                                  ),
                                  // SizedBox(height: 8),
                                  Center(child: Text( dataModel[index].name.toString(), style: GoogleFonts.urbanist(
                                    fontWeight: FontWeight.bold
                                  ))),
                                 SizedBox(height: 10,),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,

                                      children: [
                                        Text("Brand: "),
                                        Text(dataModel[index].brand.toString(),style:GoogleFonts.urbanist(
                                            fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Price: "),
                                        Text("₹${dataModel[index].price.toString()}",style:GoogleFonts.urbanist(
                                            fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text("Rating: "),
                                        Text("${dataModel[index].rating}*",style:GoogleFonts.urbanist(
                                            fontWeight: FontWeight.bold
                                        ),),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
            
              ],
            ),
          ),
        )


      ),
    );
  }
}
