// import 'dart:async';

// import 'package:app/pages/home.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:basic_utils/basic_utils.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class VerifyEmail extends StatefulWidget {
//   const VerifyEmail({super.key});

//   @override
//   State<VerifyEmail> createState() => _VerifyEmailState();
// }

// class _VerifyEmailState extends State<VerifyEmail> {
//   bool isEmailVerified = false;
//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

//     if (!isEmailVerified) {
//       sendVerificationEmial();

//       timer = Timer.periodic(
//         const Duration(seconds: 3),
//         (_) => checkEmialVerification(),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     timer?.cancel();
//     super.dispose();
//   }

//   Future checkEmialVerification() async {
//     //call after email verification
//     await FirebaseAuth.instance.currentUser!.reload();
//     setState(() {
//       isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });
//     if (isEmailVerified) timer?.cancel();
//   }

//   Future sendVerificationEmial() async {
//     final User = FirebaseAuth.instance.currentUser!;
//     await User.sendEmailVerification();
//   }

//   @override
//   Widget build(BuildContext context) => isEmailVerified
//       ? home()
//       : Scaffold(
//           appBar: AppBar(
//             title: Text("Verify Email"),
//           ),
//           body: Padding(
//             padding: EdgeInsets.all(19.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [Text("Verification email has been sent to your email address",
//               style:TextStyle(fontSize: 25),
//               textAlign: TextAlign.center )],
//             ),
//           ),
//         );
// }
