import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../main.dart';

class Reviews extends ConsumerStatefulWidget {
  final List reviews;
  const Reviews({super.key,required this.reviews});

  @override
  ConsumerState createState() => _ReviewsState();
}

class _ReviewsState extends ConsumerState<Reviews> {
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
          height: wi*1.1,
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
             Expanded(
               child: ListView.separated(
                 itemCount: widget.reviews.length,
                 itemBuilder: (BuildContext context, int index) {
                   // reviewslist=widget.reviews[index];
                   return Container(
                     // height: wi*0.2,
                     width:wi*0.4,
                     decoration: BoxDecoration(
                         // color: Colors.teal.shade50,
                         borderRadius: BorderRadius.circular(wi*0.03),
                         border: Border.all(color: Colors.teal)
                     ),
                     child: Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Column(
                         children: [
                           Row(
                             children: [
                               Text("RATING:  ",style: TextStyle(
                                 fontWeight: FontWeight.w500
                               ),),
                               Text("  ${widget.reviews[index]["rating"].toString()}⭐",
                                 style: TextStyle(fontSize: wi*0.07),),
                             ],
                           ),
                           Center(
                             child: Container(
                               width: 300, // Set the width as per your design
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 children: [
                                   Text(
                                     "Description: ",
                                     style: TextStyle(fontSize: 20),
                                   ),
                                   Flexible(
                                     child: Text(
                                       widget.reviews[index]["comment"].toString(),
                                       style: GoogleFonts.adamina(
                                         fontSize: wi*0.05,
                                         color: Colors.teal

                                       ),
                                       softWrap: true,
                                       overflow: TextOverflow.visible,
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                           )
                         ],
                       ),
                     ),
                   );
                 }, separatorBuilder: (BuildContext context, int index) {
                   return SizedBox(height: 20,);
               },
               ),
             )
            ],
          ),
        ),
      );
    },);
  }
}
