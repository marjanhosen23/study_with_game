import 'package:flutter/material.dart';
import 'package:study_with_game/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeLinks extends StatefulWidget {

  final String title;

  final List<Map<String, String>>
  videos;

  const YoutubeLinks({
    super.key,

    required this.title,

    required this.videos,
  });

  @override
  State<YoutubeLinks> createState() =>
      _YoutubeLinksState();
}

class _YoutubeLinksState
    extends State<YoutubeLinks> {

  Future<void> openYoutube(
      String url) async {

    final Uri uri =
    Uri.parse(url);

    if(!await launchUrl(uri)) {

      throw Exception(
        "Could not launch",
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
        AppColors.smallCard,

        centerTitle: true,

        title: Text(

          widget.title,

          style: const TextStyle(

            fontFamily:
            "InriaSerif",

            fontWeight:
            FontWeight.bold,

            color:
            AppColors.button,
          ),
        ),
      ),

      body: ListView.builder(

        padding:
        const EdgeInsets.all(16),

        itemCount:
        widget.videos.length,

        itemBuilder:
            (context, index) {

          return Padding(

            padding:
            const EdgeInsets.only(
                bottom: 14),

            child: GestureDetector(

              onTap: () {

                openYoutube(

                  widget.videos[index]
                  ["link"]!,
                );
              },

              child: Container(

                padding:
                const EdgeInsets.all(
                    18),

                decoration:
                BoxDecoration(

                  color:
                  AppColors.smallCard,

                  borderRadius:
                  BorderRadius.circular(
                      18),

                  boxShadow: [

                    BoxShadow(

                      color:
                      Colors.black12,

                      blurRadius: 6,

                      offset:
                      Offset(0, 4),
                    ),

                  ],
                ),

                child: Row(

                  children: [

                    const Icon(

                      Icons.play_circle_fill,

                      size: 38,

                      color: Colors.red,
                    ),

                    const SizedBox(
                        width: 14),

                    Expanded(

                      child: Text(

                        widget.videos[index]
                        ["title"]!,

                        style:
                        const TextStyle(

                          fontFamily:
                          "InriaSerif",

                          fontSize: 18,

                          fontWeight:
                          FontWeight.bold,

                          color:
                          AppColors
                              .button,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          );
        },
      ),

      bottomNavigationBar:
      const SizedBox(
        height: 30,
      ),
    );
  }
}