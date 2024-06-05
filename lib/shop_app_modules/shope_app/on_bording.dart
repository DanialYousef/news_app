import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


//محمد عبد الله قناص
class BoardingModel {
  final String title;
  final String img;
  BoardingModel(
      {
        required this.title,
        required this.img
      }
      );
}

class OnBordingScreen extends StatefulWidget {
  @override
  State<OnBordingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBordingScreen> {
  bool isLast = false;

  List<BoardingModel> boarding = [
    BoardingModel(
        title: 'Order from your favourite stores or vendors',
        img: 'assets/images/boarding1.png'),
    BoardingModel(
        title: 'Choose from a wide range of  delicious meals',
        img: 'assets/images/boarding2.png'),
    BoardingModel(
        title: 'Enjoy instant delivery and payment',
        img: 'assets/images/boarding3.png'),
  ];

  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(image: AssetImage('assets/images/Icon.png')),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
             // navigateAndFinish(context, LoginScreen());
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Color.fromRGBO(250, 90, 30, 1),
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 19.0),
        child: PageView.builder(
          controller: boardController,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildBoardingItem(boarding[index]),
          itemCount: 3,
          onPageChanged: (index) {
            if (index == boarding.length - 1) {
              setState(() {
                isLast = true;
              });
            } else {
              setState(() {
                isLast = false;
              });
            }
          },
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 108.0,
        ),
        Text(
          '${model.title}',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24.0,
              fontFamily: 'DmSans'),
        ),
        SizedBox(
          height: 50.0,
        ),
        model.img != 'assets/images/boarding3.png'
            ? Expanded(child: Image(image: AssetImage('${model.img}')))
            : Expanded(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: 1,
                  color: const Color.fromRGBO(249, 136, 31, 1),
                )),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(33, 5, 33, 10),
              child: Image(image: AssetImage('${model.img}')),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 48,
            ),
            SmoothPageIndicator(
              controller: boardController,
              count: 3,
              effect: ScrollingDotsEffect(
                dotColor: Color.fromRGBO(196, 196, 196, 1),
                activeDotColor: Color.fromRGBO(11, 115, 95, 1),
                dotHeight: 8,
                dotWidth: 8,
                spacing: 8,
              ),
            ),
            IconButton(
              color: Color.fromRGBO(250, 90, 30, 1),
              onPressed: () {
                if (isLast) {
                 // navigateAndFinish(context, LoginScreen());
                } else {
                  boardController.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInCubic,
                  );
                }
              },
              icon: Icon(
                Icons.arrow_forward_ios,
                size: 30,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
