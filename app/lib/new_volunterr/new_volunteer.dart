import 'dart:io';
import 'package:app/pages/forgot.dart';
import 'package:app/pages/home.dart';
import 'package:app/login_reg/registration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirebaseUploadPage extends StatefulWidget {
  @override
  _FirebaseUploadPageState createState() => _FirebaseUploadPageState();
}

class _FirebaseUploadPageState extends State<FirebaseUploadPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _data;
  File _image;

  Future<void> _uploadData() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    final StorageReference storageReference =
        FirebaseStorage.instance.ref().child("data_images");

    final StorageUploadTask uploadTask = storageReference.putFile(
      _image,
      StorageMetadata(
        contentType: "image/jpeg",
        customMetadata: <String, String>{
          "data": _data,
        },
      ),
    );

    await uploadTask.onComplete;

    print("Upload complete");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Upload"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(labelText: "Data"),
              validator: (value) {
                if (value.isEmpty) {
                  return "Please enter some data";
                }
                return null;
              },
              onSaved: (value) => _data = value,
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              onPressed: () async {
                await ImagePicker.pickImage(source: ImageSource.gallery)
                    .then((image) {
                  setState(() {
                    _image = image;
                  });
                });
              },
              child: Text("Choose Image"),
            ),
            SizedBox(height: 16.0),
            RaisedButton(
              onPressed: _uploadData,
              child: Text("Upload"),
            ),
          ],
        ),
      ),
    );
  }
}
