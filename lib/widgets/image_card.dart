// import 'package:flutter/material.dart';
// import 'package:salon_app/widgets/button2.dart';
//
// class ImageCard extends StatefulWidget {
//   final String cardImg;
//
//   const ImageCard({Key key, this.cardImg}) : super(key: key);
//
//   @override
//   _ImageCardState createState() => _ImageCardState();
// }
//
// class _ImageCardState extends State<ImageCard> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: MediaQuery.of(context).size.width * .8,
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           image: DecorationImage(
//               colorFilter: ColorFilter.mode(
//                   Colors.black.withOpacity(0.4), BlendMode.darken),
//               image: AssetImage(widget.cardImg),
//               fit: BoxFit.cover)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           Text("Look awesome \n & save Some",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 18,
//               )),
//           SizedBox(height: 15),
//           MyButton2(btnText: "GET UPTO 50% OFF", onpressed: () {})
//         ],
//       ),
//     );
//   }
// }
//
//
//
// class MyButton2 extends StatelessWidget {
//   final String btnText;
//   final VoidCallback onpressed;
//
//   const MyButton2({key, required this.btnText, required this.onpressed}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       //padding: EdgeInsets.symmetric(horizontal: 10),
//       height: 30,
//       child: ElevatedButton(
//         color: UIData.mainColor,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
//         onPressed: onpressed,
//         child: Text(btnText, style: TextStyle(color: Colors.white,
//             fontWeight: FontWeight.w400)),
//       ),
//     );
//   }
//
// }