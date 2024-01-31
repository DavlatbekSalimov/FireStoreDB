import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localdatatodu/pages/home/contactpage.dart';

class ContactInfo extends StatefulWidget {
  final String name;
  final String adress;
  final String phonenumber;
  final String company;

  const ContactInfo(
      {super.key,
      required this.name,
      required this.adress,
      required this.phonenumber,
      required this.company});

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        //! updare button
        actions:  [
          UserInfoEditWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person,
                      size: 40,
                    ),
                  ),
                  Text(
                    widget.name.toString(),
                    style: GoogleFonts.flamenco(
                      textStyle: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Gap(20),
                ],
              ),
            ),
            MyUserInfoCase(
              widget: widget,
              lefttext: 'Phone number',
              text: widget.phonenumber,
            ),
            const Gap(20),
            MyUserInfoCase(
              widget: widget,
              lefttext: 'Address',
              text: widget.adress,
            ),
            const Gap(20),
            MyUserInfoCase(
              widget: widget,
              lefttext: 'Company',
              text: widget.company,
            ),
            const Gap(20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('ID'),
                Text('follow'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class UserInfoEditWidget extends StatelessWidget {
   UserInfoEditWidget({
    super.key,
  });
  
  //! controller

  final nameController = TextEditingController();
  final phoneNumController = TextEditingController();
  final adressController = TextEditingController();
  final companycontroller = TextEditingController();
  final idController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
            context: context,
            builder: (contex) {
              return Dialog(
                child: Column(
                  children: [
                    MyTextFild(
                        controller: nameController,
                        text: '....',
                        lefttext: 'Edit Name')
                  ],
                ),
              );
            });
      },
      icon: const Icon(
        Icons.edit_note_outlined,
        size: 35,
      ),
    );
  }
}

class MyUserInfoCase extends StatelessWidget {
  final String lefttext;
  final String text;
  const MyUserInfoCase({
    super.key,
    required this.widget,
    required this.lefttext,
    required this.text,
  });

  final ContactInfo widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lefttext,
          style: GoogleFonts.secularOne(
            textStyle: const TextStyle(fontSize: 20),
          ),
        ),
        SizedBox(
          height: 55,
          width: double.infinity,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Center(
              child: Text(
                text,
                style: GoogleFonts.sen(
                  textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
