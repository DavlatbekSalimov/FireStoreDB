import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:localdatatodu/pages/home/inboxpage.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //! save data
  // static SharedPreferences? sharedPreferences;
  // loadSharedPreferences() async {
  //   sharedPreferences = await SharedPreferences
  //       .getInstance(); //Instantiating the object of SharedPreferences class.
  // }

  List<StringBuffer> list = [];
  StringBuffer element = StringBuffer();
  final egctr = TextEditingController();
  final descriptionctr = TextEditingController();
  @override
  // void initState() {
  //   loadSharedPreferences();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              //! appbar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                        ),
                      ),
                      Text(
                        'Best platform for creating to-do lists',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      size: 30,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: SizedBox(
                  height: 200,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.greenAccent),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 30,
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    filltask(context);
                                  },
                                  icon: const Card(
                                    child: Icon(
                                      Icons.add,
                                      size: 35,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Tap plus to create a new task',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 30,
                            ),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Add your task',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black38,
                                ),
                              ),
                              Text(
                                'Today . Mon 20 Jul 2022  ',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.black38,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (contex) => InboxPage(elementlar: list),
      //     ),
      //   );
      // }),
    );
  }

  Future<dynamic> filltask(BuildContext context) {
    return showModalBottomSheet(
        useSafeArea: true,
        // scrollControlDisabledMaxHeightRatio: 0.8,
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Column(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  TextField(
                    controller: egctr,
                    decoration: const InputDecoration(
                      hintText: 'eg : Meeting with client',
                    ),
                  ),
                  TextField(
                    decoration: const InputDecoration(hintText: 'Description'),
                    controller: descriptionctr,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.arrow_downward_rounded,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          element.write(egctr.text + descriptionctr.text);
                          setState(() {});
                          showModalBottomSheet(
                              scrollControlDisabledMaxHeightRatio: 0.7,
                              context: context,
                              builder: (contex) {
                                return SizedBox(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 20,
                                      // vertical: 10,
                                    ),
                                    child: Column(
                                      children: [
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Lefttext(
                                              text: 'Today',
                                            ),
                                            Righttext(
                                              text: '4 Apr 2022',
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Lefttext(
                                              text: 'Tomorrow ',
                                            ),
                                            Righttext(
                                              text: 'Sat',
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Lefttext(
                                              text: 'This weekend ',
                                            ),
                                            Righttext(
                                              text: 'Mon ',
                                            ),
                                          ],
                                        ),
                                        const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Lefttext(
                                              text: 'Next weekend ',
                                            ),
                                            Righttext(
                                              text: '10 Apr 2022 ',
                                            ),
                                          ],
                                        ),
                                        CalendarDatePicker(
                                            initialDate: DateTime(2020),
                                            firstDate: DateTime(2000),
                                            lastDate: DateTime(2026),
                                            onDateChanged: (DateTime data) {
                                              element.write(data.day
                                                  .toString()
                                                  .padLeft(2, '0'));
                                              element.write(data.month
                                                  .toString()
                                                  .padLeft(2, '0'));
                                              element.write(data.year);
                                              setState(() {});
                                            }),
                                        //CalendarCarousel()
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              height: 50,
                                              width: 150,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      builder: (contex) {
                                                        return Dialog(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              TimePickerSpinner(
                                                                is24HourMode:
                                                                    false,
                                                                spacing: 50,
                                                                itemHeight: 80,
                                                                isForce2Digits:
                                                                    true,
                                                                onTimeChange:
                                                                    (p0) {},
                                                              ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceAround,
                                                                children: [
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      element.write(
                                                                          '0${Random().nextInt(12)}:${Random().nextInt(60)}');
                                                                      // listga shared
                                                                      // List<String>
                                                                      //     listsh =
                                                                      //     [
                                                                      //   element
                                                                      //       .toString()
                                                                      // ];
                                                                      list.add(
                                                                          element);
                                                                      // DBservice.setStList(
                                                                      //     key:
                                                                      //         'task',
                                                                      //     value:
                                                                      //         list!);
                                                                      // element
                                                                      //     .clear();
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (contex) =>
                                                                              InboxPage(elementlar: list),
                                                                        ),
                                                                      );
                                                                      // setState(
                                                                      //     () async {
                                                                      //   await sharedPreferences!.setStringList(
                                                                      //       'list',
                                                                      //       listsh);
                                                                      // });
                                                                    },
                                                                    child: const Text(
                                                                        'save'),
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed:
                                                                        () {
                                                                      Navigator.pop(
                                                                          context);
                                                                    },
                                                                    child: const Text(
                                                                        'Close'),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                ),
                                                child: const Text(
                                                  '+ Add time',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  backgroundColor:
                                                      const Color(0xFF24A19C),
                                                ),
                                                child: const Text('Reschedule'),
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.alarm,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.flag,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}

class Righttext extends StatelessWidget {
  final String text;
  const Righttext({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Colors.black38,
      ),
    );
  }
}

class Lefttext extends StatelessWidget {
  final String text;
  const Lefttext({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
