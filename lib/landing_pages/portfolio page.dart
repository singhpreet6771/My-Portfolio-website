import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/models/experiences.dart';
import 'package:my_portfolio/models/skills.dart';
import '../constants.dart';
import '../models/projects.dart';
import 'package:url_launcher/link.dart';

class MyPortfolioPage extends StatefulWidget {
  const MyPortfolioPage({Key? key}) : super(key: key);

  @override
  _MyPortfolioPageState createState() => _MyPortfolioPageState();
}

class _MyPortfolioPageState extends State<MyPortfolioPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 5,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  'assets/images/background.jpg',
                  fit: BoxFit.cover,
                ),
                Container(color: darkColor.withOpacity(0.56)),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WELCOME TO MY PORTFOLIO",
                        style: GoogleFonts.biryani(
                            fontStyle: FontStyle.normal,
                            fontSize: size.width * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                "MY SKILLS",
                textStyle: GoogleFonts.biryani(
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * 0.016,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600),
              ),
              TyperAnimatedText(
                "MY SKILLS",
                textStyle: GoogleFonts.biryani(
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * 0.016,
                    color: underlineColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: defaultPadding / 2,
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: my_skills.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 6,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(defaultPadding),
                  child: TweenAnimationBuilder(
                    tween: Tween<double>(
                        begin: 0, end: my_skills[index].percentage!),
                    duration: defaultDuration,
                    builder: (context, double value, child) => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Center(
                              child: SizedBox(
                                child: CircularProgressIndicator(
                                  value: value,
                                  color: underlineColor,
                                  backgroundColor: secondaryColor,
                                  strokeWidth: 6,
                                ),
                                height: size.height*0.11,
                                width: size.height*0.11,
                              ),
                            ),
                            Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Text(
                                    (value * 100)
                                            .toInt()
                                            .toString() +
                                        "%",
                                    style: GoogleFonts.biryani(
                                        fontStyle: FontStyle.normal,
                                        fontSize: size.width * 0.01,
                                        color: bgColor,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          my_skills[index].label!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.biryani(
                              fontStyle: FontStyle.normal,
                              fontSize: size.width * 0.01,
                              color: bgColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          SizedBox(
            height: defaultPadding,
          ),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                "MY PROJECTS",
                textStyle: GoogleFonts.biryani(
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * 0.016,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600),
              ),
              TyperAnimatedText(
                "MY PROJECTS",
                textStyle: GoogleFonts.biryani(
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * 0.016,
                    color: underlineColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: defaultPadding / 2,
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: demo_projects.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(demo_projects[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle2),
                      Text(demo_projects[index].description!,
                          style: TextStyle(height: 1.5, color: bodyTextColor)),
                      Link(
                          uri: Uri.parse(demo_projects[index].link!),
                          target: LinkTarget.blank,
                          builder: (context, followLink) {
                            return TextButton(
                              onPressed: followLink,
                              child: Text.rich(TextSpan(
                                  text: "Know More",
                                  style: TextStyle(color: underlineColor),
                                  children: [
                                    TextSpan(
                                      text: " >>",
                                      style: TextStyle(color: bodyTextColor),
                                    )
                                  ])),
                            );
                          }),
                    ],
                  ),
                );
              }),
          SizedBox(
            height: defaultPadding,
          ),
          AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TyperAnimatedText(
                "MY WORK EXPERIENCE",
                textStyle: GoogleFonts.biryani(
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * 0.016,
                    color: secondaryColor,
                    fontWeight: FontWeight.w600),
              ),
              TyperAnimatedText(
                "MY WORK EXPERIENCE",
                textStyle: GoogleFonts.biryani(
                    fontStyle: FontStyle.normal,
                    fontSize: size.width * 0.016,
                    color: underlineColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          SizedBox(
            height: defaultPadding / 2,
          ),
          GridView.builder(
              shrinkWrap: true,
              itemCount: demo_experience.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.3,
                  crossAxisSpacing: defaultPadding,
                  mainAxisSpacing: defaultPadding),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(defaultPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(demo_experience[index].title!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.subtitle2),
                      Text(demo_experience[index].description!,
                          style: TextStyle(height: 1.5, color: bodyTextColor)),
                      Link(
                          uri: Uri.parse(demo_experience[index].link!),
                          target: LinkTarget.blank,
                          builder: (context, followLink) {
                            return TextButton(
                              onPressed: followLink,
                              child: Text.rich(TextSpan(
                                  text: "Know More",
                                  style: TextStyle(color: underlineColor),
                                  children: [
                                    TextSpan(
                                      text: " >>",
                                      style: TextStyle(color: bodyTextColor),
                                    )
                                  ])),
                            );
                          }),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
