import 'package:flutter/material.dart';
import 'package:study_with_game/theme/theme.dart';
import 'package:study_with_game/subjects/pps/Learning/Learning.dart';

class Topic extends StatefulWidget {

  final String appBarTitle;

  final List<String> topics;

  const Topic({
    super.key,
    required this.appBarTitle,
    required this.topics,
  });

  @override
  State<Topic> createState() =>
      _TopicState();
}

class _TopicState
    extends State<Topic> {

  final TextEditingController
  searchController =
  TextEditingController();

  List<String> filteredTopics = [];

  @override
  void initState() {
    super.initState();

    filteredTopics =
        widget.topics;
  }

  void searchTopic(String value){

    setState(() {

      filteredTopics =
          widget.topics.where((topic){

            return topic
                .toLowerCase()
                .contains(
              value.toLowerCase(),
            );

          }).toList();

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).cardTheme.color,

        centerTitle: true,

        title: Text(
          widget.appBarTitle,

          style: TextStyle(
            fontFamily: "InriaSerif",
            fontWeight:
            FontWeight.bold,
            color: AppColors.button,
          ),
        ),
      ),

      body: Padding(
        padding:
        const EdgeInsets.all(16),

        child: Column(
          children: [

            // search
            Container(
              height: 50,

              decoration: BoxDecoration(
                color: Colors.white,

                borderRadius:
                BorderRadius.circular(
                    12),

                boxShadow: [

                  BoxShadow(
                    color:
                    Colors.black12,

                    blurRadius: 6,

                    offset:
                    Offset(0, 3),
                  ),

                ],
              ),

              child: TextField(

                controller:
                searchController,

                onChanged: (value) {
                  searchTopic(value);
                },

                decoration:
                const InputDecoration(

                  hintText: "Search",

                  hintStyle: TextStyle(
                    fontFamily:
                    "InriaSerif",
                  ),

                  prefixIcon: Icon(
                    Icons.search,

                    color:
                    AppColors.button,
                  ),

                  border:
                  InputBorder.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // topic list
            Expanded(

              child: ListView.builder(

                itemCount: filteredTopics.length,

                itemBuilder:
                    (context, index) {

                  return Padding(
                    padding:
                    const EdgeInsets.only(
                      bottom: 12,
                    ),

                    child: GestureDetector(

                      onTap: () {

                        String selectedTopic =
                        filteredTopics[index];

                        Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (context) =>

                                Learning(

                                  title: selectedTopic,
                                ),
                          ),
                        );
                      },

                      child: Container(

                        width:
                        double.infinity,

                        padding:
                        const EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 16,
                        ),

                        decoration:
                        BoxDecoration(
                          color:
                          Colors.white,

                          borderRadius:
                          BorderRadius.circular(
                              10),

                          boxShadow: [

                            BoxShadow(
                              color:
                              Colors.black12,

                              blurRadius:
                              6,

                              offset:
                              Offset(
                                  0, 3),
                            ),

                          ],
                        ),

                        child: Center(

                          child: Text(

                            filteredTopics[index],

                            textAlign:
                            TextAlign
                                .center,

                            style:
                            const TextStyle(

                              fontFamily:
                              "InriaSerif",

                              fontStyle:
                              FontStyle
                                  .italic,

                              fontSize: 18,

                              color:
                              AppColors
                                  .button,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}