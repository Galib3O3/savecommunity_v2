import 'package:flutter/material.dart';
import 'package:app/function/user_func.dart';
import 'package:app/pages/homepage.dart';
import 'package:app/login_reg/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class get_d extends StatefulWidget {
  const get_d({super.key});

  @override
  State<get_d> createState() => _get_dState();
}

class _get_dState extends State<get_d> {
  final CollectionReference firebase =
      FirebaseFirestore.instance.collection("sylhet");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Areas")),
        body: StreamBuilder(
          stream: firebase.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            }
            return ListView(
              children: snapshot.data!.docs.map((document) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Info(document)));
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        document["name"],
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      subtitle: Text(document["name"]),
                      leading: Icon(
                        Icons.book_sharp,
                        size: 40,
                        color: Colors.red,
                      ),
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ));
  }
}

class Info extends StatelessWidget {
  final data;
  Info(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Areas")),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 15.0),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Text(
                    data["Balaganj"],
                    style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'roboto'),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Companigonj"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Dokkhin Surma"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Fenchuganj"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Golapgonj"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Jaintapur"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Kanaighat"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Osmani Nagar"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Sylhet Sadar"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),
               Column(
                children: [
                  SizedBox(height: 15.0),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Text(
                        data["Zakiganj"],
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'roboto'),
                      ),
                    ),
                  ),
                ],
              ),

             
            ],
          )
        ],
      ),
    );
  }
}
