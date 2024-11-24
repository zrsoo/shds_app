import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// TODO:
// 1.) Remove text in the middle.                       DONE
// 2.) Add button in the middle with devil image.       DONE
// 3.) Implement click event.
//    Click event should:
//    - get total number of pics in assets/images;
//    - generate random N between 1 and <nr_imgs>;
//    - set phone normal background (not lock screen) to the Nth image;
//    - close the app;
// x.) When app is done, 1NfeCt it.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  late List<String> wallpaperPaths = [];
  final random = Random();

  @override
  void initState() {
    super.initState();
    loadWallpapers();
  }

  // Load the json from file
  Future<void> loadWallpapers() async {
    final String jsonString = await rootBundle.loadString('assets/images/json/wallpapers.json');

    setState(() {
      wallpaperPaths = List<String>.from(json.decode(jsonString));
    });
  }

  // Select random photo from list, display it, and then delete from list
  void showRandomWallpaperForDuration(BuildContext context, int durationInSeconds) {
    String randomWallpaperPath = wallpaperPaths[random.nextInt(wallpaperPaths.length)];

    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) =>
          ImageScreen(wallpaperPath: randomWallpaperPath)),
    );

    // Duration delay
    Future.delayed(Duration(seconds: durationInSeconds), () {
      if(context.mounted) {
        Navigator.of(context).pop();
      }

      wallpaperPaths.remove(randomWallpaperPath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image:
            AssetImage('assets/images/icons/dracu.png'), // Path to your image
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade700
                        .withOpacity(0.1), // Background color
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5), // Shadow color
                        spreadRadius: 100, // How far the shadow spreads
                        blurRadius: 100, // Softness of the shadow
                        offset: const Offset(2, 4), // Position of the shadow
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {
                      showRandomWallpaperForDuration(context, 4);
                    },
                    style: const ButtonStyle(),
                    icon: SizedBox(
                        width: 115,
                        height: 115,
                        child: Image.asset('assets/images/icons/dracu_icon.png')),
                    padding: const EdgeInsets.all(20.0),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.wallpaperPath});

  final String wallpaperPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(wallpaperPath),
      ),
    );
  }
}