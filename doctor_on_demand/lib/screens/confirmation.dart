// import 'package:doctor_on_demand/backend/server.dart';
// import 'package:doctor_on_demand/models/app_date.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../backend/app_provider.dart';
// class ConfirmationSate extends StatefulWidget {
//   @override
//   _ConfirmationSate createState() => _ConfirmationSate();
// }

// class _ConfirmationSate extends State<ConfirmationSate> {
//     @override
//   void initState() {
//     super.initState();
//     getALLappintments();
//   }

//    showAlertDialog(BuildContext context , String id) {
//     // set up the buttons
//     Widget cancelButton = TextButton(
//       child: Text("لا"),
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//     );
//     Widget continueButton = TextButton(
//       child: Text("نعم"),
//       onPressed: ()async {
//       deleteAppintments(id);
//         Navigator.of(context).pop();
//       },
//     );

//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//     title: Text(" تأكيد الحذف" ,textDirection: TextDirection.rtl,),
//     content: Text("هل أنت متاكد من حذف الموعد ؟ " ,textDirection: TextDirection.rtl ),
//     actions: [
//     cancelButton,
//     continueButton,
//       ],
//     );
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
// Size sizes = MediaQuery.of(context).size ; 
// return Scaffold(
// appBar: AppBar(title: Text("قائمة المواعيد ",),centerTitle: true,),
//   body: Directionality(
//   textDirection:  TextDirection.rtl,
//   child: Container(
//   margin: EdgeInsets.symmetric(vertical: sizes.height*0.03 , horizontal: sizes.width*0.02),
//   child: Selector<AppsProvider , List<DateApp>>(           
//   builder: (context, value, child) {
//   return value.isEmpty
//   ? Center(
//   child: CircularProgressIndicator()
//    )
//    :ListView.builder(
//     scrollDirection: Axis.vertical,
//    physics: ClampingScrollPhysics(),
//     shrinkWrap: true,
//      itemCount: value.length,
//     itemBuilder: (context , index) {
//       return   Card(
//     elevation: 5,
//     child: InkWell(
//         onTap: () {},
//       child: ExpansionTile(
//            title: Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//    Padding(
//    padding: const EdgeInsets.only(left: 5),
//      child: Text(    
                                        
//       "Dr." +value[index].doctorName ,
                                      
//     ),
//   ),
//   Text(
//    value[index].time.toString(),style: TextStyle(),
//    ),
// SizedBox(
// width: 0,
// ),
// ],
// ),
// subtitle: Padding(
//  padding: const EdgeInsets.only(left: 5),
//   child: Text(
//    value[index].dateTime,// style: GoogleFonts.cairo(),
// ),
                                
// ),
// children: [
//  Padding(
//  padding: const EdgeInsets.only(
//     bottom: 20, right: 10, left: 16),
//                            child: Row(
//                                       mainAxisAlignment:
//             MainAxisAlignment.spaceBetween,
//                                       children: [
//           Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.start,
//                                           children: [
//                                             Text(
//                                               "Patient Name" + value[index].patientName ,
//           //      style: GoogleFonts.cairo(
//                                                // fontSize: 16,
//                                              // ),
//                                             ),
//                                             SizedBox(
//                                               height: 10,
//                                             ),
//                                             Text(
//                                               "الساعة:  " +
//                                                   value[index].time ,
//                                               // style: GoogleFonts.cairo(
//                                               //   fontSize: 16,
//                                               // ),
//                                             ),
//                                           ],
//                                         ),
//                                         IconButton(
//                                           tooltip: 'Delete Appointment',
//                                           icon: Icon(
//                                             Icons.delete,
//                                             color: Colors.black87,
//                                           ),
//                                           onPressed: () {
                                            
//                                        showAlertDialog(context,value[index].id);
//                                           },
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
                          
//                       );
//                       },
//                     );
//                     },
            
                        
                          
                    
//             selector: (x, y) {
//               return y.dateApp ;
//             },
//             ),

//             ),
//       ),
      
             
//     );
//   }
// }