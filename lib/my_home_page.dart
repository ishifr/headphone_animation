import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> hoverAnimation;

  List<HeadPhone> headphones = [
    HeadPhone(
      color: const Color(0xffb6d7e4),
      img: ('assets/blue.png'),
    ),
    HeadPhone(
      color: const Color(0xff000000),
      img: ('assets/black.png'),
    ),
    HeadPhone(
      color: const Color(0xfffcecd0),
      img: ('assets/cream.png'),
    ),
  ];

  int currentImg = 0;

  Color black = const Color(0xff000000);
  Color cream = const Color(0xfffcecd0);
  Color blue = const Color(0xffb6d7e4);

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..repeat(reverse: true);
    hoverAnimation = Tween(begin: const Offset(0, 0), end: const Offset(0, 0.03))
        .animate(animationController);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff292929),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SlideTransition(
                position: hoverAnimation,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 900),
                  child: Image(
                    image: AssetImage(headphones[currentImg].img),
                    key: ValueKey<int>(currentImg),
                  ),
                ),
              ),
              const Text(
                "Canleen K45U",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "Bluetooth Headphone",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 28.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(headphones.length, (index) {
                  return Padding(
                    padding:const EdgeInsets.symmetric(horizontal: 12.0),
                    child: GestureDetector(
                      child: CircleAvatar(
                        radius: currentImg ==index? 16.0:12.0,
                        backgroundColor: headphones[index].color,
                        child:currentImg ==index? const CircleAvatar(
                          radius: 5.0,
                          backgroundColor: Colors.white,
                        ):const SizedBox(),
                      ),
                      onTap: (){
                        setState(() {
                          currentImg =index;
                        });
                      },
                    ),
                  );
                }),
              ),

              const Text(
                '779\$',
                style: TextStyle(
                    color: Colors.grey, fontSize: 28, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class HeadPhone {
  final Color color;
  final String img;

  HeadPhone({required this.color, required this.img});
}
