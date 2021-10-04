import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/landing_pages/portfolio%20page.dart';
import 'package:url_launcher/link.dart';
import '../constants.dart';
import 'about_page.dart';

class MyHomePage extends StatefulWidget {
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  List<Widget> widgets = [
    // 0
    AboutPage(),
    // 1
    MyPortfolioPage(),
  ];

  // navItemClicked shall refresh the UI i.e. build the UI again with new value of Index
  void navItemClicked(int i) async {
    setState(() {
      index = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(
                vertical: defaultPadding, horizontal: defaultPadding * 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "WELCOME!",
                  style: GoogleFonts.biryani(
                      fontStyle: FontStyle.normal,
                      fontSize: size.width * 0.012,
                      color: underlineColor,
                      fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    TextButton(
                      onPressed: () {
                        navItemClicked(0);
                      },
                      child: Text(
                        "About",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: index == 0 ? underlineColor : primaryColor,
                            fontSize: index != 0 ? 12.0 : 15.0),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          primary: Colors.white),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    TextButton(
                      onPressed: () {
                        navItemClicked(1);
                      },
                      child: Text(
                        "Portfolio",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: index == 1 ? underlineColor : primaryColor,
                            fontSize: index != 1 ? 12.0 : 15.0),
                      ),
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(horizontal: 15.0),
                          primary: Colors.white),
                    ),

                    SizedBox(
                      width: 20.0,
                    ),
                    Link(
                        uri: Uri.parse(resume),
                        target: LinkTarget.blank,
                        builder: (context, followLink) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: underlineColor,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: primaryColor,
                                      fontSize: 15.0),
                            ),
                            onPressed: followLink,
                              child: Row(
                              children: <Widget>[
                                Text("Resume"),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.download_sharp,
                                  color: Colors.black,
                                  size: 17.0,
                                )
                              ],
                            ),
                          );
                        })
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding * 2),
            constraints: BoxConstraints(
                maxHeight: size.height * 0.9, maxWidth: size.width),
            child: widgets.elementAt(index),
          ),
        ],
      ),
    );
  }
}
