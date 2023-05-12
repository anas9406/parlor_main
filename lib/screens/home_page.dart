import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parlor_main/model/salon_model.dart';
import 'package:parlor_main/screens/detail_page.dart';
import 'package:parlor_main/screens/login_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    List<SalonModel> salonList = [
      SalonModel(
          name: "Hair Craft Men's Salon",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipNzy4XoCU-y1o33mW_8d9Qifve940OQ7spbRd0i=s2732-w2732-h1336-rw"),
      SalonModel(
          name: "NABILA Clifton Karachi",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipMsv9am10fZcpF7rClMCLGxt7wWo3FnJZ0l4wO8=s2732-w2732-h1336-rw"),
      SalonModel(
          name: "Lavish Women Salon",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipN8ZN-gKNiJDLJ7omTjGhlk8ZDOB4PgZZVRH_D3=s2732-w2732-h1336-rw"),
      SalonModel(
          name: "Gillan Salon & Spa",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipNjKbY_u5NuTXmpcp7oAx8lMUYJf90Ifo5B8V7W=s2732-w2732-h1336-rw"),
      SalonModel(
          name: "Infinity Hair Salon",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipMomHJaFOA4r0qqxPVeTWLKkkRNL4_GCvXitBaK=s2732-w2732-h1336-rw"),
      SalonModel(
          name: "Neelo's Salon and Spa",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipPL_ecvwchWhAxs7FvJQbDJ9INrtQqdnxYOFXzk=s2732-w2732-h1336-rw"),
      SalonModel(
          name: "Zara's Salon",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipM8hiJj0Ya_arxh6t64XCtMjyR6_ykOwvNCHydo=s2732-w2732-h1336-rw"),
      SalonModel(
          name: "Keune House",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipMcEQZdh_YhdJeEMmBSOzzDOWcj3o3Lk8Nyb_N_=s2732-w2732-h1336-rw"),
      SalonModel(
          name: "S-Pro Men's &Women's Saloon",
          imagePath:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQAHI2BJuWvuubC-1jb3hDJL4i8FI3Xf2YMOORK8t7_vg&s"),
      SalonModel(
          name: "Deep Cuts Men’s Salon",
          imagePath:
              "https://lh3.googleusercontent.com/p/AF1QipMxpbvn1sQr8RcXj_DSci6JOFFNHlLd8Wm0gqZ4=s2732-w2732-h1336-rw"),
    ];
    final screen_size_width = MediaQuery.of(context).size.width;
    final screen_size_height = MediaQuery.of(context).size.height;


    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.short_text, color: Colors.black87),
            onPressed: () {
              _scaffoldKey.currentState?.openDrawer();
            }),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(),
            margin: EdgeInsets.only(right: 15, top: 15),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: NetworkImage(
                "https://media.istockphoto.com/id/1337144146/vector/default-avatar-profile-icon-vector.jpg?s=612x612&w=0&k=20&c=BIbFwuv7FxTWvh5S3vB6bkT0Qv8Vn8N5Ffseq84ClGI=",
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Text(
                  "Parlor Me",
                  style: TextStyle(color: Colors.white, fontSize: 30, ),
                ),
              ),
              decoration: BoxDecoration(color: Colors.black),
            ),

            ListTile(
              onTap: () async {
                try {
                  await FirebaseAuth.instance.signOut();
                } catch(e){
                  print(e);
                }
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
              },
              leading: Icon(Icons.logout),
              title: Text(
                "Logout",
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: screen_size_width,
        height: screen_size_height,
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: Text("Hi, we provide the service",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w600))),
                  ]),

              SizedBox(height: 50),

              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: Text("Available Salons",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600))),

                  ]),
              SizedBox(height: 20),
              GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                itemCount: salonList.length,
                itemBuilder: (BuildContext context, int index) {
                  SalonModel salon = salonList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (_) => DetailPage(salonModel: salon,)));
                      },
                      child: SpecialistColumn(
                          specImg: salon.imagePath, specName: salon.name),
                    ),
                  );
                }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpecialistColumn extends StatelessWidget {
  final String specImg, specName;

  const SpecialistColumn({required this.specImg, required this.specName});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          // width: 120,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: NetworkImage(specImg), fit: BoxFit.cover)),
        ),
        Container(
          // width: 120,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10),
              Text(specName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              SizedBox(height: 4),
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
              ]),
              SizedBox(height: 4),
            ],
          ),
        )
      ],
    );
  }
}

class UIData {
  static const String homePageRoute = "/homePageRoute";
  static const String introPageRoute = "/introPageRoute";
  static const String bookPageRoute = "/bookPageRoute";

  //Colors
  static const Color mainColor = Color.fromRGBO(241, 118, 138, 1);
  static const Color lightColor = Color.fromRGBO(252, 223, 228, 1);
  static const Color lighterColor = Color.fromRGBO(254, 248, 240, 1);
}
