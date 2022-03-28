import 'package:flutter/material.dart';
import 'package:musixx/colorsInApp.dart' as AppColors;
// import 'package:musixx/assets/images'

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Column(children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10, bottom: 0),
                  child: const Text(
                    "Musixx",
                    style: TextStyle(
                      color: Color(0xFFe0f7fa),
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 5, top: 0),
                  child: const Text(
                    "Just Play It",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 12),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 3, top: 10),
                  child: Text(
                    "Your Favourite Artist",
                    style:
                        TextStyle(color: AppColors.lightSkyBLue, fontSize: 20),
                  ),
                ),
              ],
            ),

            // SizedBox(height: 20),
            Container(
              height: 150,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -240,
                    right: 0,
                    child: Container(
                      height: 300,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.155),
                        itemCount: 5,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              Container(
                                height: 100,
                                child: CircleAvatar(
                                  // borderRadius: BorderRadius.circular(50),
                                  // image: const DecorationImage(
                                  radius: 40,
                                  // borderRadius.circular(50),
                                  child: ClipRRect(
                                    child: Image.asset("img/atif.jpg"),
                                    // fit: BoxFit.fill()
                                    borderRadius: BorderRadius.circular(500),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Atif Aslam",
                                  style:
                                      TextStyle(color: AppColors.lightSkyBLue),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  child: Text(
                    "Recently Played",
                    style:
                        TextStyle(color: AppColors.lightSkyBLue, fontSize: 20),
                  ),
                ),
              ],
            ),

            // ~ 2nd scrollable
            Container(
              height: 200,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -170,
                    right: 0,
                    child: Container(
                      height: 200,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.3005),
                        itemCount: 5,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // borderRadius.
                                  image: const DecorationImage(
                                    image: AssetImage("Music_Images/EDM_4.jpg"),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "EDM",
                                  style:
                                      TextStyle(color: AppColors.lightSkyBLue),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                  child: Text(
                    "Made For You",
                    style:
                        TextStyle(color: AppColors.lightSkyBLue, fontSize: 20),
                  ),
                ),
              ],
            ),

            // ~ 3rd scrollable
            Container(
              height: 160,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -130,
                    right: 0,
                    child: Container(
                      height: 300,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.43),
                        itemCount: 5,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // borderRadius.
                                  image: const DecorationImage(
                                    image:
                                        AssetImage("Music_Images/EDM_2.jpeg"),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  "Classic",
                                  style:
                                      TextStyle(color: AppColors.lightSkyBLue),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),

/*            Container(
              height: 180,
              child: PageView.builder(
                controller: PageController(viewportFraction: 1),
                itemCount: 5,
                itemBuilder: (_, i) {
                  return Container(
                    height: 180,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: const DecorationImage(
                        image: AssetImage("img/atif.jpg"),
                      ),
                    ),
                  );
                },
              ),
            ),*/
          ]),

          bottomNavigationBar: BottomAppBar(
            // color: Colors.black,
            color: AppColors.background,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setBottomBarIndex(0);
                    },
                    icon: Icon(
                      Icons.home,
                      color: currentIndex == 0 ? Colors.green : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      setBottomBarIndex(1);
                    },
                    icon: Icon(
                      Icons.search,
                      color: currentIndex == 1 ? Colors.green : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      setBottomBarIndex(2);
                    },
                    icon: Icon(
                      Icons.book,
                      color: currentIndex == 2 ? Colors.green : Colors.grey,
                    )),
                IconButton(
                    onPressed: () {
                      setBottomBarIndex(3);
                    },
                    icon: Icon(
                      Icons.person,
                      color: currentIndex == 3 ? Colors.green : Colors.grey,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
