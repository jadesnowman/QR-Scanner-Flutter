import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Scan your QR Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                  )),
              const SizedBox(
                height: 120,
              ),
              Image.asset(
                'assets/images/qr.png',
                width: 346.28,
                height: 372.28,
              ),
              const SizedBox(
                height: 73.72,
              ),
              Center(
                child: ElevatedButton(
                    onPressed: () {
                      print('Button Pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF34DD5A),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 39, vertical: 19),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/qr_icon.png',
                          width: 35,
                          height: 33,
                        ),
                        const SizedBox(
                            width: 5), // Adjust spacing between image and text
                        Text(
                          'Scan QR Code',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontFamily: GoogleFonts.roboto().fontFamily),
                        ),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
