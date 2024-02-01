import 'package:delivery/componants/componants.dart';
import 'package:delivery/modules/login.dart';
import 'package:delivery/modules/onBoarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quick_actions/quick_actions.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    initializeQuickActions();
    super.initState();
  }

  initializeQuickActions() {
    QuickActions quickActions = const QuickActions();
    quickActions.initialize((String shortcutType) {
      switch (shortcutType) {
        case 'First Page Screen':
          navigate(context,onBoarding());
          return;
        case 'Second Page Screen':
          navigate(context,LoginSignupScreen());
          return;
        default:
          navigate(context,MainPage());
          return;
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      const ShortcutItem(
        type: 'First Page Screen',
        localizedTitle: 'First Page',
        icon: 'image1',
      ),
      const ShortcutItem(
        type: 'Second Page Screen',
        localizedTitle: 'Second Page',
        icon: 'image1',
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(
            children: [
            ],
          ),
        ),
      ),
    );
  }
}
