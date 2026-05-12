import 'package:flutter/material.dart';
import 'package:study_with_game/subjects/pps/Learning/note/note.dart';
import 'package:study_with_game/subjects/pps/Learning/youtube_links/youtube_links.dart';
import 'package:study_with_game/theme/theme.dart';
import "package:study_with_game/subjects/pps/Learning/game/what_is_programming_game.dart";


class Learning extends StatefulWidget {
  final String title;

  const Learning({super.key, required this.title});

  @override
  State<Learning> createState() => _LearningState();
}

class _LearningState extends State<Learning> {
  final List<Map<String, String>> items = [
    {"title": "Youtube Links", "image": "assets/learning/youtube.png"},

    {"title": "Notes", "image": "assets/learning/note.png"},

    {"title": "Learn with Game", "image": "assets/learning/game-control.png"},

    {"title": "Practice Problem", "image": "assets/learning/pencil.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardTheme.color,

        centerTitle: true,

        title: Text(
          widget.title,

          textAlign: TextAlign.center,

          style: const TextStyle(
            fontFamily: "InriaSerif",

            fontWeight: FontWeight.bold,

            color: AppColors.button,
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: GridView.builder(
          itemCount: items.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,

            crossAxisSpacing: 25,

            mainAxisSpacing: 25,

            childAspectRatio: 0.95,
          ),

          itemBuilder: (context, index) {
            return GestureDetector(
                onTap: () {

                  String selectedItem =
                  items[index]["title"]!;

                  // NOTES
                  if (selectedItem == "Notes") {

                    // WHAT IS PROGRAMMING
                    if (widget.title ==
                        "What is Programming") {

                      Navigator.push(
                        context,

                        MaterialPageRoute(
                          builder: (context) => Note(

                            titleEn:
                            "What is Programming",

                            titleBn:
                            "প্রোগ্রামিং কি",

                            headingEn:
                            "Programming",

                            headingBn:
                            "প্রোগ্রামিং",

                            descriptionTopEn:
                            '''Programming is the process of giving instructions to a computer to perform specific tasks.

These instructions are written using programming languages such as C, C++, Java, or Python.
''',

                            descriptionTopBn:
                            '''প্রোগ্রামিং হলো কম্পিউটারকে নির্দিষ্ট কাজ করার জন্য নির্দেশ দেওয়ার প্রক্রিয়া।

এই নির্দেশগুলো C, C++, Java বা Python এর মতো প্রোগ্রামিং ভাষা ব্যবহার করে লেখা হয়।
''',

                            firstImage:
                            "assets/programming_page/lang.png",

                            descriptionBottomEn:
                            '''Programming helps people create software, games, mobile apps, websites, and many other digital systems.

It also helps solve problems by using logic and step-by-step instructions.
''',

                            descriptionBottomBn:
                            '''প্রোগ্রামিং ব্যবহার করে সফটওয়্যার, গেম, মোবাইল অ্যাপ, ওয়েবসাইটসহ বিভিন্ন ডিজিটাল সিস্টেম তৈরি করা যায়।

এটি সমস্যা সমাধানেও সাহায্য করে।
''',

                            secondHeadingEn:
                            "How does it work",

                            secondHeadingBn:
                            "এটি কিভাবে কাজ করে",

                            secondDescriptionTopEn:
                            '''Programming works by giving instructions to a computer step by step.

A programmer writes code using a programming language, and the computer reads and follows those instructions to perform tasks.
''',

                            secondDescriptionTopBn:
                            '''প্রোগ্রামিং ধাপে ধাপে কম্পিউটারকে নির্দেশ দিয়ে কাজ করে।

একজন প্রোগ্রামার প্রোগ্রামিং ভাষা ব্যবহার করে কোড লেখেন, এবং কম্পিউটার সেই নির্দেশগুলো অনুসরণ করে কাজ সম্পন্ন করে।
''',

                            secondImage:
                            "assets/programming_page/pnote.png",

                            secondDescriptionBottomEn:
                            '''For example, if a programmer writes code to print "Hello", the computer reads the instruction and shows 'Hello' on the screen.
''',

                            secondDescriptionBottomBn:
                            '''উদাহরণস্বরূপ, যদি কেউ "Hello" print করার কোড লেখে, তাহলে কম্পিউটার স্ক্রিনে Hello দেখাবে।
''',
                          ),
                        ),
                      );
                    }
                  }

                  // YOUTUBE LINKS
                  else if (selectedItem ==
                      "Youtube Links") {

                    // WHAT IS PROGRAMMING
                    if (widget.title ==
                        "What is Programming") {

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) =>

                              YoutubeLinks(

                                title:
                                "What is Programming",

                                videos: [

                                  {

                                    "title":
                                    "Programming Tutorial",

                                    "link":
                                    "https://youtu.be/RzjWJHwFL-E?si=KucxkCl4lNSNDDYJ",
                                  },



                                ],
                              ),
                        ),
                      );
                    }
                  }

                  else if(selectedItem ==
                      "Learn with Game"){

                    // WHAT IS PROGRAMMING
                    if(widget.title ==
                        "What is Programming"){

                      Navigator.push(

                        context,

                        MaterialPageRoute(

                          builder: (context) =>

                          const WhatIsProgrammingGamePage(),
                        ),
                      );
                    }
                  }

              },

              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.smallCard,

                  borderRadius: BorderRadius.circular(20),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,

                      blurRadius: 8,

                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: [
                    Image.asset(items[index]["image"]!, width: 55, height: 55),

                    const SizedBox(height: 12),

                    Text(
                      items[index]["title"]!,

                      textAlign: TextAlign.center,

                      style: const TextStyle(
                        fontFamily: "InriaSerif",

                        fontSize: 18,

                        color: AppColors.button,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
