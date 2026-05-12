import 'package:flutter/material.dart';
import 'package:study_with_game/theme/theme.dart';
import 'package:study_with_game/subjects/pps/topic/topic.dart';

class Pps extends StatefulWidget {
  const Pps({super.key});

  @override
  State<Pps> createState() => _PpsState();
}

class _PpsState extends State<Pps> {
  final TextEditingController searchController =
  TextEditingController();

  final List<String> lessons = [

    "Introduction to PPS",
    "Writing First Code",
    "Comments",
    "Variables",
    "Constants",
    "Data Types",
    "Type Conversion",
    "Operators",
    "Input Output",
    "Conditional Statements",
    "Loops",
    "Nested Loops",
    "Functions",
    "Recursion",
    "Arrays",
    "Strings",
    "Pointers",
    "Structures",
    "File Handling"

  ];

  List<String> filteredLessons = [];

  @override
  void initState() {
    super.initState();

    filteredLessons = lessons;
  }

  void searchLesson(String value) {

    setState(() {

      filteredLessons = lessons.where((lesson) {

        return lesson
            .toLowerCase()
            .contains(value.toLowerCase());

      }).toList();

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).cardTheme.color,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Programming and\nProblem Solving",

          textAlign: TextAlign.center,

          style: TextStyle(
            fontFamily: "InriaSerif",
            fontWeight: FontWeight.bold,
            color: AppColors.button,
            fontSize: 20,
          ),
        ),
      ),
      
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                BorderRadius.circular(12),
                boxShadow: [BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 3),
                )],
              ),
              child: TextField(
                controller: searchController,
                onChanged: (value){
                  searchLesson(value);
                },
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(
                    fontFamily: "InriaSerif",
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.button,
                  )

                ),
              ),
            ),
            const SizedBox(height: 20),

            // lesson list

            ListView.builder(

              itemCount:
              filteredLessons.length,

              shrinkWrap: true,

              physics:
              const NeverScrollableScrollPhysics(),

              itemBuilder: (context, index) {

                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 5,
                  ),

                  child: GestureDetector(

                    onTap: () {

                      String selectedLesson =
                      filteredLessons[index];

                      if(selectedLesson ==
                          "Introduction to PPS"){

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (context) =>
                                Topic(

                                  appBarTitle:
                                  "Introduction to PPS",

                                  topics: [

                                    "What is Programming",

                                    "What is Problem Solving",

                                  ],
                                ),
                          ),
                        );
                      }

                      if(selectedLesson ==
                          "Writing First Code"){

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (context) =>
                                Topic(

                                  appBarTitle:
                                  "Writing First Code",

                                  topics: [

                                    "Hello World",

                                    "First Program",

                                    "Print Function",

                                  ],
                                ),
                          ),
                        );
                      }

                    },

                    child: Container(
                      width: double.infinity,

                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 16,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(10),

                        border: Border.all(
                          color: AppColors.border,
                          width: 1.5,
                        ),

                        boxShadow: [

                          BoxShadow(
                            color: AppColors.mainCard
                                .withOpacity(0.45),

                            blurRadius: 18,

                            spreadRadius: 1,
                          ),

                          const BoxShadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),

                      child: Center(
                        child: Text(
                          filteredLessons[index],

                          textAlign: TextAlign.center,

                          style: const TextStyle(
                            fontFamily: "InriaSerif",
                            fontSize: 18,
                            fontStyle: FontStyle.italic,
                            color: AppColors.button,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),

          ],
        ),
        ),
      ),
    );
  }
}