import 'package:flutter/material.dart';
import 'package:jobs_screen_task/styles/colors.dart';

class JobWidget extends StatelessWidget {
  const JobWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double rating = 4;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: grey, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const ImageIcon(
                AssetImage("assets/images/favourite.png"),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        ' اسم الشركة',
                        style: TextStyle(
                            color: black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'MadaniArabic'),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Display the rating value
                          Text(
                            '$rating',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontFamily: 'MadaniArabic'),
                          ),
                          SizedBox(width: 8),
                          // Display 5 stars
                          ...List.generate(
                              5,
                              (index) => Icon(
                                    Icons.star,
                                    color: index < rating.floor()
                                        ? Colors.yellow
                                        : Colors
                                            .grey, // Yellow for filled stars, gray for empty stars
                                    size: 20,
                                  )),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Image.asset('assets/images/compony-image.png',
                      width: 30, height: 30)
                ],
              ),
              SizedBox(
                width: 3,
              )
            ],
          ),
          Divider(
             endIndent: 0.0,
            color: grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: mainBlue, width: 1)),
                child: Text(
                  'التفاصيل',
                  style: TextStyle(
                      color: mainBlue,
                      fontWeight: FontWeight.w500,
                       fontFamily: 'MadaniArabic'),
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'الرياض,السعودية',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                           fontWeight: FontWeight.w500,
                            fontFamily: 'MadaniArabic'),
                      ),
                      Text(
                        '1500\$:2000\$',
                        style: TextStyle(
                            color: mainBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MadaniArabic'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
