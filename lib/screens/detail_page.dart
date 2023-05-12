

import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:parlor_main/model/salon_model.dart';

import 'home_page.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.salonModel}) : super(key: key);

  final SalonModel salonModel;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {


  @override
  Widget build(BuildContext context) {
    print("${widget.salonModel}");

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [

            Container(
              // padding: EdgeInsets.only(left: 40, right: 40, top: 50 ),
              height: height,
              width: width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                        height: 200,
                        child: Image.network("${widget.salonModel.imagePath}", fit: BoxFit.fill)),
                  ),

                  SizedBox(height: 20,),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Text("${widget.salonModel.name}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 25, fontWeight: FontWeight.w600))),
                            ]),
                        SizedBox(height: 10,),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Text("We provide one of the best services in town.",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w300))),
                            ]),
                        SizedBox(height: 10,),
                        Row(children: <Widget>[
                          Icon(Icons.star, color: UIData.mainColor, size: 14),
                          SizedBox(width: 1),
                          Icon(Icons.star, color: UIData.mainColor, size: 14),
                          SizedBox(width: 1),
                          Icon(Icons.star, color: UIData.mainColor, size: 14),
                          SizedBox(width: 1),
                          Icon(Icons.star, color: UIData.mainColor, size: 14),
                          SizedBox(width: 1),
                          Icon(Icons.star, color: UIData.lightColor, size: 14),

                          SizedBox(width: 10),
                          Text("(01 Reviews)", style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w300, color: Colors.grey),)
                        ]),

                        SizedBox(height: 30,),

                        /// Opening Hours
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Text("Opening Hours",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w500))),
                            ]),

                        SizedBox(height: 10,),

                        Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("Monday - Friday",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w300, color: Colors.grey))),
                              Text("01:00 pm - 10:00 pm",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black)),
                            ]),
                        SizedBox(height: 08,),
                        Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("Saturday",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w300, color: Colors.grey))),
                              Text("10:00 am - 11:00 pm",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black)),
                            ]),


                        /// Contact
                        SizedBox(height: 30,),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Text("Contact",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w500))),
                            ]),

                        SizedBox(height: 10,),
                        Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("0300-8230031",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w300, color: Colors.blue))),
                            ]),


                        /// Address
                        SizedBox(height: 30,),

                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                  child: Text("Address",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w500))),
                            ]),

                        SizedBox(height: 10,),
                        Row(
                            children: <Widget>[
                              Expanded(
                                  child: Text("A-01, Street#2, Gulshan-e-Iqbal, Karachi",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black))),
                            ]),






                      ],
                    ),
                  ),

                  Expanded(
                    child: Container(),
                  ),

                  Container(
                    height: 50,
                    width: width * 0.8,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () async{
                        SmartDialog.showLoading();
                        await Future.delayed(Duration(seconds: 3));
                        SmartDialog.dismiss();

                        Navigator.push(
                        context, MaterialPageRoute(builder: (_) => SuccessScreen()));
                      },
                      child: Text(
                        'Book Now',
                        style: TextStyle(color: Colors.white, fontSize: 20, ),
                      ),
                    ),
                  ),

                  SizedBox(height: 70,)

                ],
              ),
            ),

            Positioned(
                top: 10,
                left: 10,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white70,

                  ), child: BackButton()))

          ],

        ),
      ),
    );
  }
}



class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 100.0,
                ),
                SizedBox(height: 20),
                Text(
                  'Success!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 50,
            child: Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Continue',
                  style: TextStyle( fontSize: 20),
                ),
              ),
            ),
          ),



        ],
      ),
    );
  }
}

