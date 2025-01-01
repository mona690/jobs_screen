import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobs_screen_task/app/home_cycle/widgets/job_wiget.dart';
import 'package:jobs_screen_task/services/helper/application_dimentions.dart';
import 'package:jobs_screen_task/services/helper/navigation_helper.dart';
import 'package:jobs_screen_task/styles/colors.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    AppDimentions().appDimentionsInit(context);

    return Scaffold(
      backgroundColor: white,
      body: Column(
        children: [
          // Header with Stack
          Stack(
            children: [
              Container(
                height: AppDimentions().appBarHeight * 2.5,
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: mainBlue,
                ),
              ),
              Positioned(
                top: 80,
                right: 20,
                left: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/notification.png',
                        width: 25, height: 25),
                    const SizedBox(width: 10),
                    Image.asset('assets/images/heart.png',
                        width: 25, height: 25),
                    const Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'اسامه دياب',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: 'MadaniArabic'
                          ),
                        ),
                        Text(
                          'المسمى الوظيفي',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          fontWeight: FontWeight.w500,
                            fontFamily: 'MadaniArabic'
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Image.asset(
                      'assets/images/person.png',
                      width: 40,
                      height: 40,
                    ),
                  ],
                ),
              ),
            ],
          ),

          // Content Section
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),

                    // Banner
                    Stack(
                      children: [
                        // Background Container with a border radius
                        Container(
                          height: AppDimentions().appBarHeight * 2.5,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(8), // Rounded corners
                            color: const Color.fromARGB(255, 72, 72, 72),
                          ),
                        ),

                        // Image with border radius applied
                        ClipRRect(
                          borderRadius: BorderRadius.circular(
                              8), // Match the parent container
                          child: Image.asset(
                            'assets/images/first.png',
                            height: AppDimentions().appBarHeight * 2,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),

                        // Text container with gradient and border radius
                        Positioned(
                          bottom: 0, // Adjusted to stick to the bottom
                          right: 0,
                          left: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(0.1),
                                  Colors.black,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8),
                                bottomRight: Radius.circular(
                                    8), // Rounded corners only at bottom
                              ),
                            ),
                            child: const Text(
                              'افضل تطبيق لايجاد الوظيفة المناسبة',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                 
                            fontFamily: 'MadaniArabic'),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
// Bottom Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'الكل',
                          style: TextStyle(
                            color: mainBlue,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'MadaniArabic'
                          ),
                        ),
                        Text(
                          'الوظائف التى تناسبك',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                           
                            fontFamily: 'MadaniArabic'
                          ),
                        ),
                      ],
                    ),

                    // Jobs List
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: const JobWidget(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
