import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/link.dart';
import '../constants.dart';
import 'package:flutter/services.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "GURPREET SINGH",
                        style: GoogleFonts.biryani(
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * 0.035,
                            color: primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText(
                            "SOFTWARE DEVELOPER",
                            textStyle: GoogleFonts.biryani(
                                fontSize: size.width * 0.015,
                                color: bodyTextColor),
                          ),
                          TyperAnimatedText(
                            "STUDENT",
                            textStyle: GoogleFonts.biryani(
                                fontSize: size.width * 0.015,
                                color: bodyTextColor),
                          ),
                          TyperAnimatedText(
                            "ENTHUSIAST",
                            textStyle: GoogleFonts.biryani(
                                fontSize: size.width * 0.015,
                                color: bodyTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: defaultPadding),
                    child: Text(
                      "Hi, I am a Student, currently persuing my Graduation from Punjab. Apart from that am also a Software Developer. I have developed my projects that are mentioned in the portfolio section as well as in my resume. I have also done an Internship with a pure based company where I was assigned a job to create an flutter application from scratch. You can see my work in the links mentioned below.",
                      style: GoogleFonts.biryani(
                          fontSize: size.width * 0.01, color: secondaryColor),
                    ),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "SEE MY WORK HERE",
                        style: GoogleFonts.biryani(
                            fontSize: size.width * 0.01, color: underlineColor),
                      ),
                      SizedBox(
                        height: (defaultPadding / 2) + 5,
                      ),
                      Container(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Link(
                                uri: Uri.parse(github),
                                target: LinkTarget.blank,
                                builder: (context, followLink) {
                                  return FlatButton(
                                    hoverColor: Colors.white,
                                    splashColor: secondaryColor,
                                    onPressed: followLink,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/github.png'),
                                    ),
                                  );
                                }),
                            Link(
                                uri: Uri.parse(linkedin),
                                target: LinkTarget.blank,
                                builder: (context, followLink) {
                                  return FlatButton(
                                    hoverColor: Colors.white,
                                    splashColor: secondaryColor,
                                    onPressed: followLink,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/linkedin.png'),
                                    ),
                                  );
                                }),
                            Link(
                                uri: Uri.parse(twitter),
                                target: LinkTarget.blank,
                                builder: (context, followLink) {
                                  return FlatButton(
                                    hoverColor: Colors.white,
                                    splashColor: secondaryColor,
                                    onPressed: followLink,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/twitter.png'),
                                    ),
                                  );
                                }),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        "CONTACT ME",
                        style: GoogleFonts.biryani(
                            fontSize: size.width * 0.01, color: underlineColor),
                      ),
                      SizedBox(
                        height: (defaultPadding / 2) + 5,
                      ),
                      Container(
                        height: 40.0,
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            Link(
                                uri: Uri.parse(instagram),
                                target: LinkTarget.blank,
                                builder: (context, followLink) {
                                  return FlatButton(
                                    hoverColor: Colors.white,
                                    splashColor: secondaryColor,
                                    onPressed: followLink,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/instagram.png'),
                                    ),
                                  );
                                }),
                        FlatButton(
                          hoverColor: Colors.white,
                          splashColor: secondaryColor,
                          onPressed: () {
                            Clipboard.setData(
                                new ClipboardData(text: gmail))
                                .then((_) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(16),
                                      ),
                                      elevation: 0,
                                      backgroundColor:
                                      Colors.transparent,
                                      child: dialogContent(
                                          context, gmail),
                                    );
                                  });
                            });
                          },
                          child: Image(
                            image:
                            AssetImage('assets/images/gmail.png'),
                          ),
                        ),
                            FlatButton(
                              hoverColor: Colors.white,
                              splashColor: secondaryColor,
                              onPressed: () {
                                Clipboard.setData(
                                        new ClipboardData(text: whatsapp))
                                    .then((_) {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) {
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          elevation: 0,
                                          backgroundColor: Colors.transparent,
                                          child:
                                              dialogContent(context, whatsapp),
                                        );
                                      });
                                });
                              },
                              child: Image(
                                image: AssetImage('assets/images/whatsapp.png'),
                              ),
                            ),
                            Link(
                                uri: Uri.parse(linkedin),
                                target: LinkTarget.blank,
                                builder: (context, followLink) {
                                  return FlatButton(
                                    hoverColor: Colors.white,
                                    splashColor: secondaryColor,
                                    onPressed: followLink,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/linkedin.png'),
                                    ),
                                  );
                                }),
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(45.0),
              child:
                  Center(child: Lottie.asset('assets/lottie/programmer.json')),
            ),
          ),
        ),
      ],
    );
  }

  dialogContent(BuildContext context, String what) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 120, bottom: 16, left: 16, right: 16),
          margin: EdgeInsets.only(top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(17),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                )
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "$what address copied to clipboard",
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(
                height: 24.0,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("ok"),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
