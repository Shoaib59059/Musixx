import 'package:flutter/material.dart';
import 'package:musixx/colorsInApp.dart' as AppColors;
import 'dart:convert';

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

  List Images_Artist = [];
  late List Name_Artist;
  List Images_Recently_Played = [];
  late List Name_Recently_Played;
  List Images_Made_For_You = [];
  late List Name_Made_For_You;

  // Artist
  ReadData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/Artist.json")
        .then((s) {
      setState(() {
        Name_Artist = json.decode(s);
      });
    });
    await DefaultAssetBundle.of(context)
        .loadString("json/Artist.json")
        .then((t) {
      setState(() {
        Images_Artist = json.decode(t);
      });
    });

    // Recently Played
    await DefaultAssetBundle.of(context)
        .loadString("json/Recently_Played.json")
        .then((s) {
      setState(() {
        Images_Recently_Played = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/Recently_Played.json")
        .then((s) {
      setState(() {
        Name_Recently_Played = json.decode(s);
      });
    });

    // Made For You
    await DefaultAssetBundle.of(context)
        .loadString("json/Made_For_You.json")
        .then((s) {
      setState(() {
        Images_Made_For_You = json.decode(s);
      });
    });

    await DefaultAssetBundle.of(context)
        .loadString("json/Made_For_You.json")
        .then((s) {
      setState(() {
        Name_Made_For_You = json.decode(s);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    ReadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background9,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.background9,
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
                  child: const Text(
                    "Your Favourite Artist",
                    style:
                        // TextStyle(color: AppColors.lightSkyBLue, fontSize: 20),
                        // TextStyle(color: Colors.redAccent[100], fontSize: 20),
                        TextStyle(color: Colors.greenAccent, fontSize: 20),
                  ),
                ),
              ],
            ),

            // ~Circular Avatar Artist
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
                        controller: PageController(viewportFraction: 0.1455),
                        // itemCount: 5,
                        itemCount:
                            Images_Artist == null ? 0 : Images_Artist.length,
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
                                    child:
                                        Image.asset(Images_Artist[i]["image"]),
                                    // image: AssetImage(Images_Recently_Played[i]["image"]),
                                    // fit: BoxFit.fill()
                                    borderRadius: BorderRadius.circular(500),
                                  ),
                                ),
                              ),
                              Container(
                                  child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  // "Atif Aslam",
                                  Name_Artist[i]["name"],
                                  style:
                                      TextStyle(color: AppColors.lightSkyBLue),
                                ),
                              )),
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
                  margin: EdgeInsets.only(left: 10, bottom: 10, top: 0),
                  child: const Text(
                    "Recently Played",
                    style:
                        // TextStyle(color: AppColors.lightSkyBLue, fontSize: 20),
                        TextStyle(color: Colors.greenAccent, fontSize: 20),
                  ),
                ),
              ],
            ),

            // ~ 2nd scrollable - Recently Played
            Container(
              height: 190,
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
                        // itemCount: 5,
                        itemCount: Images_Recently_Played == null
                            ? 0
                            : Images_Recently_Played.length,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // borderRadius.
                                  image: DecorationImage(
                                    // image: AssetImage("Music_Images/EDM_4.jpg"),
                                    image: AssetImage(
                                        Images_Recently_Played[i]["image"]),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  // "EDM",
                                  Name_Recently_Played[i]["name"],
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
                  margin: EdgeInsets.only(left: 10, bottom: 19, top: 0),
                  child: const Text(
                    "Made For You",
                    style:
                        // TextStyle(color: AppColors.lightSkyBLue, fontSize: 20),
                        TextStyle(color: Colors.greenAccent, fontSize: 20),
                  ),
                ),
              ],
            ),

            // ~ 3rd scrollable - Made For You
            Container(
              height: 190,
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: -170,
                    right: 0,
                    child: Container(
                      height: 300,
                      child: PageView.builder(
                        controller: PageController(viewportFraction: 0.3005),
                        // itemCount: 5,
                        itemCount: Images_Made_For_You == null
                            ? 0
                            : Images_Made_For_You.length,
                        itemBuilder: (_, i) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                height: 150,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  // borderRadius.
                                  image: DecorationImage(
                                    image: AssetImage(
                                        Images_Made_For_You[i]["image"]),
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  // "Classic",
                                  Name_Made_For_You[i]["name"],
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
          ]),
          bottomNavigationBar: BottomAppBar(
            // color: Colors.black,
            // color: AppColors.background,
            color: AppColors.bottomAppBar3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () {
                      setBottomBarIndex(0);
                    },
                    icon: Icon(
                      Icons.home,
                      color: currentIndex == 0 ? Colors.green : Colors.blueGrey,
                    )),
                IconButton(
                    onPressed: () {
                      setBottomBarIndex(1);
                    },
                    icon: Icon(
                      Icons.search,
                      color: currentIndex == 1 ? Colors.greenAccent : Colors.blueGrey,
                    )),
                IconButton(
                    onPressed: () {
                      setBottomBarIndex(2);
                    },
                    icon: Icon(
                      Icons.book,
                      color: currentIndex == 2 ? Colors.green : Colors.blueGrey,
                    )),
                IconButton(
                    onPressed: () {
                      setBottomBarIndex(3);
                    },
                    icon: Icon(
                      Icons.person,
                      color: currentIndex == 3 ? Colors.green : Colors.blueGrey,
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
