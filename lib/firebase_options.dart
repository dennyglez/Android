// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBMjEzHaHHXDfsQIFTj5pW8WTtYA6r97Pg',
    appId: '1:429319722968:web:b490dbaab282c6dff4c4ad',
    messagingSenderId: '429319722968',
    projectId: 'flutter-db-16253',
    authDomain: 'flutter-db-16253.firebaseapp.com',
    storageBucket: 'flutter-db-16253.appspot.com',
    measurementId: 'G-S6SH11V999',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBKc4ersfclOp2WGycv3Ig4SXe5ObhQdJc',
    appId: '1:429319722968:android:e5a2a05203ed6decf4c4ad',
    messagingSenderId: '429319722968',
    projectId: 'flutter-db-16253',
    storageBucket: 'flutter-db-16253.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCx2isAkojgVhSzkLUNipfAH4tkXswlWuk',
    appId: '1:429319722968:ios:33fbe61e0a193f09f4c4ad',
    messagingSenderId: '429319722968',
    projectId: 'flutter-db-16253',
    storageBucket: 'flutter-db-16253.appspot.com',
    iosBundleId: 'com.example.ejercicio',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCx2isAkojgVhSzkLUNipfAH4tkXswlWuk',
    appId: '1:429319722968:ios:33fbe61e0a193f09f4c4ad',
    messagingSenderId: '429319722968',
    projectId: 'flutter-db-16253',
    storageBucket: 'flutter-db-16253.appspot.com',
    iosBundleId: 'com.example.ejercicio',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBMjEzHaHHXDfsQIFTj5pW8WTtYA6r97Pg',
    appId: '1:429319722968:web:db8ab7f3dabf9af1f4c4ad',
    messagingSenderId: '429319722968',
    projectId: 'flutter-db-16253',
    authDomain: 'flutter-db-16253.firebaseapp.com',
    storageBucket: 'flutter-db-16253.appspot.com',
    measurementId: 'G-TG5EFJXLQK',
  );
}
