import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timelines/timelines.dart';
import 'package:velocity_x/velocity_x.dart';

class Education extends StatefulWidget {
  const Education({Key? key}) : super(key: key);

  @override
  State<Education> createState() => _EducationState();
}

class _EducationState extends State<Education> {
  List edu = [
    {
      "year": "2017",
      "class": "Matric",
      "name": "Shan Grammar School",
    },
    {
      "year": "2019",
      "class": "Intermediate",
      "name": "Aisha Bawany Government College",
    },
    {
      "year": "2024",
      "class": "Bachelors in Computer Science",
      "name": "Sir Syed University of Engineering & Technology Karachi",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        // margin: const EdgeInsets.only(
        //   top: 20.0,
        // ),
        width: context.screenWidth < 900
            ? context.screenWidth * 0.9
            : context.screenWidth < 1600
                ? context.screenWidth * 0.5
                : context.screenWidth * 0.4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            20.0,
          ),
        ),
        padding: const EdgeInsets.all(30.0),
        // height: 800.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            10.h.heightBox,
            // Text(
            //   "Education",
            //   style: GoogleFonts.josefinSans(
            //     fontWeight: FontWeight.w900,
            //     height: 1.3,
            //     fontSize: 35.sp,
            //   ),
            // ),
            //
            20.h.heightBox,

            Timeline.tileBuilder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              builder: TimelineTileBuilder.fromStyle(
                itemCount: edu.length,
                contentsAlign: ContentsAlign.alternating,
                contentsBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${edu[index]['year']}",
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.indigo,
                            ),
                          ),
                          Text(
                            "${edu[index]['class']}",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "${edu[index]['name']}",
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
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
