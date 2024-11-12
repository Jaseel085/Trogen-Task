import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trogen/data_model.dart';
import 'package:trogen/feature/product/reviews.dart';

import '../../main.dart';

class Productdetails extends ConsumerStatefulWidget {
    final DataModel product;
    final String image;
    final List review;
  const Productdetails({super.key,required this.product,required this.image,required this.review});

  @override
  ConsumerState createState() => _ProductdetailsState();
}

class _ProductdetailsState extends ConsumerState<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24)
        ),
        child:Container(
          padding: EdgeInsets.all(15),
          width: wi*0.7,
          height: wi*1.5,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(wi * 0.03),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  offset: Offset.zero,
                  blurRadius: 7,
                  spreadRadius: 1,
                )
              ]
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: wi*0.5,
                width: wi*0.4,
                // color: Colors.red,
                child: Image.asset(widget.image,fit: BoxFit.fill,),
              ),
              // SizedBox(height: 8),
              Center(child: Text( widget.product.name.toString(), style: GoogleFonts.urbanist(
                  fontWeight: FontWeight.bold,
                fontSize: wi*0.07
              ))),
              SizedBox(height: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [
                        Text("Brand: ",style: TextStyle(
                          fontSize: 20
                        ),),
                        Text(widget.product.brand.toString(),style:GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold,
                          fontSize: 18
                        ),),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Price: ",style: TextStyle(
                        fontSize: 20
                    ),),
                        Text(widget.product.price.toString(),style:GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Rating: ",style: TextStyle(
                            fontSize: 20
                        ),),
                        Text("${widget.product.rating}*",style:GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      ],
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Discount: ",style: TextStyle(
                            fontSize: 20
                        ),),
                        Text("${widget.product.discount}%",style:GoogleFonts.urbanist(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                        ),),
                      ],
                    ),
                  ),


                ],
              ),
              SizedBox(height: 10,),
              TextButton(onPressed: ()async {
                await showDialog(context: context, builder: (context) =>
                    Reviews(reviews: widget.product.reviews!.toList(),),);
              }, child: Text("Reviews",style: GoogleFonts.urbanist(

              ),)),
              SizedBox(height: 2,),
              Container(
                height: wi*0.15,
                width: wi*0.4,
                decoration: BoxDecoration(
                    color:Colors.teal,
                  borderRadius: BorderRadius.circular(wi*0.02)
                ),
                child: Center(
                  child: Text(
                    "Add To Cart",style: GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                  ),
                ),
              )

            ],
          ),
        ),
      );
    },);
  }
}
