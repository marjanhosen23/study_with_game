import 'package:flutter/material.dart';
import 'package:study_with_game/theme/theme.dart';
import 'package:study_with_game/subjects/pps/pps.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key});

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  final TextEditingController searchController =
  TextEditingController();
  List<Map<String, dynamic>> filteredSubjects = [];

  @override
  void initState() {
    super.initState();

    filteredSubjects = subjects;
  }

  void searchSubject(String value){

    setState(() {

      filteredSubjects = subjects.where((subject){

        return subject["title"]
            .toLowerCase()
            .contains(value.toLowerCase());

      }).toList();

    });
  }

  final List<Map<String, dynamic>> subjects = [

    {
      "title":
      "Programming and\nProblem Solving",

      "image":
      "assets/subjects/problem-solving.png",
    },

    {
      "title": "Data Structure",

      "image":
      "assets/subjects/hierarchical-structure.png",
    },


  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).cardTheme.color,
        centerTitle: true,

        title: const Text(
          "Subjects",

          style: TextStyle(
            fontFamily: "InriaSerif",
            fontWeight: FontWeight.bold,
            color: AppColors.button,
          ),
        ),
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              // search
              Row(
                children: [

                  Expanded(
                    child: Container(
                      height: 50,

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                        BorderRadius.circular(12),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 6,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),

                      child: TextField(

                        controller: searchController,

                        onChanged: (value) {
                          searchSubject(value);
                        },

                        decoration: InputDecoration(
                          hintText: "Search",

                          hintStyle: const TextStyle(
                            fontFamily: "InriaSerif",
                          ),

                          prefixIcon: const Icon(
                            Icons.search,
                            color: AppColors.button,
                          ),

                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(width: 15),

                  Icon(
                    Icons.menu,
                    size: 38,
                    color: AppColors.mainCard,
                  ),

                ],
              ),

              const SizedBox(height: 25),

              // grid
              GridView.builder(

                shrinkWrap: true,

                physics:
                const NeverScrollableScrollPhysics(),

                itemCount: filteredSubjects.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 2,

                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,

                  childAspectRatio: 0.88,
                ),

                itemBuilder: (context, index) {

                  return GestureDetector(

                    onTap: () {

                      if(index == 0){

                        Navigator.push(

                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                            const Pps(),
                          ),
                        );

                      }

                    },

                    child: Container(

                      decoration: BoxDecoration(
                        color: AppColors.smallCard,

                        borderRadius:
                        BorderRadius.circular(20),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),

                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,

                        children: [

                          Image.asset(
                            filteredSubjects[index]["image"],
                            width: 70,
                            height: 70,
                          ),

                          const SizedBox(height: 12),

                          Text(
                            filteredSubjects[index]["title"],

                            textAlign: TextAlign.center,

                            style: const TextStyle(
                              fontFamily: "InriaSerif",
                              fontSize: 18,
                              fontWeight:
                              FontWeight.w500,
                              color: AppColors.button,
                            ),
                          ),

                        ],
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