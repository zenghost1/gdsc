import 'package:flutter/material.dart';


class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  static const String routeName = '/error';

  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const ErrorScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Something went wrong! Try Again Maybe?',
              style: TextStyle(fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(const Color(0xFFFFBD73)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        side: BorderSide(color: Color(0xFFFFBD73))))),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '  Try Again  ',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
