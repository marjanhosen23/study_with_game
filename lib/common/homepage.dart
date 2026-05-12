import 'package:flutter/material.dart';
import 'package:study_with_game/theme/theme.dart';
import 'package:study_with_game/common/subjects.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() =>
      _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<Map<String, dynamic>> items = [

    {
      "title": "Subjects",
      "image": "assets/homepage/books.png",
    },

    {
      "title": "Notes",
      "image": "assets/homepage/note.png",
    },

    {
      "title": "Test Yourself",
      "image": "assets/homepage/exam-time.png",
    },

    {
      "title": "Progress",
      "image": "assets/homepage/rising.png",
    },

    {
      "title": "1 vs 1 Arena",
      "image": "assets/homepage/martial-arts.png",
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).cardTheme?.color,
        elevation: 0,

        title: const Text(
          "Home",

          style: TextStyle(
            fontFamily: "InriaSerif",
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),

        centerTitle: true,
      ),

      body: Column(
        children: [

          const SizedBox(height: 30),

          // grid
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              child: GridView.builder(

                itemCount: items.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(

                  crossAxisCount: 2,

                  crossAxisSpacing: 20,
                  mainAxisSpacing: 30,

                  childAspectRatio: 0.95,
                ),

                itemBuilder: (context, index) {

                  return GestureDetector(

                    onTap: () {

                      if(index == 0){

                        Navigator.push(
                          context,

                          MaterialPageRoute(
                            builder: (context) =>
                            const Subjects(),
                          ),
                        );

                      }

                    },

                    child: Container(

                      decoration: BoxDecoration(
                        color: Theme.of(context).cardTheme.color,

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
                            items[index]["image"],
                            width: 65,
                            height: 65,
                          ),

                          const SizedBox(height: 12),

                          Text(
                            items[index]["title"],

                            textAlign: TextAlign.center,

                            style:TextStyle(
                              fontFamily: "InriaSerif",
                              fontSize: 18,
                              fontWeight:
                              FontWeight.bold,
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
          ),

        ],
      ),
    );
  }
}