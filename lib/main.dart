import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

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
                    onPressed: () {},
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
