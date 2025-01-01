import 'dart:io';

import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:jobs_screen_task/app/messages_cycle/views/messages_screen.dart';
import 'package:jobs_screen_task/app/home_cycle/views/explore_screen.dart';
import 'package:jobs_screen_task/app/jobs_cycle/views/jobs_screen.dart';
import 'package:jobs_screen_task/app/profile_cycle/views/profile_screen.dart';
import 'package:jobs_screen_task/app/settings_cycle/views/setting_screen.dart';
import 'package:jobs_screen_task/styles/colors.dart';
import 'package:jobs_screen_task/widget/yes_no_dialog.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _currentIndex = 0;

  final iconList = <Widget>[
    const ImageIcon(
      AssetImage("assets/images/arrange-circle-2.png"),
    ),
    const ImageIcon(
      AssetImage("assets/images/task-square.png"),
    ),
    const ImageIcon(
      AssetImage("assets/images/Vector.png"),
    ),
    const ImageIcon(
      AssetImage("assets/images/messages.png"),
    ),
    const ImageIcon(
      AssetImage("assets/images/profile.png"),
    ),
  ];

  final List<String> labels = ["خدمات", "وظائفى", "تصفح", "المحادثات", "حسابى"];

  final List<Widget> _screens = [
    const SettingScreen(),
    const JobsScreen(),
    const ExploreScreen(),
    const MessageScreen(),
    const ProfileScreen(),
  ];
  //*
  //*

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final didPop = await showDialog<bool>(
          barrierDismissible: false,
          context: context,
          builder: (context) => YesNoDialog(
            dialogText: 'Are you sure you want to exit the jobs app?',
            onYesPressed: () {
              // Exit the app
              exit(0);
            },
            onNoPressed: () {
              Navigator.of(context)
                  .pop(false); // Return false to indicate not to pop
            },
          ),
        );

        return didPop ?? false; // Return true to pop, false to stay
      },
      child: Scaffold(
        backgroundColor: white,
        body: _screens[_currentIndex],
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30.0)),
            child: AnimatedBottomNavigationBar.builder(
              elevation: 1,
              itemCount: iconList.length,
              activeIndex: _currentIndex,
              gapLocation: GapLocation.end,
              gapWidth: 1,
              notchSmoothness: NotchSmoothness.verySmoothEdge,
              tabBuilder: (int index, bool isActive) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive ? mainBlue : Colors.transparent,
                      ),
                      child: Center(
                        child: iconList[index] is Icon
                            ? Icon(
                                (iconList[index] as Icon).icon,
                                size: 25,
                                color: isActive ? mainBlue : Colors.grey,
                              )
                            : ImageIcon(
                                (iconList[index] as ImageIcon).image,
                                size: 25,
                                color: isActive ? mainBlue : Colors.grey,
                              ),
                      ),
                    ),
                    Text(
                      labels[index],
                      style: TextStyle(
                          color: isActive ? mainBlue : Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Hacen-Maghreb-Lt'
                          ),
                    ),
                  ],
                );
              },
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
