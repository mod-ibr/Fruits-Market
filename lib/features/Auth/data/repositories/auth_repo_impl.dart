import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fruits_market/features/Auth/domain/models/user_model.dart';
import 'package:fruits_market/features/Auth/domain/repositories/auth_repo.dart';
import 'package:fruits_market/features/main%20Page/presentation/mainPageView.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Exception, UserModel>> completeInformation(
      {String? name,
      String? phoneNumber,
      String? address,
      UserModel? user}) async {
    try {
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      UserModel userModel = UserModel(
          email: user!.email,
          name: name,
          phonNumber: phoneNumber,
          address: address);
      await users.add(userModel.toJson());
      return Right(userModel);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, UserModel>> loginWithFacebook() async {
    try {
      // Trigger the sign-in flow
      final LoginResult loginResult = await FacebookAuth.instance.login();

      // Create a credential from the access token
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithCredential(facebookAuthCredential);
      // Once signed in, return the UserCredential
      return Right(UserModel(
        email: userCredential.user!.email!,
      ));
    } catch (e) {
      return Left(Exception('someting went wrong'));
    }
  }

  @override
  Future<Either<Exception, UserModel>> loginWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      UserCredential? userCredential = await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) {
        Get.offAll(() => const MainPage(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.rightToLeft);
      });

      return Right(UserModel(
        email: userCredential!.user!.email!,
      ));
    } catch (e) {
      return Left(Exception('something went wrong'));
    }
  }

  @override
  Future logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
