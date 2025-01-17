import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_app/screens/about_us.dart';
import 'package:flutter_app/screens/add_feed.dart';
import 'package:flutter_app/screens/enter_user_number.dart';
import 'package:flutter_app/screens/feeds.dart';
import 'package:flutter_app/screens/jobs.dart';
import 'package:flutter_app/screens/profile.dart';
import 'package:flutter_app/screens/business.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class UserHomePage extends StatefulWidget {
  UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  final _advancedDrawerController = AdvancedDrawerController();
  int pageIndex = 0;

  String? userId;
  bool? isVolunteer = false;

  Future<void> _fetchUserId() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = (prefs.getString('userId') ?? null);
      isVolunteer = (prefs.getBool('isVolunteer') ?? null);
    });
    print(userId);
    print(isVolunteer);
  }

  @override
  void initState() {
    super.initState();
    _fetchUserId();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Color(0xff243b55),
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: Color(0xff243b55),
        systemNavigationBarIconBrightness: Brightness.light));

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return AdvancedDrawer(
      backdropColor: const Color.fromARGB(255, 43, 70, 100),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 50,
              ),

              CircleAvatar(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    "assets/images/logo.png",
                    color: const Color.fromARGB(255, 43, 70, 100),
                  ),
                ),
                backgroundColor: Colors.white,
                radius: 70,
              ),

              const SizedBox(
                height: 25,
              ),

              Text(
                "IMPACT ME",
                style: GoogleFonts.raleway(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 7),
              ),

              const SizedBox(
                height: 25,
              ),

              // HOME Tile
              ListTile(
                onTap: () {
                  setState(() {
                    pageIndex = 0;
                  });
                },
                tileColor: pageIndex == 0 ? Colors.white : Colors.transparent,
                leading: Icon(
                  Icons.home,
                  color: pageIndex == 0
                      ? const Color.fromARGB(255, 43, 70, 100)
                      : Colors.white,
                ),
                title: Text(
                  'Home',
                  style: GoogleFonts.raleway(
                      color: pageIndex == 0
                          ? const Color.fromARGB(255, 43, 70, 100)
                          : Colors.white),
                ),
              ),

              // FEEDS Tile
              ListTile(
                onTap: () {
                  setState(() {
                    pageIndex = 1;
                  });
                },
                tileColor: pageIndex == 1 ? Colors.white : Colors.transparent,
                leading: Icon(
                  Icons.ads_click_rounded,
                  color: pageIndex == 1
                      ? const Color.fromARGB(255, 43, 70, 100)
                      : Colors.white,
                ),
                title: Text(
                  'Feeds',
                  style: GoogleFonts.raleway(
                      color: pageIndex == 1
                          ? const Color.fromARGB(255, 43, 70, 100)
                          : Colors.white),
                ),
              ),

              // JOBS Title
              ListTile(
                onTap: () {
                  setState(() {
                    pageIndex = 2;
                  });
                },
                tileColor: pageIndex == 2 ? Colors.white : Colors.transparent,
                leading: Icon(
                  Icons.public_sharp,
                  color: pageIndex == 2
                      ? const Color.fromARGB(255, 43, 70, 100)
                      : Colors.white,
                ),
                title: Text(
                  'Jobs',
                  style: GoogleFonts.raleway(
                      color: pageIndex == 2
                          ? const Color.fromARGB(255, 43, 70, 100)
                          : Colors.white),
                ),
              ),

              // BUSINESS PROMOTION Title
              ListTile(
                onTap: () {
                  setState(() {
                    pageIndex = 3;
                  });
                },
                tileColor: pageIndex == 3 ? Colors.white : Colors.transparent,
                leading: Icon(
                  Icons.campaign_rounded,
                  color: pageIndex == 3
                      ? const Color.fromARGB(255, 43, 70, 100)
                      : Colors.white,
                ),
                title: Text(
                  'Promotions',
                  style: GoogleFonts.raleway(
                      color: pageIndex == 3
                          ? const Color.fromARGB(255, 43, 70, 100)
                          : Colors.white),
                ),
              ),

              // SETTINGS Tile
              ListTile(
                onTap: () {
                  setState(() {
                    pageIndex = 4;
                  });
                },
                tileColor: pageIndex == 4 ? Colors.white : Colors.transparent,
                leading: Icon(
                  Icons.account_circle_rounded,
                  color: pageIndex == 4
                      ? const Color.fromARGB(255, 43, 70, 100)
                      : Colors.white,
                ),
                title: Text(
                  'Profile',
                  style: GoogleFonts.raleway(
                      color: pageIndex == 4
                          ? const Color.fromARGB(255, 43, 70, 100)
                          : Colors.white),
                ),
              ),

              // ABOUT US Tile
              ListTile(
                onTap: () {
                  setState(() {
                    pageIndex = 5;
                  });
                },
                tileColor: pageIndex == 5 ? Colors.white : Colors.transparent,
                leading: Icon(
                  Icons.info_rounded,
                  color: pageIndex == 5
                      ? const Color.fromARGB(255, 43, 70, 100)
                      : Colors.white,
                ),
                title: Text(
                  'About Us',
                  style: GoogleFonts.raleway(
                      color: pageIndex == 5
                          ? const Color.fromARGB(255, 43, 70, 100)
                          : Colors.white),
                ),
              ),

              SizedBox(
                height: height * 0.05,
              ),

              ElevatedButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.remove("userId");
                    prefs.remove("isVolunteer");
                    Get.offAll(() => EnterUserNumber());
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: Text(
                    "LOG OUT",
                    style: GoogleFonts.raleway(color: const Color(0xff243b55)),
                  )),
              const Spacer(),
            ],
          ),
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.white,
          floatingActionButton: isVolunteer! && pageIndex == 1
              ? FloatingActionButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AddFeed())),
                  elevation: 10,
                  child: Icon(
                    Icons.add_a_photo_rounded,
                    color: Colors.white,
                    semanticLabel: "Add a new feed",
                  ),
                  backgroundColor: Color(0xff243b55),
                )
              : Container(),
          appBar: AppBar(
            backgroundColor: const Color(0xff243b55),
            title: Row(
              children: pageIndex == 0
                  ? <Widget>[
                      const Icon(Icons.home),
                      Text(
                        '  HOME',
                        style: GoogleFonts.raleway(),
                      ),
                    ]
                  : pageIndex == 1
                      ? <Widget>[
                          const Icon(Icons.ads_click_rounded),
                          Text(
                            '  FEEDS',
                            style: GoogleFonts.raleway(),
                          ),
                        ]
                      : pageIndex == 2
                          ? <Widget>[
                              const Icon(Icons.public_sharp),
                              Text(
                                '  JOB DESCRIPTION',
                                style: GoogleFonts.raleway(),
                              ),
                            ]
                          : pageIndex == 3
                              ? <Widget>[
                                  const Icon(Icons.campaign_rounded),
                                  Text(
                                    '  BUSINESS PROMOTION',
                                    style: GoogleFonts.raleway(),
                                  ),
                                ]
                              : pageIndex == 4
                                  ? <Widget>[
                                      const Icon(Icons.account_circle_rounded),
                                      Text(
                                        '  PROFILE',
                                        style: GoogleFonts.raleway(),
                                      ),
                                    ]
                                  : <Widget>[
                                      const Icon(Icons.info_rounded),
                                      Text(
                                        '  ABOUT US',
                                        style: GoogleFonts.raleway(),
                                      ),
                                    ],
            ),
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          body: pageIndex == 0
              ? Home()
              : pageIndex == 1
                  ? const Feeds()
                  : pageIndex == 2
                      ? const Jobs()
                      : pageIndex == 3
                          ? const Business()
                          : pageIndex == 4
                              ? const Profile()
                              : const AboutUs()),
    );
  }

  void _handleMenuButtonPressed() {
    _advancedDrawerController.showDrawer();
  }
}
