import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(left: 24.0, top: 68.0, right: 24.0),
            width: 326,
            height: 54,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const <Widget>[
                        //SvgPicture.asset('assets/images/small_left.svg',color: const Color.fromRGBO(196, 196, 196, 1),),
                        //SizedBox(width: 16,),
                        Text(
                          "Welcome!",
                          style: TextStyle(
                              color: Color.fromRGBO(25, 26, 25, 1),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w700,
                              fontSize: 21,
                              fontFamily: 'Nunito'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color.fromRGBO(237, 28, 36, 1),
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              fontFamily: 'Nunito'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 4,
                ),
                Container(
                  //padding: const EdgeInsets.only(left: 25,),
                  child: const Text(
                    "Sign in to continue",
                    style: TextStyle(
                        color: Color.fromRGBO(196, 196, 196, 1),
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Nunito'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24.0,
              right: 24,
            ),
            width: 327,
            height: 168,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Email Address",
                  style: TextStyle(
                      color: Color.fromRGBO(196, 196, 196, 1),
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Nunito'),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 156,
                        height: 48,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            labelText: 'Email',
                            hintText: 'Enter Your EmailAddress',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Password(),
                const SizedBox(
                  height: 8,
                ),
                InputPassword(),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24.0,
              right: 24,
            ),
            width: 327,
            height: 36,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 107,
                  height: 20,
                  child: InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => ForgotPassword()),
                      // );
                    },
                    child: const Text(
                      "Forgot Password",
                      style: TextStyle(
                          color: Color.fromRGBO(237, 28, 36, 1),
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          fontFamily: 'Nunito'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24.0,
              right: 24,
            ),
            width: 327,
            height: 48,
            child: Button(),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 24.0,
              right: 24,
            ),
            width: 327,
            height: 48,
            child: RegisterGoogle(),
          ),
          // RegisterGoogle(),
        ],
      ),
    );
  }
}

class Password extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 91,
      height: 20,
      child: Text(
        "Password",
        style: TextStyle(
            color: Color.fromRGBO(196, 196, 196, 1),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Nunito'),
      ),
    );
  }
}

class InputPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 48,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 3,
              )),
          labelText: 'Password',
          hintText: 'Input your Password',
        ),
        style: const TextStyle(
            color: Color.fromRGBO(196, 196, 196, 1),
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: 'Nunito'),
      ),
    );
  }
}

class Button extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 50,
      child: OutlinedButton(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
        child: const Text(
          'Continue',
          style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w600),
        ),
       // color: const Color.fromRGBO(196, 196, 196, 1),
       // textColor: Colors.white,
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => Home()),
          // );
        },
      ),
    );
  }
}

class RegisterGoogle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327,
      height: 50,
      child: OutlinedButton(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        //   side: const BorderSide(
        //       width: 1,
        //       style: BorderStyle.solid,
        //       color: Color.fromRGBO(223, 222, 228, 1)),
        // ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/google.svg',
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Or continue with Google",
              style: TextStyle(
                  color: Color.fromRGBO(196, 196, 196, 1),
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  fontFamily: 'Nunito'),
            ),
          ],
        ),
        //textColor: Colors.blue,
        onPressed: () {},
      ),
    );
  }
}
