import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 2;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: buildAppBar(),
        body: Stack(
          children: <Widget>[
            Container(
              height: 600,
              width: double.infinity,
              child: CustomPaint(
                painter: _HeaderPainter(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: <Widget>[
                Expanded(child: firstT()),
                SizedBox(
                  height: 150,
                  child: Expanded(
                      flex: 4,
                      child: PageView(scrollDirection: Axis.horizontal, children: <Widget>[
                        CardFav(
                            "assets/icons/washing-machine.png", "Washer Machine", "Ready Wash Stainless", "4.6", 4.6),
                        CardFav("assets/icons/dryer.png", "Dryer Machine", "Ready Wash Stainless", "3.4", 3.4),
                        CardFav(
                            "assets/icons/microwave-oven.png", "Microwave Machine", "Ready Wash Stainless", "4.0", 4.0),
                      ])),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(child: secondT()),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  flex: 10,
                  child: ListView(scrollDirection: Axis.vertical, children: <Widget>[
                    listCard("assets/icons/microwave-oven.png", "Microwave Oven", "4.3", 4.3),
                    listCard("assets/icons/whisk.png", "Whisk", "3.3", 3.3),
                    listCard("assets/icons/speakers.png", "Speakers", "4.6", 4.6),
                    listCard("assets/icons/air-conditioner.png", "Air Conditioner", "5.0", 5.0),
                    listCard("assets/icons/television.png", "Television", "5.0", 5.0),
                    SizedBox(
                      height: 85,
                    )
                  ]),
                ),
                // Expanded(child: Text("Test"), flex: 10),
              ]),
            ),
            bottonBar(context),
          ],
        ),
      ),
    );
  }

  Align bottonBar(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.white),
            child: BottomNavigationBar(
              onTap: (i) {
                setState(() {
                  index = i;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: index,
              items: [
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.home),
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.black12,
                      size: 35,
                    ),
                    title: Text('')),
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.search),
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.black12,
                      size: 35,
                    ),
                    title: Text('')),
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.favorite),
                    icon: Icon(
                      Icons.favorite_outline,
                      color: Colors.black12,
                      size: 35,
                    ),
                    title: Text('')),
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.message),
                    icon: Icon(
                      Icons.message_outlined,
                      color: Colors.black12,
                      size: 35,
                    ),
                    title: Text('')),
                BottomNavigationBarItem(
                    activeIcon: Hex(Icons.person),
                    icon: Icon(
                      Icons.person_outline,
                      color: Colors.black12,
                      size: 35,
                    ),
                    title: Text('')),
              ],
            )));
  }

  SizedBox listCard(String img, String title, String rate, double numRate) {
    return SizedBox(
      height: 100,
      child: Card(
        elevation: 1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              SizedBox(
                width: 100,
                child: Image.asset(
                  img,
                  height: 55,
                ),
              ),
              Expanded(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Text(rate),
                          SizedBox(
                            width: 5,
                          ),
                          RatingBar.builder(
                            itemSize: 14,
                            initialRating: numRate,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          )
                        ],
                      )
                    ],
                  )),
              IconButton(
                icon: const Icon(
                  Icons.more_vert_outlined,
                  size: 25,
                ),
                color: Colors.grey,
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }

  Card CardFav(String img, String title, String des, String rate, double numRate) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    img,
                    width: 40,
                    height: 40,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    des,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 10),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 45,
                    height: 45,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.grey.shade300,
                              offset: new Offset(0.0, 2.0),
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Center(child: Icon(Icons.local_fire_department)),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        rate,
                        textAlign: TextAlign.end,
                      )),
                      SizedBox(
                        width: 3,
                      ),
                      RatingBar.builder(
                        itemSize: 10,
                        initialRating: numRate,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding Hex(IconData ic) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: ClipPath(
          child: Container(
            color: Color.fromRGBO(71, 92, 218, 1),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(ic),
            ),
          ),
          clipper: Hexagono(),
        ),
      ),
    );
  }

  Row firstT() {
    return Row(
      children: [
        Expanded(
            child: Text(
          "FAVORITES",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        )),
        SizedBox(
          width: 70,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                color: Color.fromRGBO(71, 92, 218, 1),
                borderRadius: BorderRadius.all(Radius.circular(50)),
              ),
              child: Center(
                child: Text(
                  "VIEW ALL",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Row secondT() {
    return Row(
      children: [
        Expanded(
            child: Text(
          "ALL",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        )),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey.shade200,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed: () {},
        color: Colors.black,
      ),
      title: Center(
        child: Text(
          "Kudos",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.shopping_bag_outlined),
          color: Colors.black,
          onPressed: () {},
        ),
      ],
    );
  }
}

class Hexagono extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width * 0.5, 0);
    path.lineTo(size.width, size.height * 0.25);
    path.lineTo(size.width, size.height * 0.75);
    path.lineTo(size.width * 0.5, size.height);
    path.lineTo(0, size.height * 0.75);
    path.lineTo(0, size.height * 0.25);
    path.lineTo(size.width * 0.5, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.grey.shade200;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 5;
    final path = Path();
    path.moveTo(0, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.33);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_HeaderPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(_HeaderPainter oldDelegate) => false;
}
