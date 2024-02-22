import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_code_scanner/theme.dart';

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
      home: const MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  Color _buttonColor = const Color(0xFF34DD5A);

  void _changeColor() {
    setState(() {
      _buttonColor = _buttonColor == const Color(0xFF34DD5A)
          ? const Color(0xFF829286)
          : const Color(0xFF34DD5A);
    });
  }

  Widget _buildButton() {
    return ElevatedButton(
      onPressed: _changeColorAndShowModal,
      style: ElevatedButton.styleFrom(
        backgroundColor: _buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 39, vertical: 19),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: _buildButtonChild(),
    );
  }

  Widget _buildButtonChild() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/qr_icon.png',
          width: 35,
          height: 33,
        ),
        const SizedBox(width: 5),
        _buildButtonText(),
      ],
    );
  }

  Widget _buildButtonText() {
    return Text(
      'Scan QR Code',
      style: TextStyle(
        color: Colors.white,
        fontSize: 26,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
    );
  }

  void _changeColorAndShowModal() {
    _changeColor();
    showModalBottomSheet(
      context: context,
      builder: _buildModalContent,
    );
  }

  Widget _buildModalContent(BuildContext context) {
    return Container(
      height: 290,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
      child: _buildModalChildren(),
    );
  }

  Widget _buildModalChildren() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Update Photo',
              style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w500, color: textColor)),
          const SizedBox(height: 12),
          const Text('You are only able to change the picture profile once',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: textColorSecondary)),
          const SizedBox(height: 30),
          _buildContinueButton(),
        ],
      ),
    );
  }

  Widget _buildContinueButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        minimumSize: const Size(224, 55),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: const Text('Continue', style: TextStyle(fontSize: 16)),
      onPressed: () => Navigator.pop(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildTitleText(),
            const SizedBox(height: 120),
            _buildQrImage(),
            const SizedBox(height: 73.72),
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitleText() {
    return Text('Scan your QR Code',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w900,
          fontSize: 30,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ));
  }

  Widget _buildQrImage() {
    return Image.asset(
      'assets/images/qr.png',
      width: 346.28,
      height: 372.28,
    );
  }
}
