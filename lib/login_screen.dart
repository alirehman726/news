import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:news/home.dart';
import 'package:news/tabbar.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Flutter Google Login'),
      // ),
      body: Container(
        alignment: Alignment.center,
        child: _buildWidget(),
      ),
    );
  }

  _buildWidget() {
    // bool isSignedIn = false;
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => TabBarScreen()));

      // return Padding(
      //   padding: EdgeInsets.all(12.0),
      //   child: Column(
      //     children: [
      //       ListTile(
      //         leading: GoogleUserCircleAvatar(identity: user),
      //         title: Text(user.displayName ?? ''),
      //         subtitle: Text(user.email),
      //       ),
      //       const SizedBox(height: 20),
      //       const Text(
      //         'Signed in Successfully',
      //         style: TextStyle(fontSize: 20),
      //       ),
      //       const SizedBox(height: 10),
      //       ElevatedButton(
      //         onPressed: signOut,
      //         child: Text('Sign out'),
      //       )
      //     ],
      //   ),
      // );
    } else {
      return Padding(
        padding: EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              'You are signed in',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: signIn,
              child: Text('Google Sign in'),
            )
          ],
        ),
      );
    }
  }

  void signOut() {
    _googleSignIn.disconnect();
  }

  Future<void> signIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      print('Error signin in $e');
    }
  }
}
