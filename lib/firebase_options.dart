// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBjJIR_BvrtSnlP0VRlHDBVs-n6ak8hdkI',
    appId: '1:297136520798:web:8444158f8853be4cb4fecf',
    messagingSenderId: '297136520798',
    projectId: 'fruit-market-b0232',
    authDomain: 'fruit-market-b0232.firebaseapp.com',
    storageBucket: 'fruit-market-b0232.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJggo1DhAs94bklEY1AkkTp0qR8-7ppuE',
    appId: '1:297136520798:android:81e9b43bb8c1f6b4b4fecf',
    messagingSenderId: '297136520798',
    projectId: 'fruit-market-b0232',
    storageBucket: 'fruit-market-b0232.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAGayAv_h6RJzmtwJYuUn1lizig3W_mRmY',
    appId: '1:297136520798:ios:fe54e268d76ffdcdb4fecf',
    messagingSenderId: '297136520798',
    projectId: 'fruit-market-b0232',
    storageBucket: 'fruit-market-b0232.appspot.com',
    iosClientId: '297136520798-pqqtuqskr004oevr9vnqdl1tpgqtki2l.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitsMarket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAGayAv_h6RJzmtwJYuUn1lizig3W_mRmY',
    appId: '1:297136520798:ios:fe54e268d76ffdcdb4fecf',
    messagingSenderId: '297136520798',
    projectId: 'fruit-market-b0232',
    storageBucket: 'fruit-market-b0232.appspot.com',
    iosClientId: '297136520798-pqqtuqskr004oevr9vnqdl1tpgqtki2l.apps.googleusercontent.com',
    iosBundleId: 'com.example.fruitsMarket',
  );
}
