import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hngx_stage_two/edit_details.dart';
import 'package:hngx_stage_two/provider.dart';
import 'main_page.dart';
import 'constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        textTheme:  const TextTheme(
          // This sets the default text color to white
          bodyLarge: TextStyle(color: Colors.white),
          bodyMedium: TextStyle(color: Colors.white),
          // You can also set other text styles like headline, subtitle, etc.
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = const [
    MainPage(),
    EditDetails()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Constants.backgroundColor,
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index){
              DataProvider.currentIndex = index;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.edit),
                  label: 'Modify Details'
              ),
            ],
            backgroundColor: Constants.alternateColor,
            selectedIconTheme: const IconThemeData(color: Colors.green),
            selectedItemColor: Colors.white,
            selectedLabelStyle: const TextStyle(color: Colors.white),
            unselectedIconTheme: const IconThemeData(color: Colors.green),
            unselectedItemColor: Colors.white,
            unselectedLabelStyle:  const TextStyle(color: Colors.white),
            type: BottomNavigationBarType.fixed,
          ),
          body: pages[DataProvider.currentIndex]

        )
    );
  }
}





