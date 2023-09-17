import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'PsychosupportMk App',
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/kviz': (context) => QuizPage(),
      '/psiholozi': (context) => PsychologistsPage(),
    },
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Psychosupport App'),
      ),
      body: Center(
        color: Colors.pink, // Set the background color to pink 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
	    Image.asset(
                         "assets/images/2.png",
                         height: 100,
                         width: 100,
                       ),
            Text(
              'Welcome to the Psychosupport App!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the login page
                Navigator.pushNamed(context, '/login').then((result) {
                    // After login, check the result (e.g., if the user is logged in)
                    if (result == true) {
                      // Navigate to the psychologists page
                      Navigator.pushNamed(context, '/psiholozi');
                    };
              },
              child: Text('Login', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the register page
                Navigator.pushNamed(context, '/register');
              },
              child: Text('Register', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
