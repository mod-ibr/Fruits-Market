import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:fruits_market/core/constants.dart';
import 'package:fruits_market/features/Auth/data/repositories/auth_repo_impl.dart';
import 'package:fruits_market/features/Auth/presentation/pages/login/login_view.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: const Text.rich(
          TextSpan(
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 25,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            children: [
              TextSpan(
                text: 'F',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextSpan(
                text: 'ruit Market',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          textAlign: TextAlign.left,
        ),
        actions: [
          IconButton(
              onPressed: () async {
                AuthRepoImpl auth = AuthRepoImpl();
                await auth.logOut().then((value) => Get.offAll(LoginView()));
              },
              icon: Icon(
                FontAwesomeIcons.arrowRightFromBracket,
                color: Colors.red[900],
              ))
        ],
      ),
    );
  }
}
