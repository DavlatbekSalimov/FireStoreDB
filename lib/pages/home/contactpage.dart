// ignore_for_file: sort_child_properties_last

import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localdatatodu/model/contactmodel.dart';
import 'package:localdatatodu/pages/infopage/infopage.dart';
import 'package:localdatatodu/service/firestoreser.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  bool isLoading = false;

  List<QueryDocumentSnapshot<Map<String, dynamic>>> list = [];

  Future<void> getAllData() async {
    list = await CFSServise.readAllData(collectionPath: 'Contacts');
    isLoading = true;
    setState(() {});
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    var item = list[index].data();
                    return Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (contex) => ContactInfo(
                                name: item['name'],
                                adress: item['address'],
                                phonenumber: item['phonenumber'],
                                company: item['company'],
                              ),
                            ),
                          );
                        },
                        onLongPress: () {
                          showDialog(
                              context: context,
                              builder: (contex) {
                                return AlertDialog(
                                  content:
                                      const Text('Are you sure you want to'),
                                  actions: [
                                    CupertinoButton(
                                        child: const Text(
                                          'No',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        }),
                                    CupertinoButton(
                                        child: const Text(
                                          'Yes',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () async {
                                          await CFSServise.daleteContact(
                                              id: list[index].id,
                                              collectionPath: 'Contacts');
                                          setState(() {});
                                          await getAllData();
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        }),
                                  ],
                                );
                              });
                        },
                        leading: const CircleAvatar(
                          radius: 28,
                          child: Icon(
                            Icons.call,
                            color: Colors.green,
                          ),
                        ),
                        title: Text(item['name']),
                        subtitle: Text(item['phonenumber']),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showDialog(
              context: context,
              builder: (contex) {
                return const CreateContactDialog();
              });
        },
        child: const Icon(
          Icons.dialpad,
          color: Colors.white,
        ),
      ),
    );
  }
}

class CreateContactDialog extends StatefulWidget {
  const CreateContactDialog({
    super.key,
  });

  @override
  State<CreateContactDialog> createState() => _CreateContactDialogState();
}

class _CreateContactDialogState extends State<CreateContactDialog> {
  
  Future<void> create(Contact contact) async {
    await CFSServise.createCollection(
      collectionPath: 'Contacts',
      data: contact.toJson(),
    );
  }

  bool isID = false;
  bool isFav = false;
  final nameCtr = TextEditingController();
  final phonenumberCtr = TextEditingController();
  final adressCtr = TextEditingController();
  final companyCtr = TextEditingController();
  final idCtr = TextEditingController();
  final isFavCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextFild(
              controller: nameCtr,
              lefttext: 'Name',
              text: 'Username',
            ),
            const Gap(10),
            MyTextFild(
              controller: phonenumberCtr,
              lefttext: 'Number',
              text: 'phone number',
            ),
            const Gap(10),
            MyTextFild(
              controller: adressCtr,
              lefttext: 'Address',
              text: 'You Adress',
            ),
            const Gap(10),
            MyTextFild(
              controller: companyCtr,
              lefttext: 'Mobile Company',
              text: 'compnay',
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (isID) {
                        isID = false;
                      } else {
                        isID = true;
                      }
                    });
                  },
                  icon: isID
                      ? const Icon(
                          Icons.circle_outlined,
                          color: Colors.red,
                        )
                      : const Icon(
                          Icons.circle_rounded,
                          color: Colors.green,
                        ),
                  label: const Text('Default ID'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      if (isFav) {
                        isFav = false;
                      } else {
                        isFav = true;
                      }
                    });
                  },
                  icon: isFav
                      ? const Icon(
                          Icons.star_border,
                          color: Colors.amber,
                        )
                      : const Icon(
                          Icons.star,
                          color: Colors.black12,
                        ),
                  label: const Text('Favourites'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyanAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    await create(
                      Contact(
                          name: nameCtr.text,
                          phonenumber: phonenumberCtr.text,
                          address: adressCtr.text,
                          company: companyCtr.text,
                          id: isID ? Random().nextInt(100).toString() : '0',
                          isFavourite: isFav ? true : false),
                    );
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text('Save'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyTextFild extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final String lefttext;
  final void Function(String)? onChanged;
  const MyTextFild({
    super.key,
    required this.controller,
    required this.text,
    required this.lefttext,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lefttext,
          style: GoogleFonts.gideonRoman(
            textStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(hintText: text),
        ),
      ],
    );
  }
}
