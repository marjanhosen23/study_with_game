import 'package:flutter/material.dart';
import 'package:study_with_game/theme/theme.dart';

class Note extends StatefulWidget {

  final String? firstImage;
  final String? secondImage;

  final String titleEn;
  final String titleBn;

  final String headingEn;
  final String headingBn;

  final String descriptionTopEn;
  final String descriptionTopBn;

  final String descriptionBottomEn;
  final String descriptionBottomBn;

  final String secondHeadingEn;
  final String secondHeadingBn;

  final String secondDescriptionTopEn;
  final String secondDescriptionTopBn;

  final String secondDescriptionBottomEn;
  final String secondDescriptionBottomBn;

  const Note({
    super.key,

    this.firstImage,
    this.secondImage,

    required this.titleEn,
    required this.titleBn,

    required this.headingEn,
    required this.headingBn,

    required this.descriptionTopEn,
    required this.descriptionTopBn,

    required this.descriptionBottomEn,
    required this.descriptionBottomBn,

    required this.secondHeadingEn,
    required this.secondHeadingBn,

    required this.secondDescriptionTopEn,
    required this.secondDescriptionTopBn,

    required this.secondDescriptionBottomEn,
    required this.secondDescriptionBottomBn,
  });

  @override
  State<Note> createState() =>
      _NoteState();
}

class _NoteState
    extends State<Note> {

  bool isBangla = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        backgroundColor:
        AppColors.smallCard,

        centerTitle: true,

        title: Text(

          isBangla
              ? widget.titleBn
              : widget.titleEn,

          style: const TextStyle(

            fontFamily:
            "InriaSerif",

            fontWeight:
            FontWeight.bold,

            color:
            AppColors.button,
          ),
        ),

        actions: [

          IconButton(

            onPressed: () {

              setState(() {

                isBangla =
                !isBangla;

              });
            },

            icon: const Icon(

              Icons.language,

              color:
              AppColors.button,
            ),
          ),

        ],
      ),

      body: SingleChildScrollView(

        padding:
        const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // first heading
            Text(

              isBangla
                  ? widget.headingBn
                  : widget.headingEn,

              style: const TextStyle(

                fontFamily:
                "InriaSerif",

                fontSize: 34,

                fontWeight:
                FontWeight.bold,

                color:
                AppColors.button,
              ),
            ),

            const SizedBox(
                height: 10),

            // first description top
            Text(

              isBangla
                  ? widget.descriptionTopBn
                  : widget.descriptionTopEn,

              textAlign:
              TextAlign.left,

              style: const TextStyle(

                fontFamily:
                "InriaSerif",

                fontSize: 20,

                height: 1.6,

                color:
                Colors.black87,
              ),
            ),

            // first image
            widget.firstImage != null

                ? Column(

              children: [

                const SizedBox(
                    height: 20),

                Center(

                  child: Image.asset(

                    widget.firstImage!,

                    height: 220,

                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(
                    height: 20),

              ],
            )

                : const SizedBox(),

            // first description bottom
            Text(

              isBangla
                  ? widget.descriptionBottomBn
                  : widget.descriptionBottomEn,

              textAlign:
              TextAlign.left,

              style: const TextStyle(

                fontFamily:
                "InriaSerif",

                fontSize: 20,

                height: 1.6,

                color:
                Colors.black87,
              ),
            ),

            const SizedBox(
                height: 40),

            // second heading
            Text(

              isBangla
                  ? widget.secondHeadingBn
                  : widget.secondHeadingEn,

              style: const TextStyle(

                fontFamily:
                "InriaSerif",

                fontSize: 34,

                fontWeight:
                FontWeight.bold,

                color:
                AppColors.button,
              ),
            ),

            const SizedBox(
                height: 10),

            // second description top
            Text(

              isBangla
                  ? widget.secondDescriptionTopBn
                  : widget.secondDescriptionTopEn,

              textAlign:
              TextAlign.left,

              style: const TextStyle(

                fontFamily:
                "InriaSerif",

                fontSize: 20,

                height: 1.6,

                color:
                Colors.black87,
              ),
            ),

            // second image
            widget.secondImage != null

                ? Column(

              children: [

                const SizedBox(
                    height: 20),

                Center(

                  child: Image.asset(

                    widget.secondImage!,

                    height: 220,

                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(
                    height: 20),

              ],
            )

                : const SizedBox(),

            // second description bottom
            Text(

              isBangla
                  ? widget.secondDescriptionBottomBn
                  : widget.secondDescriptionBottomEn,

              textAlign:
              TextAlign.left,

              style: const TextStyle(

                fontFamily:
                "InriaSerif",

                fontSize: 20,

                height: 1.6,

                color:
                Colors.black87,
              ),
            ),

          ],

        ),

      ),

      bottomNavigationBar: Container(

        height: 30,

        color: Colors.white,
      ),

    );
  }
}