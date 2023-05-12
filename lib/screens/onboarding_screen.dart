import 'package:flutter/material.dart';
import 'package:parlor_main/screens/login_page.dart';

class OnboardingScreen extends StatefulWidget {
  static const String id = "onboarding";

  OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;
  int activePage = 0;

  List<String> images = [
    "https://images.unsplash.com/photo-1634449862841-8c6e970117e5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1366&q=80",
    "https://i.pinimg.com/originals/fc/8d/0b/fc8d0bff4e8a6ae1ec60eabdd825a1a0.jpg",
    "https://images.unsplash.com/photo-1512496015851-a90fb38ba796?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=435&q=80",
  ];

  List<String> text = [
    "Professional Specialist",
    "Pick Any Service",
    "Book & Enjoy the Experience",
  ];

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.white : Colors.white24,
            shape: BoxShape.circle),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 1);
  }

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                    itemCount: images.length,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        activePage = page;
                      });

                      if(page == images.length-1){
                        setState(() {
                          isLastPage = true;
                        });
                      } else{
                        if(isLastPage == true) {
                          setState(() {
                            isLastPage = false;
                          });
                        }
                      }
                    },
                    itemBuilder: (context, pagePosition) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                images[pagePosition],
                              ),
                              fit: BoxFit.cover),
                        ),
                        margin: EdgeInsets.all(10),
                        child:   Container(
                          height: MediaQuery.of(context).size.height,
                          width: double.infinity,
                          color: Colors.black54,
                        ),
                      );
                    }),
              ),
            ],
          ),

          Positioned(
            bottom: 50,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: indicators(images.length, activePage)),
          ),

          Positioned(
              top: 130,
              child: CustomText(text: text[activePage],),
          ),

          Positioned(
            bottom: 130,
            child: Container(
              width: width * 0.6,
              height: 60,
              child: ElevatedButton(
                  onPressed: (){
                    setState(() {
                      _pageController.animateToPage(_pageController.page!.toInt() + 1,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn
                      );

                      if(isLastPage){
                        // Navigator.of(context).pushNamed(LoginPage.id);
                        Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.id, (Route<dynamic> route) => false);
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                        // side: BorderSide(color: Colors.red)
                    )
                  ),
                  child: Text(isLastPage ? "Get Started":"Next", style: TextStyle(fontSize: 22),)
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomText extends StatelessWidget {

  final String text;

  CustomText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 20),
        // color: Colors.red,
        width: MediaQuery.of(context).size.width * 0.7,
        child: Text("${text}", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),));
  }
}
